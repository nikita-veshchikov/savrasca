/*
 ****************************************************************************
 *
 * simulavr - A simulator for the Atmel AVR family of microcontrollers.
 * Copyright (C) 2001, 2002, 2003   Klaus Rudolph
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 ****************************************************************************
 *
 *  $Id$
 */

#include <iostream>
using namespace std; // used for string class

#include "hwport.h"
#include "avrdevice.h"
#include "avrerror.h"
#include <assert.h>

HWPort::HWPort(AvrDevice *core, const string &name, bool portToggle, int size):
    Hardware(core),
    TraceValueRegister(core, "PORT" + name),
    myName(name),
    portSize(size),
    portToggleFeature(portToggle),
    port_reg(this, "PORT",
             this, &HWPort::GetPort, &HWPort::SetPort),
    pin_reg(this, "PIN",
            this, &HWPort::GetPin, &HWPort::SetPin),
    ddr_reg(this, "DDR",
            this, &HWPort::GetDdr, &HWPort::SetDdr)
{
    assert((portSize >= 1) && (portSize <= sizeof(p)/sizeof(p[0])));
    portMask = (unsigned char)((1 << portSize) - 1);

    for(unsigned int tt = 0; tt < portSize; tt++) {
        // register pin to give access to pin by name
        string dummy = name + (char)('0' + tt);
        core->RegisterPin(dummy, &p[tt]);
        // connect to output pin
        p[tt].mask = 1 << tt;
        p[tt].pinOfPort= &pin;
        // register pin output trace
        string tname = GetTraceValuePrefix() + name + (char)('0' + tt) + "-Out";
        pintrace[tt] = new TraceValueOutput(tname);
        pintrace[tt]->set_written(Pin::TRISTATE); // initial output driver state is tristate
        RegisterTraceValue(pintrace[tt]);
    }

    Reset();
}

HWPort::~HWPort() {
    for(int tt = portSize - 1; tt >= 0; tt--) {
        UnregisterTraceValue(pintrace[tt]);
        delete pintrace[tt];
    }
}

void HWPort::Reset(void) {
    port = 0;
    pin = 0;
    ddr = 0;

    for(int tt = portSize - 1; tt >= 0; tt--)
        p[tt].ResetOverride();
    CalcOutputs();
}

Pin& HWPort::GetPin(unsigned char pinNo) {
    assert(pinNo < sizeof(p)/sizeof(p[0]));
    return p[pinNo];
}

void HWPort::CalcOutputs(void) { // Calculate the new output value to be transmitted to the environment
    unsigned char tmpPin = 0;

    for(unsigned int actualBitNo = 0; actualBitNo < portSize; actualBitNo++) {
        unsigned char actualBit = 1 << actualBitNo;
        bool regPort = (bool)(port & actualBit);
        bool regDDR = (bool)(ddr & actualBit);

        if(p[actualBitNo].CalcPinOverride(regDDR, regPort, false))
            tmpPin |= actualBit;
        pintrace[actualBitNo]->change(p[actualBitNo].outState);
    }
    pin = tmpPin;
}

string HWPort::GetPortString(void) {
    string dummy;
    dummy.resize(portSize);
    for(unsigned int tt = 0; tt < portSize; tt++)
        dummy[portSize - 1 - tt] = p[tt];  // calls Pin::operator char()

    return dummy;
}

void HWPort::SetPin(unsigned char val) {
    if(portToggleFeature) {
        port ^= val;
        CalcOutputs();
        port_reg.hardwareChange(port);
    } else
        avr_warning("Writing of 'PORT%s.PIN' (with %d) is not supported.", myName.c_str(), val);
}

/* EOF */

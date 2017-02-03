/*
 ****************************************************************************
 *
 * simulavr - A simulator for the Atmel AVR family of microcontrollers.
 * Copyright (C) 2001, 2002, 2003 Klaus Rudolph
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

#include "pinatport.h"
#include "hwport.h"

PinAtPort::PinAtPort( HWPort *p, unsigned char pn)
{
    port = p;
    pinNo = pn;
    regID = port->p[pn].RegisterAlternateUse();
}

Pin& PinAtPort::GetPin() {
    return port->GetPin(pinNo);
}

void PinAtPort::SetPort(bool val) {
    unsigned char *adr = &port->port;
    SetVal(adr, val);
    port->CalcOutputs();
}

float PinAtPort::GetAnalogValue(float vcc) {
    return port->p[pinNo].GetAnalogValue(vcc);
}

void PinAtPort::SetDdr(bool val) {
    unsigned char *adr = &port->ddr;
    SetVal(adr, val);
    port->CalcOutputs();
}

void PinAtPort::SetAlternatePullup(bool val){
    port->p[pinNo].SetPUOV(val, regID);
    port->CalcOutputs();
}

void PinAtPort::SetUseAlternatePullup(bool val) {
    port->p[pinNo].SetPUOE(val, regID);
    port->CalcOutputs();
}

void PinAtPort::SetAlternateDdr(bool val){
    port->p[pinNo].SetDDOV(val, regID);
    port->CalcOutputs();
}

void PinAtPort::SetUseAlternateDdr(bool val) {
    port->p[pinNo].SetDDOE(val, regID);
    port->CalcOutputs();
}

void PinAtPort::SetAlternatePort(bool val) {
    port->p[pinNo].SetPVOV(val, regID);
    port->CalcOutputs();
}

void PinAtPort::SetUseAlternatePort(bool val) {
    port->p[pinNo].SetPVOE(val, regID);
    port->CalcOutputs();
}

void PinAtPort::SetUseAlternatePortIfDdrSet(bool val) {
    port->p[pinNo].SetPVOE_WithDDR(val, regID);
    port->CalcOutputs();
}

bool PinAtPort::GetPort() {
    return (port->port >> pinNo) & 1;
}

bool PinAtPort::GetDdr() {
    return (port->ddr >> pinNo) & 1;
}

PinAtPort::operator bool() {
    return ((port->GetPin()) >> pinNo) & 0x01;
} //we must use GetPin to recalculate the Pin from p[] array

void PinAtPort::SetVal( unsigned char *adr, bool val) {
    if (val) {
        *adr |= (1 << pinNo);
    } else {
        *adr &= ~(1 << pinNo);
    }
}

/* EOF*/

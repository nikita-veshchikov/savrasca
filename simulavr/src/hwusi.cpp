/*
 ****************************************************************************
 *
 * simulavr - A simulator for the Atmel AVR family of microcontrollers.
 * Copyright (C) 2001 - 2016 Klaus Rudolph & other
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

#include "hwusi.h"
#include "avrdevice.h"
#include "avrerror.h"
#include "hwtimer.h"
#include "systemclock.h"

void HWUSI::SetUSIDR(unsigned char val) {
    shift_data = val;
    setDout();
}

unsigned char HWUSI::GetUSISR(void) {
    unsigned char val = counter_data & 0xf;
    if(irqactive_start) val |= 0x80;
    if(irqactive_ovr) val |= 0x40;
    if(flag_stop) val |= 0x20;
    if(flag_dcol) val |= 0x10;
    return val;
}

void HWUSI::SetUSISR(unsigned char val) {
    /* store counter */
    counter_data = val & 0xf;
    /* reset irq/flags */
    if((val & 0x80) == 0x80) { /* reset USISIF */
        irq->ClearIrqFlag(irq_start);
        irqactive_start = false;
        scl_hold = false;
        setSCK_TWI(false, sck_ddr, sck_port); // release SCL hold
    }        
    if((val & 0x40) == 0x40) { /* reset USIOIF */
        irq->ClearIrqFlag(irq_ovr);
        irqactive_ovr = false;
        scl_hold = false;
        setSCK_TWI(false, sck_ddr, sck_port); // release SCL hold
    }        
    /* reset stop flag */
    if((val & 0x20) == 0x20) /* reset USIPF */
        flag_stop = false;
}

void HWUSI::SetUSICR(unsigned char val) {
    /* store wire mode */
    WMtype old_wm = wire_mode;
    wire_mode = (WMtype)((val >> 4) & 0x3);
    if(old_wm != wire_mode) {
        /* wire mode changed */
        switch(wire_mode) {
            case WM_OFF:
                controlDO(false);
                controlTWI(false);
                break;

            case WM_3WIRE:
                controlDO(true);
                controlTWI(false);
                setDout();
                break;
                
            case WM_2WIRE:
            case WM_2WIRE_OVR:
                if(old_wm != WM_2WIRE && old_wm != WM_2WIRE_OVR) {
                    controlDO(false);
                    controlTWI(true);
                    setDI((shift_data & 0x80) == 0x80, di_ddr, di_port);
                    setSCK_TWI(false, sck_ddr, sck_port);
                }
                break;
        }
    }

    /* store irq enable flags */
    irqen_start = (val & 0x80) == 0x80;
    irqen_ovr = (val & 0x40) == 0x40;

    /* store clock mode */
    unsigned char old_cm = clock_mode;
    bool do_count = false;
    clock_mode = (val >> 1) & 0x7;
    if(clock_mode < 4) { /* USICS1 = 0 */
        if(clock_mode == 1) /* software clock strobe with USICLK = 1 */
            do_count = true;
        clock_mode &= 0x2; /* reset USICLK */
    } else if ((clock_mode & 1) == 1) { /* software clock strobe with USITC */
        if((val & 1) == 1) /* USITC = 1 */
            do_count = true;
    }
    if(do_count) {
        doCount();
        if((val & 1) == 1) /* USITC = 1 */
            toggleSCK();
    }

    /* store control data value, bit 0,1 read a 0 in every case */
    control_data = val & 0xfc;
}

void HWUSI::doCount(void) {
    if(clock_mode > 0) {
        counter_data = (counter_data + 1) & 0xf;
        if(counter_data == 0) {
            /* overflow event */
            irqactive_ovr = true;
            setDataBuffer(shift_data);
            if(wire_mode == WM_2WIRE_OVR) {
                scl_hold = true; // SCL hold
                is_DI_change = false;
                SystemClock::Instance().Add(this);
            }
            if(irqen_ovr) {
                irq->SetIrqFlag(this, irq_ovr);
            }
        }
    }
}

void HWUSI::doShift(void) {
    unsigned char di = (bool)DI ? 1 : 0;
    shift_data = ((shift_data << 1) | di) & 0xff;
}

void HWUSI::setDout(void) {
    if((shift_data & 0x80) == 0x80) {
        if((wire_mode == WM_OFF) || (wire_mode == WM_3WIRE))
            setDO(true);
        else
            setDI(true, di_ddr, di_port);
    } else {
        if((wire_mode == WM_OFF) || (wire_mode == WM_3WIRE))
            setDO(false);
        else
            setDI(false, di_ddr, di_port);
    }
}

void HWUSI::toggleSCK(void) {
     if(SCK.GetPort())
         SCK.SetPort(false);
     else
         SCK.SetPort(true);
}

void HWUSI::registerDIandSCK(HWUSI *cb) {
    SCK.GetPin().RegisterCallback(cb);
    DI.GetPin().RegisterCallback(cb);
}

void HWUSI::setDO(bool state) {
    DO.SetAlternatePort(state);
}

void HWUSI::setDI(bool state, bool ddr, bool port) {
    // set DDOV value for port pin
    DI.SetAlternateDdr(ddr && (!port || !state));
}

void HWUSI::setSCK_TWI(bool hold, bool ddr, bool port) {
    // set DDOV value for port pin
    SCK.SetAlternateDdr(ddr && (!port || hold));
}

void HWUSI::controlDO(bool state) {
    DO.SetUseAlternatePortIfDdrSet(state);
}

void HWUSI::controlTWI(bool state) {
    DI.SetAlternatePullup(false);
    DI.SetAlternatePort(false);
    DI.SetUseAlternatePullup(state);
    DI.SetUseAlternateDdr(state);
    DI.SetUseAlternatePortIfDdrSet(state);
    SCK.SetAlternatePullup(false);
    SCK.SetAlternatePort(false);
    SCK.SetUseAlternatePullup(state);
    SCK.SetUseAlternateDdr(state);
    SCK.SetUseAlternatePortIfDdrSet(state);
}

HWUSI::HWUSI(AvrDevice *_c,
         HWIrqSystem *_irq,
         PinAtPort din,
         PinAtPort dout,
         PinAtPort sck,
         unsigned int ivec_start,
         unsigned int ivec_ovr):
    Hardware(_c), TraceValueRegister(_c, "USI"),
    core(_c), irq(_irq),
    DI(din), DO(dout), SCK(sck),
    irq_start(ivec_start), irq_ovr(ivec_ovr),
    usidr_reg(this, "USIDR", this, &HWUSI::GetUSIDR, &HWUSI::SetUSIDR),
    usisr_reg(this, "USISR", this, &HWUSI::GetUSISR, &HWUSI::SetUSISR),
    usicr_reg(this, "USICR", this, &HWUSI::GetUSICR, &HWUSI::SetUSICR)
{
    irq->DebugVerifyInterruptVector(ivec_start, this);
    irq->DebugVerifyInterruptVector(ivec_ovr, this);

    registerDIandSCK(this);

    trace_direct(this, "ShiftRegister", &shift_data);
    trace_direct(this, "Counter", &counter_data);
    Reset();
}

void HWUSI::Reset() {
    shift_data = 0;
    control_data = 0;
    irqen_start = false;
    irqen_ovr = false;
    irqactive_start = false;
    irqactive_ovr = false;
    flag_stop = false;
    flag_dcol = false;
    wire_mode = WM_OFF;
    clock_mode = 0;
    counter_data = 0;
    sck_state = true; /* initial port state is tristate, read as 1 */
    di_state = true;
    sck_ddr = false; /* initial ddr state is 0 */
    di_ddr = false;
    sck_port = false; /* initial port state is 0 */
    di_port = false;
    is_DI_change = false; /* just to initialize, will be set on demand! */
    scl_hold = false;

    /* reset port pin states */
    controlDO(false);
    controlTWI(false);
}

int HWUSI::Step(bool &untilCoreStepFinished, SystemClockOffset *nextStepIn_ns) {
    /* change SDA or SCK output, if necessary. This can't be made in PiStateHasChanged,
       no pin change inside this method or you'll get a infinite loop ... */
    if(is_DI_change)
        setDI((shift_data & 0x80) == 0x80, di_ddr, di_port);
    else
        setSCK_TWI(scl_hold, sck_ddr, sck_port);
    if(nextStepIn_ns != NULL)
        *nextStepIn_ns = -1;
    return 0;
}

void HWUSI::PinStateHasChanged(Pin* p) {
    if(&DI.GetPin() == p) {
        // pin change on DI = SDA
        bool tmp_state = (bool)DI, tmp_ddr = DI.GetDdr(), tmp_port = DI.GetPort();

        // check start condition in 2wire mode
        if((wire_mode == WM_2WIRE) || (wire_mode == WM_2WIRE_OVR)) {
            // is DI alternate mode changed?
            if(tmp_ddr != di_ddr || tmp_port != di_port) {
                is_DI_change = true;
                SystemClock::Instance().Add(this);
            }
            // check edge
            if(!tmp_state && di_state && sck_state) { // SDA edge to low while SCL high
                irqactive_start = true;
                if(irqen_start) {
                    irq->SetIrqFlag(this, irq_start);
                }
            }
        }

        /* save di states */
        di_state = tmp_state;
        di_ddr = tmp_ddr;
        di_port = tmp_port;
        return;
    }

    // pin change on SCK: save ddr and port value
    bool current = (bool)SCK, tmp_ddr = SCK.GetDdr(), tmp_port = SCK.GetPort();
    if((wire_mode == WM_2WIRE) || (wire_mode == WM_2WIRE_OVR)) {
        if(tmp_ddr != sck_ddr || tmp_port != sck_port) {
            is_DI_change = false;
            SystemClock::Instance().Add(this);
        }
    }
    if(current == sck_state)
        return; /* no action */

    if((wire_mode == WM_2WIRE) || (wire_mode == WM_2WIRE_OVR)) {
        if(!current && sck_state && irqactive_start && !scl_hold) {
            // set scl hold after start condition found and scl is going low
            scl_hold = true;
            is_DI_change = false;
            SystemClock::Instance().Add(this);
        }
    }

    /* save sck states */
    sck_state = current;
    sck_ddr = tmp_ddr;
    sck_port = tmp_port;

    /* if not in 2wire mode, every clock change will set USISIF */
    if((wire_mode == WM_OFF) || (wire_mode == WM_3WIRE)) {
        irqactive_start = true;
        if(irqen_start)
            irq->SetIrqFlag(this, irq_start);
    }

    /* clock mode: get clock from external source? */
    if(clock_mode < 4)
        return; /* no action */

    /* counter control */
    if((clock_mode & 1) == 0)
        doCount();

    /* SCK edge action */
    bool neg_edge = (clock_mode & 2) == 2;
    if(sck_state) {
        /* pos. edge: L -> H */
        if(neg_edge)
            setDout();
        else
            doShift();
    } else {
        /* neg. edge: H -> L */
        if(neg_edge)
            doShift();
        else
            setDout();
    }
}

void HWUSI::fireEvent(int event) {
    if((event == BasicTimerUnit::EVT_COMPARE_1) && (clock_mode == 2)) {
        /* timer 0 compare match with OCR0A register */
        doShift();
        doCount();
        setDout();
    }
}

HWUSI_BR::HWUSI_BR(AvrDevice *_c,
         HWIrqSystem *_irq,
         PinAtPort din,
         PinAtPort dout,
         PinAtPort sck,
         unsigned int ivec_start,
         unsigned int ivec_ovr):
    HWUSI(_c, _irq, din, dout, sck, ivec_start, ivec_ovr),
    usibr_reg(this, "USIBR", this, &HWUSI_BR::GetUSIBR, &HWUSI_BR::SetUSIBR)
{
    Reset();
}

void HWUSI_BR::SetUSIBR(unsigned char val) {
    avr_warning("register USIBR is read only (try to write value 0x%02x)", val);
}

void HWUSI_BR::Reset() {
    buffer_data = 0;
    HWUSI::Reset();
}

void HWUSI_BR::setDataBuffer(unsigned char data) {
    buffer_data = data;
}

/* EOF */

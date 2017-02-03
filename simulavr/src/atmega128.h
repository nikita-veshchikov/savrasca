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

#ifndef ATMEGA128
#define ATMEGA128

#include "avrdevice.h"
#include "hardware.h"
#include "rwmem.h"
#include "hwtimer/timerprescaler.h"
#include "hwtimer/timerirq.h"
#include "hwtimer/hwtimer.h"
#include "externalirq.h"
#include "hwuart.h"
#include "hwspi.h"
#include "hwad.h"
#include "hwacomp.h"
#include "pin.h"

#include "ioregs.h" //only for rampz here

//! AVRDevice class for ATMega64 and ATMega128
class AvrDevice_atmega128base: public AvrDevice {
    
    public:
        HWPort *porta;                  //!< port A
        HWPort *portb;                  //!< port B
        HWPort *portc;                  //!< port C
        HWPort *portd;                  //!< port D
        HWPort *porte;                  //!< port E
        HWPort *portf;                  //!< port F
        HWPort *portg;                  //!< port G
        ExternalIRQHandler *extirq;     //!< external interrupt support
        IOSpecialReg *eicra_reg;        //!< EICRA IO register
        IOSpecialReg *eicrb_reg;        //!< EICRB IO register
        IOSpecialReg *eimsk_reg;        //!< EIMSK IO register
        IOSpecialReg *eifr_reg;         //!< EIFR IO register
        XDIVRegister *xdiv_reg;         //!< XDIV IO register
        OSCCALRegister *osccal_reg;     //!< OSCCAL IO register

        HWAdmux *admux;                 //!< adc multiplexer unit
        HWARef* aref;                   //!< adc reference unit
        HWAd *ad;                       //!< adc unit
        HWAcomp *acomp;                 //!< analog compare unit

        IOSpecialReg *assr_reg;         //!< ASSR IO register
        IOSpecialReg *sfior_reg;        //!< SFIOR IO register
        HWPrescalerAsync *prescaler0;   //!< prescaler unit for timer 0
        HWPrescaler *prescaler123;      //!< prescaler unit for timer 1 to 3
        ICaptureSource *inputCapture1;  //!< input capture source for timer1
        ICaptureSource *inputCapture3;  //!< input capture source for timer3
        HWTimer8_1C*  timer0;           //!< timer 0 unit
        HWTimer16_3C* timer1;           //!< timer 1 unit
        HWTimer8_1C*  timer2;           //!< timer 2 unit
        HWTimer16_3C* timer3;           //!< timer 3 unit
        TimerIRQRegister* timer012irq;  //!< timer interrupt unit for timer 0 to 2
        TimerIRQRegister* timer3irq;    //!< timer interrupt unit for timer 3
        HWSpi *spi;                     //!< spi unit
        HWUsart *usart0;                //!< usart 0 unit
        HWUsart *usart1;                //!< usart 1 unit

        AvrDevice_atmega128base(unsigned flash_bytes, unsigned ee_bytes, unsigned ext_bytes, unsigned nrww_start);
        ~AvrDevice_atmega128base(); 
};

//! AVR device class for ATMega64, see AvrDevice_atmega128base.
class AvrDevice_atmega64: public AvrDevice_atmega128base {
    public:
        //! Creates the device for ATMega64, see AvrDevice_atmega128base.
        AvrDevice_atmega64() : AvrDevice_atmega128base(64 * 1024, 2 * 1024, 0, 0x7000) {}
};

//! AVR device class for ATMega128, see AvrDevice_atmega128base.
class AvrDevice_atmega128: public AvrDevice_atmega128base {
    public:
        //! Creates the device for ATMega128, see AvrDevice_atmega128base.
        AvrDevice_atmega128() : AvrDevice_atmega128base(128 * 1024, 4 * 1024, 0xef00, 0xf000) {}
};

#endif

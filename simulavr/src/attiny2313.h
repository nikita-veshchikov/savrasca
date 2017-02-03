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

#ifndef ATTINY2313
#define ATTINY2313

#include "avrdevice.h"
#include "hardware.h"
#include "rwmem.h"
#include "hwtimer/timerprescaler.h"
#include "hwtimer/timerirq.h"
#include "hwtimer/hwtimer.h"
#include "externalirq.h"
#include "hwuart.h"
#include "hwacomp.h"
#include "hwusi.h"

//! AVRDevice class for ATTiny2313
class AvrDevice_attiny2313: public AvrDevice {
    
    public:
        HWPort *porta;                  //!< port A (only 3 bit)
        HWPort *portb;                  //!< port B
        HWPort *portd;                  //!< port D (only 7 bit)

        IOSpecialReg *gtccr_reg;        //!< GTCCR IO register
        GPIORegister *gpior0_reg;       //!< GPIOR0 Register
        GPIORegister *gpior1_reg;       //!< GPIOR1 Register
        GPIORegister *gpior2_reg;       //!< GPIOR2 Register
        CLKPRRegister *clkpr_reg;       //!< CLKPR IO register
        OSCCALRegister *osccal_reg;     //!< OSCCAL IO register
        
        ExternalIRQHandler *extirq;     //!< external interrupt support
        IOSpecialReg *gimsk_reg;        //!< GIMSK IO register
        IOSpecialReg *eifr_reg;         //!< EIFR IO register
        IOSpecialReg *mcucr_reg;        //!< MCUCR IO register
        IOSpecialReg *pcmsk_reg;        //!< PCMSK IO register
        
        HWPrescaler *prescaler01;       //!< prescaler unit for timer 0 and 1
        ICaptureSource *inputCapture1;  //!< input capture source for timer1
        HWTimer8_2C*   timer0;          //!< timer 0 unit
        HWTimer16_2C3* timer1;          //!< timer 1 unit
        TimerIRQRegister* timer01irq;   //!< timer interrupt unit for timer 0 and 1
        HWUsart *usart;                 //!< usart unit
        HWAcomp *acomp;                 //!< analog compare unit
        HWUSI *usi;                     //!< usi unit

        AvrDevice_attiny2313();
        ~AvrDevice_attiny2313(); 
};

#endif

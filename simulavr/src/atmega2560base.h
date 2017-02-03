 /*
 ****************************************************************************
 *
 * simulavr - A simulator for the Atmel AVR family of microcontrollers.
 * Copyright (C) 2001, 2002, 2003   Klaus Rudolph       
 * Copyright (C) 2015               Christian Taedcke
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
 */
#ifndef ATMEGA2560BASE_INCLUDED
#define ATMEGA2560BASE_INCLUDED

#include "avrdevice.h"
#include "hardware.h"
#include "rwmem.h"
#include "externalirq.h"
#include "hwuart.h"
#include "hwad.h"
#include "hwacomp.h"
#include "hwport.h"
#include "hwspi.h"
#include "hwtimer/timerprescaler.h"
#include "hwtimer/hwtimer.h"

#include "ioregs.h" // only for rampz

/*! AvrDevice class for ATmega640/1280/2560.
\todo This device isn't completely implemented. */
class AvrDevice_atmega2560base: public AvrDevice {

protected:
    HWPort              porta;       //!< port A
    HWPort              portb;       //!< port B
    HWPort              portc;       //!< port C
    HWPort              portd;       //!< port D
    HWPort              porte;       //!< port E
    HWPort              portf;       //!< port F
    HWPort              portg;       //!< port G
    HWPort              porth;       //!< port H
    HWPort              portj;       //!< port J
    HWPort              portk;       //!< port K
    HWPort              portl;       //!< port L

    IOSpecialReg        gtccr_reg;   //!< GTCCR IO register
    IOSpecialReg        assr_reg;    //!< ASSR IO register
    HWPrescaler         prescaler1;  //!< prescaler unit for timer 0, 1, 3, 4 and 5
    HWPrescalerAsync    prescaler2;  //!< prescaler unit for timer 2
    ExternalIRQHandler* extirq;      //!< external interrupt support for INT0 to INT7
    IOSpecialReg*       eicra_reg;   //!< EICRA IO register
    IOSpecialReg*       eicrb_reg;   //!< EICRB IO register
    IOSpecialReg*       eimsk_reg;   //!< EIMSK IO register
    IOSpecialReg*       eifr_reg;    //!< EIFR IO register
    ExternalIRQHandler* extirqpc;    //!< external interrupt support for PCINT[0-2]
    IOSpecialReg*       pcicr_reg;   //!< PCICR IO register
    IOSpecialReg*       pcifr_reg;   //!< PCIFR IO register
    IOSpecialReg*       pcmsk0_reg;  //!< PCIMSK0 IO register
    IOSpecialReg*       pcmsk1_reg;  //!< PCIMSK1 IO register
    IOSpecialReg*       pcmsk2_reg;  //!< PCIMSK2 IO register
    HWAdmux*            admux;       //!< adc multiplexer unit
    HWARef*             aref;        //!< adc reference unit
    HWAd*               ad;          //!< adc unit
    HWAcomp*            acomp;       //!< analog compare unit
    HWSpi*              spi;         //!< spi unit
    HWUsart*            usart0;      //!< usart 0 unit
    HWUsart*            usart1;      //!< usart 1 unit
    HWUsart*            usart2;      //!< usart 2 unit
    HWUsart*            usart3;      //!< usart 3 unit
    TimerIRQRegister*   timerIrq0;   //!< timer interrupt unit for timer 0
    HWTimer8_2C*        timer0;      //!< timer 0 unit
    ICaptureSource*     inputCapture1; //!< input capture source for timer 1
    TimerIRQRegister*   timerIrq1;   //!< timer interrupt unit for timer 1
    HWTimer16_3C*       timer1;      //!< timer 1 unit
    TimerIRQRegister*   timerIrq2;   //!< timer interrupt unit for timer 2
    HWTimer8_2C*        timer2;      //!< timer 2 unit
    ICaptureSource*     inputCapture3; //!< input capture source for timer 3
    TimerIRQRegister*   timerIrq3;   //!< timer interrupt unit for timer 3
    HWTimer16_3C*       timer3;      //!< timer 3 unit
    ICaptureSource*     inputCapture4; //!< input capture source for timer 4
    TimerIRQRegister*   timerIrq4;   //!< timer interrupt unit for timer 4
    HWTimer16_3C*       timer4;      //!< timer 4 unit
    ICaptureSource*     inputCapture5; //!< input capture source for timer 5
    TimerIRQRegister*   timerIrq5;   //!< timer interrupt unit for timer 5
    HWTimer16_3C*       timer5;      //!< timer 5 unit
    GPIORegister*       gpior0_reg;  //!< general purpose IO register
    GPIORegister*       gpior1_reg;  //!< general purpose IO register
    GPIORegister*       gpior2_reg;  //!< general purpose IO register
    CLKPRRegister*      clkpr_reg;   //!< CLKPR IO register
    OSCCALRegister*     osccal_reg;  //!< OSCCAL IO register

public:
    AvrDevice_atmega2560base(unsigned ram_bytes, unsigned flash_bytes,
                              unsigned ee_bytes, unsigned nrww_start);
    ~AvrDevice_atmega2560base();
};

class AvrDevice_atmega2560: public AvrDevice_atmega2560base {
public:
    AvrDevice_atmega2560() : AvrDevice_atmega2560base(8 * 1024, 256 * 1024, 4 * 1024, 0x1f000) {}
};

class AvrDevice_atmega1280: public AvrDevice_atmega2560base {
public:
    AvrDevice_atmega1280() : AvrDevice_atmega2560base(8 * 1024, 128 * 1024, 4 * 1024, 0xf000) {}
};

class AvrDevice_atmega640: public AvrDevice_atmega2560base {
public:
    AvrDevice_atmega640() : AvrDevice_atmega2560base(8 * 1024, 64 * 1024, 4 * 1024, 0x7000) {}
};

#endif

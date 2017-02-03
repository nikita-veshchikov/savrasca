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

#ifndef HW_USI
#define HW_USI

#include "hardware.h"
#include "simulationmember.h"
#include "irqsystem.h"
#include "pinatport.h"
#include "pinnotify.h"
#include "rwmem.h"
#include "traceval.h"
#include "hwtimer.h"

class AvrDevice;

/*! Implements USI base module (w/o buffer register or alternate pins) */
class HWUSI: public Hardware, public SimulationMember, public TraceValueRegister, public HasPinNotifyFunction, public TimerEventListener {
    
    private:
        /*! types of wiremodes */
        enum WMtype {
          WM_OFF = 0,
          WM_3WIRE,
          WM_2WIRE,
          WM_2WIRE_OVR,
          WM_tablesize
        };

        /*! connected device */
        AvrDevice *core;
        /*! connected irq system controller */
        HWIrqSystem *irq;
    
        /*! USI shift register */
        unsigned char shift_data;
        /*! USI control register */
        unsigned char control_data;
    
        /*! data input port pin */
        PinAtPort DI;
        /*! data output port pin */
        PinAtPort DO;
        /*! data clock port pin */
        PinAtPort SCK;
        /*! stored input state for SCK port pin */
        bool sck_state;
        /*! PORT register value for SCK port pin */
        bool sck_port;
        /*! DDR register value for SCK port pin */
        bool sck_ddr;
        /*! stored input state for DI port pin */
        bool di_state;
        /*! PORT register value for DI port pin */
        bool di_port;
        /*! DDR register value for DI port pin */
        bool di_ddr;
        /*! USI SCL hold state */
        bool scl_hold;

        /*! irq vector for USI start condition interrupt */
        unsigned int irq_start;
        /*! enable flag for start condition interrupt */
        bool irqen_start;
        /*! active flag for start condition interrupt */
        bool irqactive_start;
        /*! irq vector for USI counter overflow interrupt */
        unsigned int irq_ovr;
        /*! enable flag for USI counter overflow interrupt */
        bool irqen_ovr;
        /*! active flag for USI counter overflow interrupt */
        bool irqactive_ovr;
        /*! active flag for stop condition (no interrupt) */
        bool flag_stop;
        /*! active flag for data collision (no interrupt) */
        bool flag_dcol;
        
        /*! USI wire mode */
        WMtype wire_mode;
        /*! USI clock mode [USICS1 USICS0 USICLK] */
        unsigned char clock_mode;

        /*! process counter event (clock) */
        void doCount(void);
        /*! USI 4bit counter */
        unsigned char counter_data;
        /*! set DO output pin */
        void setDout(void);
        /*! process shift event, store DI in LSB */
        void doShift(void);

        /*! Interface for HasPinNotifyFunction */
        void PinStateHasChanged(Pin*);

        /*! flag for save, which output state is to change */
        bool is_DI_change;

    protected:
        /*! interface to store data to buffer register */
        virtual void setDataBuffer(unsigned char data) { }

        /* interfaces for alternate pins on attiny261 */
        /*! register notify for SCK pin */
        virtual void registerDIandSCK(HWUSI *cb);
        /*! toggle port state for SCK pin */
        virtual void toggleSCK(void);
        /*! set state for DO pin */
        virtual void setDO(bool state);
        /*! set state for DI pin */
        virtual void setDI(bool state, bool ddr, bool port);
        /*! set state for SCK pin in two wire modes */
        virtual void setSCK_TWI(bool hold, bool ddr, bool port);
        /*! set output control for DO pin */
        virtual void controlDO(bool state);
        /*! set output control for two wire mode (for DI and SCK!) */
        virtual void controlTWI(bool state);

    public:
        /* Constructor */
        HWUSI(AvrDevice *core,
              HWIrqSystem *,
              PinAtPort din,
              PinAtPort dout,
              PinAtPort sck,
              unsigned int irq_start,
              unsigned int irq_ovr);
        virtual ~HWUSI() {}

        /* Interface from Hardware */
        virtual void Reset();

        /* Interface from TimerEventListener */
        virtual void fireEvent(int event);

        /* Interface from SimulationMember: for reacting to port pin changes */
        int Step(bool &untilCoreStepFinished, SystemClockOffset *nextStepIn_ns = 0);

        /* Set and get functions for IO registers */
        void SetUSIDR(unsigned char val);
        void SetUSISR(unsigned char val);
        void SetUSICR(unsigned char val);
        unsigned char GetUSIDR(void) { return shift_data; }
        unsigned char GetUSISR(void);
        unsigned char GetUSICR(void) { return control_data; }
    
        /* IO registers connected with USI */
        IOReg<HWUSI> usidr_reg,
                     usisr_reg,
                     usicr_reg;
};

class HWUSI_BR: public HWUSI {

    private:
        /*! USI buffer register */
        unsigned char buffer_data;

    protected:
        /*! interface to store data to buffer register */
        virtual void setDataBuffer(unsigned char data);

    public:
        /* Constructor */
        HWUSI_BR(AvrDevice *core,
                 HWIrqSystem *,
                 PinAtPort din,
                 PinAtPort dout,
                 PinAtPort sck,
                 unsigned int irq_start,
                 unsigned int irq_ovr);

        /* Interface from Hardware */
        virtual void Reset();

        /* Set and get functions for IO registers */
        void SetUSIBR(unsigned char val); // produce warning: read only
        unsigned char GetUSIBR(void) { return buffer_data; }

        /* IO registers connected with USI */
        IOReg<HWUSI_BR> usibr_reg;
};

#endif

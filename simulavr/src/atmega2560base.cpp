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
#include "atmega2560base.h"

#include "irqsystem.h"
#include "hwstack.h"
#include "hweeprom.h"
#include "hwwado.h"
#include "hwsreg.h"
#include "avrerror.h"
#include "avrfactory.h"

AVR_REGISTER(atmega640, AvrDevice_atmega640)
AVR_REGISTER(atmega1280, AvrDevice_atmega1280)
AVR_REGISTER(atmega2560, AvrDevice_atmega2560)

AvrDevice_atmega2560base::~AvrDevice_atmega2560base() {
    delete usart3;
    delete usart2;
    delete usart1;
    delete usart0;
    delete wado;
    delete spi;
    delete acomp;
    delete ad;
    delete aref;
    delete admux;
    delete gpior2_reg;
    delete gpior1_reg;
    delete gpior0_reg;
    delete timer5;
    delete inputCapture5;
    delete timerIrq5;
    delete timer4;
    delete inputCapture4;
    delete timerIrq4;
    delete timer3;
    delete inputCapture3;
    delete timerIrq3;
    delete timer2;
    delete timerIrq2;
    delete timer1;
    delete inputCapture1;
    delete timerIrq1;
    delete timer0;
    delete timerIrq0;
    delete extirqpc;
    delete pcmsk2_reg;
    delete pcmsk1_reg;
    delete pcmsk0_reg;
    delete pcifr_reg;
    delete pcicr_reg;
    delete extirq;
    delete eifr_reg;
    delete eimsk_reg;
    delete eicra_reg;
    delete eicrb_reg;
    delete osccal_reg;
    delete clkpr_reg;
    delete stack;
    delete eeprom;
    delete irqSystem;
    delete spmRegister;
}

AvrDevice_atmega2560base::AvrDevice_atmega2560base(unsigned ram_bytes,
                                                     unsigned flash_bytes,
                                                     unsigned ee_bytes,
                                                     unsigned nrww_start):
    AvrDevice(0x200 - 32, // I/O space size (above ALU registers)
              ram_bytes,    // RAM size
              0,            // External RAM size
              flash_bytes,  // Flash Size
              3),           // PC size
    porta(this, "A", true),
    portb(this, "B", true),
    portc(this, "C", true),
    portd(this, "D", true),
    porte(this, "E", true),
    portf(this, "F", true),
    portg(this, "G", true),
    porth(this, "H", true),
    portj(this, "J", true),
    portk(this, "K", true),
    portl(this, "L", true),
    gtccr_reg(&coreTraceGroup, "GTCCR"),
    assr_reg(&coreTraceGroup, "ASSR"),
    prescaler1(this, "1", &gtccr_reg, 0, 7),
    prescaler2(this, "2", PinAtPort(&portg, 4), &assr_reg, 5, &gtccr_reg, 1, 7)
{ 
    flagELPMInstructions = true;
    flagEIJMPInstructions = true;
    fuses->SetFuseConfiguration(19, 0xff9962);
    fuses->SetBootloaderConfig(nrww_start, 0x1000, 9, 8);
    spmRegister = new FlashProgramming(this, 128, nrww_start, FlashProgramming::SPM_MEGA_MODE);

    irqSystem = new HWIrqSystem(this, 4, 57);

    eeprom = new HWEeprom(this, irqSystem, ee_bytes, 30, HWEeprom::DEVMODE_EXTENDED); 
    stack = new HWStackSram(this, 16, true);
    clkpr_reg = new CLKPRRegister(this, &coreTraceGroup);
    osccal_reg = new OSCCALRegister(this, &coreTraceGroup, OSCCALRegister::OSCCAL_V5);

    rampz = new AddressExtensionRegister(this, "RAMPZ", 2);
    eind = new AddressExtensionRegister(this, "EIND", 1);

    eicra_reg = new IOSpecialReg(&coreTraceGroup, "EICRA");
    eicrb_reg = new IOSpecialReg(&coreTraceGroup, "EICRB");
    eimsk_reg = new IOSpecialReg(&coreTraceGroup, "EIMSK");
    eifr_reg = new IOSpecialReg(&coreTraceGroup, "EIFR");
    extirq = new ExternalIRQHandler(this, irqSystem, eimsk_reg, eifr_reg);
    extirq->registerIrq(1, 0, new ExternalIRQSingle(eicra_reg, 0, 2, GetPin("D0")));
    extirq->registerIrq(2, 1, new ExternalIRQSingle(eicra_reg, 2, 2, GetPin("D1")));
    extirq->registerIrq(3, 2, new ExternalIRQSingle(eicra_reg, 4, 2, GetPin("D2")));
    extirq->registerIrq(4, 3, new ExternalIRQSingle(eicra_reg, 6, 2, GetPin("D3")));
    extirq->registerIrq(5, 4, new ExternalIRQSingle(eicrb_reg, 0, 2, GetPin("E4")));
    extirq->registerIrq(6, 5, new ExternalIRQSingle(eicrb_reg, 2, 2, GetPin("E5")));
    extirq->registerIrq(7, 6, new ExternalIRQSingle(eicrb_reg, 4, 2, GetPin("E6")));
    extirq->registerIrq(8, 7, new ExternalIRQSingle(eicrb_reg, 6, 2, GetPin("E7")));

    pcicr_reg = new IOSpecialReg(&coreTraceGroup, "PCICR");
    pcifr_reg = new IOSpecialReg(&coreTraceGroup, "PCIFR");
    pcmsk0_reg = new IOSpecialReg(&coreTraceGroup, "PCMSK0");
    pcmsk1_reg = new IOSpecialReg(&coreTraceGroup, "PCMSK1");
    pcmsk2_reg = new IOSpecialReg(&coreTraceGroup, "PCMSK2");
    extirqpc = new ExternalIRQHandler(this, irqSystem, pcicr_reg, pcifr_reg);
    extirqpc->registerIrq(9, 0, new ExternalIRQPort(pcmsk0_reg, &portb));

    Pin* pcmask1PinList[] = {
        GetPin("E0"), //PCINT8
        GetPin("J0"), //PCINT9
        GetPin("J1"), //PCINT10
        GetPin("J2"), //PCINT11
        GetPin("J3"), //PCINT12
        GetPin("J4"), //PCINT13
        GetPin("J5"), //PCINT14
        GetPin("J6")  //PCINT15
    };

    extirqpc->registerIrq(10, 1, new ExternalIRQPort(pcmsk1_reg, pcmask1PinList));
    extirqpc->registerIrq(11, 2, new ExternalIRQPort(pcmsk2_reg, &portk));

    timerIrq0 = new TimerIRQRegister(this, irqSystem, 0);
    timerIrq0->registerLine(0, new IRQLine("TOV0",  23));
    timerIrq0->registerLine(1, new IRQLine("OCF0A", 21));
    timerIrq0->registerLine(2, new IRQLine("OCF0B", 22));

    timer0 = new HWTimer8_2C(this,
                             new PrescalerMultiplexerExt(&prescaler1, PinAtPort(&portd, 7)),
                             0,
                             timerIrq0->getLine("TOV0"),
                             timerIrq0->getLine("OCF0A"),
                             new PinAtPort(&portb, 7),
                             timerIrq0->getLine("OCF0B"),
                             new PinAtPort(&portg, 5));

    timerIrq1 = new TimerIRQRegister(this, irqSystem, 1);
    timerIrq1->registerLine(0, new IRQLine("TOV1",  20));
    timerIrq1->registerLine(1, new IRQLine("OCF1A", 17));
    timerIrq1->registerLine(2, new IRQLine("OCF1B", 18));
    timerIrq1->registerLine(3, new IRQLine("OCF1C", 19));
    timerIrq1->registerLine(5, new IRQLine("ICF1",  16));

    inputCapture1 = new ICaptureSource(PinAtPort(&portd, 4));
    timer1 = new HWTimer16_3C(this,
                  new PrescalerMultiplexerExt(&prescaler1, PinAtPort(&portd, 6)),
			      1,
			      timerIrq1->getLine("TOV1"),
			      timerIrq1->getLine("OCF1A"),
                  new PinAtPort(&portb, 5),
			      timerIrq1->getLine("OCF1B"),
                  new PinAtPort(&portb, 6),
			      timerIrq1->getLine("OCF1C"),
                  new PinAtPort(&portb, 7),
			      timerIrq1->getLine("ICF1"),
			      inputCapture1);

    timerIrq2 = new TimerIRQRegister(this, irqSystem, 2);
    timerIrq2->registerLine(0, new IRQLine("TOV2",  15));
    timerIrq2->registerLine(1, new IRQLine("OCF2A", 13));
    timerIrq2->registerLine(2, new IRQLine("OCF2B", 14));

    timer2 = new HWTimer8_2C(this,
                             new PrescalerMultiplexer(&prescaler2),
                             2,
                             timerIrq2->getLine("TOV2"),
                             timerIrq2->getLine("OCF2A"),
                             new PinAtPort(&portb, 4),
                             timerIrq2->getLine("OCF2B"),
                             new PinAtPort(&porth, 6));

    timerIrq3 = new TimerIRQRegister(this, irqSystem, 3);
    timerIrq3->registerLine(0, new IRQLine("TOV3",  35));
    timerIrq3->registerLine(1, new IRQLine("OCF3A", 32));
    timerIrq3->registerLine(2, new IRQLine("OCF3B", 33));
    timerIrq3->registerLine(3, new IRQLine("OCF3C", 34));
    timerIrq3->registerLine(5, new IRQLine("ICF3",  31));

    inputCapture3 = new ICaptureSource(PinAtPort(&porte, 7));
    timer3 = new HWTimer16_3C(this,
                  new PrescalerMultiplexerExt(&prescaler1, PinAtPort(&porte, 6)),
			      3,
                  timerIrq3->getLine("TOV3"),
                  timerIrq3->getLine("OCF3A"),
                  new PinAtPort(&porte, 3),
                  timerIrq3->getLine("OCF3B"),
                  new PinAtPort(&porte, 4),
                  timerIrq3->getLine("OCF3C"),
                  new PinAtPort(&porte, 5),
                  timerIrq3->getLine("ICF3"),
			      inputCapture3);

    timerIrq4 = new TimerIRQRegister(this, irqSystem, 4);
    timerIrq4->registerLine(0, new IRQLine("TOV4",  45));
    timerIrq4->registerLine(1, new IRQLine("OCF4A", 42));
    timerIrq4->registerLine(2, new IRQLine("OCF4B", 43));
    timerIrq4->registerLine(3, new IRQLine("OCF4C", 44));
    timerIrq4->registerLine(5, new IRQLine("ICF4",  41));

    inputCapture4 = new ICaptureSource(PinAtPort(&portl, 0));
    timer4 = new HWTimer16_3C(this,
                  new PrescalerMultiplexerExt(&prescaler1, PinAtPort(&porth, 7)),
			      4,
                  timerIrq4->getLine("TOV4"),
                  timerIrq4->getLine("OCF4A"),
                  new PinAtPort(&porth, 3),
                  timerIrq4->getLine("OCF4B"),
                  new PinAtPort(&porth, 4),
                  timerIrq4->getLine("OCF4C"),
                  new PinAtPort(&porth, 5),
                  timerIrq4->getLine("ICF4"),
			      inputCapture4);

    timerIrq5 = new TimerIRQRegister(this, irqSystem, 5);
    timerIrq5->registerLine(0, new IRQLine("TOV5",  50));
    timerIrq5->registerLine(1, new IRQLine("OCF5A", 47));
    timerIrq5->registerLine(2, new IRQLine("OCF5B", 48));
    timerIrq5->registerLine(3, new IRQLine("OCF5C", 49));
    timerIrq5->registerLine(5, new IRQLine("ICF5",  46));

    inputCapture5 = new ICaptureSource(PinAtPort(&portl, 1));
    timer5 = new HWTimer16_3C(this,
                  new PrescalerMultiplexerExt(&prescaler1, PinAtPort(&portl, 2)),
			      5,
                  timerIrq5->getLine("TOV5"),
                  timerIrq5->getLine("OCF5A"),
                  new PinAtPort(&portl, 3),
                  timerIrq5->getLine("OCF5B"),
                  new PinAtPort(&portl, 4),
                  timerIrq5->getLine("OCF5C"),
                  new PinAtPort(&portl, 5),
                  timerIrq5->getLine("ICF5"),
			      inputCapture5);

    gpior0_reg = new GPIORegister(this, &coreTraceGroup, "GPIOR0");
    gpior1_reg = new GPIORegister(this, &coreTraceGroup, "GPIOR1");
    gpior2_reg = new GPIORegister(this, &coreTraceGroup, "GPIOR2");

    admux = new HWAdmuxM16(this, &porta.GetPin(0), &porta.GetPin(1), &porta.GetPin(2),
                                 &porta.GetPin(3), &porta.GetPin(4), &porta.GetPin(5),
                                 &porta.GetPin(6), &porta.GetPin(7));
    aref = new HWARef4(this, HWARef4::REFTYPE_BG3);
    ad = new HWAd(this, HWAd::AD_M164, irqSystem, 29, admux, aref);

    acomp = new HWAcomp(this, irqSystem, PinAtPort(&porte, 2), PinAtPort(&porte, 3), 28, ad, timer1);

    spi = new HWSpi(this,
                    irqSystem,
                    PinAtPort(&portb, 2),   // MOSI
                    PinAtPort(&portb, 3),   // MISO
                    PinAtPort(&portb, 1),   // SCK
                    PinAtPort(&portb, 0),   // /SS
                    24,                     // irqvec
                    true);
    
    wado = new HWWado(this);

    usart0 = new HWUsart(this,
                         irqSystem,
                         PinAtPort(&porte, 1),    // TXD0
                         PinAtPort(&porte, 0),    // RXD0
                         PinAtPort(&porte, 2),    // XCK0
                         25,   // (26) RX complete vector
                         26,   // (27) UDRE vector
                         27);  // (28) TX complete vector

    usart1 = new HWUsart(this,
                         irqSystem,
                         PinAtPort(&portd, 3),    // TXD1
                         PinAtPort(&portd, 2),    // RXD1
                         PinAtPort(&portd, 5),    // XCK1
                         36,   // (37) RX complete vector
                         37,   // (38) UDRE vector
                         38,   // (39) TX complete vector
                         1);   // instance_id for tracking in UI

    usart2 = new HWUsart(this,
                         irqSystem,
                         PinAtPort(&porth, 1),    // TXD2
                         PinAtPort(&porth, 0),    // RXD2
                         PinAtPort(&porth, 2),    // XCK2
                         51,   // (52) RX complete vector
                         52,   // (53) UDRE vector
                         53,   // (54) TX complete vector
                         2);   // instance_id for tracking in UI

    usart3 = new HWUsart(this,
                         irqSystem,
                         PinAtPort(&portj, 1),    // TXD3
                         PinAtPort(&portj, 0),    // RXD3
                         PinAtPort(&portj, 2),    // XCK3
                         54,   // (55) RX complete vector
                         55,   // (56) UDRE vector
                         56,   // (57) TX complete vector
                         3);   // instance_id for tracking in UI

    rw[0x136]= & usart3->udr_reg;
    rw[0x135]= & usart3->ubrrhi_reg;
    rw[0x134]= & usart3->ubrr_reg;
    // 0x133 reserved
    rw[0x132]= & usart3->ucsrc_reg;
    rw[0x131]= & usart3->ucsrb_reg;
    rw[0x130]= & usart3->ucsra_reg;
    // 0x12F and 0x12E reserved
    rw[0x12D]= & timer5->ocrc_h_reg;
    rw[0x12C]= & timer5->ocrc_l_reg;
    rw[0x12B]= & timer5->ocrb_h_reg;
    rw[0x12A]= & timer5->ocrb_l_reg;
    rw[0x129]= & timer5->ocra_h_reg;
    rw[0x128]= & timer5->ocra_l_reg;
    rw[0x127]= & timer5->icr_h_reg;
    rw[0x126]= & timer5->icr_l_reg;
    rw[0x125]= & timer5->tcnt_h_reg;
    rw[0x124]= & timer5->tcnt_l_reg;
    // 0x123 reserved
    rw[0x122]= & timer5->tccrc_reg;
    rw[0x121]= & timer5->tccrb_reg;
    rw[0x120]= & timer5->tccra_reg;
    // 0x10C - 0x11F reserved
    rw[0x10B]= & portl.port_reg;
    rw[0x10A]= & portl.ddr_reg;
    rw[0x109]= & portl.pin_reg;
    rw[0x108]= & portk.port_reg;
    rw[0x107]= & portk.ddr_reg;
    rw[0x106]= & portk.pin_reg;
    rw[0x105]= & portj.port_reg;
    rw[0x104]= & portj.ddr_reg;
    rw[0x103]= & portj.pin_reg;
    rw[0x102]= & porth.port_reg;
    rw[0x101]= & porth.ddr_reg;
    rw[0x100]= & porth.pin_reg;
    // 0xD7 - 0xFF reserved
    rw[0xD6]= & usart2->udr_reg;
    rw[0xD5]= & usart2->ubrrhi_reg;
    rw[0xD4]= & usart2->ubrr_reg;
    // 0xD3 reserved
    rw[0xD2]= & usart2->ucsrc_reg;
    rw[0xD1]= & usart2->ucsrb_reg;
    rw[0xD0]= & usart2->ucsra_reg;
    // 0xCF reserved
    rw[0xCE]= & usart1->udr_reg;
    rw[0xCD]= & usart1->ubrrhi_reg;
    rw[0xCC]= & usart1->ubrr_reg;
    // 0xCB reserved
    rw[0xCA]= & usart1->ucsrc_reg;
    rw[0xC9]= & usart1->ucsrb_reg;
    rw[0xC8]= & usart1->ucsra_reg;
    // 0xC7 reserved
    rw[0xC6]= & usart0->udr_reg;
    rw[0xC5]= & usart0->ubrrhi_reg;
    rw[0xC4]= & usart0->ubrr_reg;
    // 0xC3 reserved
    rw[0xC2]= & usart0->ucsrc_reg;
    rw[0xC1]= & usart0->ucsrb_reg;
    rw[0xC0]= & usart0->ucsra_reg;
    // 0xBF reserved
    // 0xBE reserved
    rw[0xBD]= new NotSimulatedRegister("TWI register TWAMR not simulated");
    rw[0xBC]= new NotSimulatedRegister("TWI register TWCR not simulated");
    rw[0xBB]= new NotSimulatedRegister("TWI register TWDR not simulated");
    rw[0xBA]= new NotSimulatedRegister("TWI register TWAR not simulated");
    rw[0xB9]= new NotSimulatedRegister("TWI register TWSR not simulated");
    rw[0xB8]= new NotSimulatedRegister("TWI register TWBR not simulated");
    // 0xB7 reserved
    rw[0xB6]= & assr_reg;
    // 0xB5 reserved
    rw[0xB4]= & timer2->ocrb_reg;
    rw[0xB3]= & timer2->ocra_reg;
    rw[0xB2]= & timer2->tcnt_reg;
    rw[0xB1]= & timer2->tccrb_reg;
    rw[0xB0]= & timer2->tccra_reg;
    // 0xAE and 0xAF reserved
    rw[0xAD]= & timer4->ocrc_h_reg;
    rw[0xAC]= & timer4->ocrc_l_reg;
    rw[0xAB]= & timer4->ocrb_h_reg;
    rw[0xAA]= & timer4->ocrb_l_reg;
    rw[0xA9]= & timer4->ocra_h_reg;
    rw[0xA8]= & timer4->ocra_l_reg;
    rw[0xA7]= & timer4->icr_h_reg;
    rw[0xA6]= & timer4->icr_l_reg;
    rw[0xA5]= & timer4->tcnt_h_reg;
    rw[0xA4]= & timer4->tcnt_l_reg;
    // 0xA3 reserved
    rw[0xA2]= & timer4->tccrc_reg;
    rw[0xA1]= & timer4->tccrb_reg;
    rw[0xA0]= & timer4->tccra_reg;
    // 0x9E  and 0x9F reserved
    rw[0x9D]= & timer3->ocrc_h_reg;
    rw[0x9C]= & timer3->ocrc_l_reg;
    rw[0x9B]= & timer3->ocrb_h_reg;
    rw[0x9A]= & timer3->ocrb_l_reg;
    rw[0x99]= & timer3->ocra_h_reg;
    rw[0x98]= & timer3->ocra_l_reg;
    rw[0x97]= & timer3->icr_h_reg;
    rw[0x96]= & timer3->icr_l_reg;
    rw[0x95]= & timer3->tcnt_h_reg;
    rw[0x94]= & timer3->tcnt_l_reg;
    // 0x93 reserved
    rw[0x92]= & timer3->tccrc_reg;
    rw[0x91]= & timer3->tccrb_reg;
    rw[0x90]= & timer3->tccra_reg;
    // 0x8E  and 0x8F reserved
    rw[0x8D]= & timer1->ocrc_h_reg;
    rw[0x8C]= & timer1->ocrc_l_reg;
    rw[0x8B]= & timer1->ocrb_h_reg;
    rw[0x8A]= & timer1->ocrb_l_reg;
    rw[0x89]= & timer1->ocra_h_reg;
    rw[0x88]= & timer1->ocra_l_reg;
    rw[0x87]= & timer1->icr_h_reg;
    rw[0x86]= & timer1->icr_l_reg;
    rw[0x85]= & timer1->tcnt_h_reg;
    rw[0x84]= & timer1->tcnt_l_reg;
    // 0x83 reserved
    rw[0x82]= & timer1->tccrc_reg;
    rw[0x81]= & timer1->tccrb_reg;
    rw[0x80]= & timer1->tccra_reg;
    rw[0x7F]= new NotSimulatedRegister("ADC register DIDR1 not simulated");
    rw[0x7E]= new NotSimulatedRegister("ADC register DIDR0 not simulated");
    rw[0x7D]= new NotSimulatedRegister("ADC register DIDR2 not simulated");
    rw[0x7C]= & ad->admux_reg;
    rw[0x7B]= & ad->adcsrb_reg;
    rw[0x7A]= & ad->adcsra_reg;
    rw[0x79]= & ad->adch_reg;
    rw[0x78]= & ad->adcl_reg;
    // 0x76, 0x77 reserved
    rw[0x75]= new NotSimulatedRegister("External Memory Control Register B not simulated");
    rw[0x74]= new NotSimulatedRegister("External Memory Control Register A not simulated");
    rw[0x73]= & timerIrq5->timsk_reg;
    rw[0x72]= & timerIrq4->timsk_reg;
    rw[0x71]= & timerIrq3->timsk_reg;
    rw[0x70]= & timerIrq2->timsk_reg;
    rw[0x6F]= & timerIrq1->timsk_reg;
    rw[0x6E]= & timerIrq0->timsk_reg;
    rw[0x6D]= pcmsk2_reg;
    rw[0x6C]= pcmsk1_reg;
    rw[0x6B]= pcmsk0_reg;
    rw[0x6A]= eicrb_reg;
    rw[0x69]= eicra_reg;
    rw[0x68]= pcicr_reg;
    // 0x67 reserved
    rw[0x66]= osccal_reg;
    rw[0x65]= new NotSimulatedRegister("MCU register PRR1 not simulated");
    rw[0x64]= new NotSimulatedRegister("MCU register PRR0 not simulated");
    // 0x63 reserved
    // 0x62 reserved
    rw[0x61]= clkpr_reg;
    rw[0x60]= new NotSimulatedRegister("MCU register WDTCSR not simulated");
    rw[0x5F]= statusRegister;
    rw[0x5E]= & ((HWStackSram *)stack)->sph_reg;
    rw[0x5D]= & ((HWStackSram *)stack)->spl_reg;
    rw[0x5C]= & eind->ext_reg;
    rw[0x5B]= & rampz->ext_reg;
    // 0x58 - 0x5A reserved
    rw[0x57]= & spmRegister->spmcr_reg;
    // 0x56 reserved
    rw[0x55]= new NotSimulatedRegister("MCU register MCUCR not simulated");
    rw[0x54]= new NotSimulatedRegister("MCU register MCUSR not simulated");
    rw[0x53]= new NotSimulatedRegister("MCU register SMCR not simulated");
    // 0x52 reserved
    rw[0x51]= new NotSimulatedRegister("On-chip debug register OCDR not simulated");
    rw[0x50]= & acomp->acsr_reg;
    // 0x4F reserved
    rw[0x4E]= & spi->spdr_reg;
    rw[0x4D]= & spi->spsr_reg;
    rw[0x4C]= & spi->spcr_reg;
    rw[0x4B]= gpior2_reg;
    rw[0x4A]= gpior1_reg;
    // 0x49 reserved
    rw[0x48]= & timer0->ocrb_reg;
    rw[0x47]= & timer0->ocra_reg;
    rw[0x46]= & timer0->tcnt_reg;
    rw[0x45]= & timer0->tccrb_reg;
    rw[0x44]= & timer0->tccra_reg;
    rw[0x43]= & gtccr_reg;
    rw[0x42]= & eeprom->eearh_reg;
    rw[0x41]= & eeprom->eearl_reg;
    rw[0x40]= & eeprom->eedr_reg;
    rw[0x3F]= & eeprom->eecr_reg;
    rw[0x3E]= gpior0_reg;
    rw[0x3D]= eimsk_reg;
    rw[0x3C]= eifr_reg;
    rw[0x3b]= pcifr_reg;
    rw[0x3A]= & timerIrq5->tifr_reg;
    rw[0x39]= & timerIrq4->tifr_reg;
    rw[0x38]= & timerIrq3->tifr_reg;
    rw[0x37]= & timerIrq2->tifr_reg;
    rw[0x36]= & timerIrq1->tifr_reg;
    rw[0x35]= & timerIrq0->tifr_reg;
    rw[0x34]= & portg.port_reg;
    rw[0x33]= & portg.ddr_reg;
    rw[0x32]= & portg.pin_reg;
    rw[0x31]= & portf.port_reg;
    rw[0x30]= & portf.ddr_reg;
    rw[0x2F]= & portf.pin_reg;
    rw[0x2E]= & porte.port_reg;
    rw[0x2D]= & porte.ddr_reg;
    rw[0x2C]= & porte.pin_reg;
    rw[0x2B]= & portd.port_reg;
    rw[0x2A]= & portd.ddr_reg;
    rw[0x29]= & portd.pin_reg;
    rw[0x28]= & portc.port_reg;
    rw[0x27]= & portc.ddr_reg;
    rw[0x26]= & portc.pin_reg;
    rw[0x25]= & portb.port_reg;
    rw[0x24]= & portb.ddr_reg;
    rw[0x23]= & portb.pin_reg;
    rw[0x22]= & porta.port_reg;
    rw[0x21]= & porta.ddr_reg;
    rw[0x20]= & porta.pin_reg;

    Reset();
}


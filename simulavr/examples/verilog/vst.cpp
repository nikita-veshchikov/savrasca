/*
** Copyright (C) 2015 Klaus Rudolph <lts-rudolph@gmx.de>
**  
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**  
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**  
** You should have received a copy of the GNU General Public License along
** with this program; if not, write to the Free Software Foundation, Inc.,
** 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA..
**  
*/

#include <avr/io.h>
#include <avr/interrupt.h>

// PA0 -> output, toggles programaticaly in 4 states, see below
// PA1 -> output, as above, will not be connected, only for scope
// PA2 -> input,  drives then other PIN
// PA3 -> output, is driven indirect from previous PIN
// PA4 -> shows that the driver is active ( not tri-state or PullUp )
// PA5 -> shows the logic lever of PORT independend of driver

void Init()
{
    DDRA = 0x20|0x10|0x08|0x2|0x01; // Pin 0,1,3,4,5 output
}

void WaitAndMirror()
{
    for ( int i = 0; i<10; i++)
    {
        // Read Pin 2
        bool pin = PINA & 4;
        // Mirror to Pin 3
        PORTA = (PORTA & ( 0xff - ( 1 << 3) )) | ( pin << 3); 
    }
}

int main()
{
    Init();

    // the loop drives PIN 0+1 to 4 states. Verilog has to calculate the results of all combinations
    // of low,high,tristate and pull up.
    
    while (1) 
    {
        DDRA    &= 0xff - 0x03; // drive to TriState
        PORTA   &= 0xff - 0x10; // shows driver is disabled 

        WaitAndMirror();

        PORTA |= 0x20|0x03;     // drive PullUp

        WaitAndMirror();

        DDRA  |= 0x03;          // drive Port to 1
        PORTA |= 0x10;          // show that our driver is enabled

        WaitAndMirror();

        PORTA &= 0xff - ( 0x20| 3); // drive Port to 0

        WaitAndMirror();
    };
}

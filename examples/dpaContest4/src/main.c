/*
 Simple Operating System for Smartcard Education
 Copyright (C) 2002  Matthias Bruestle <m@mbsks.franken.de>

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* $Id: main.c,v 1.31 2002/12/24 13:33:11 m Exp $ */

/*! @file
 \brief main() function with command loop.
 */

//input and outpur ports for the simulator
#define outSimatorPort (*( (volatile char *)0x20))
#define inSimulatorPort  (*( (volatile char *)0x22))

#include <crypt.h>

void readFromInputPort(unsigned char* buffer);
//void text2hex(unsigned char* buffer, unsigned char* res);
void fillData(unsigned char* buffer, unsigned char* res, unsigned char size);
//void printHex(unsigned char byte);
void read16(unsigned char* buffer);
void read1(unsigned char* buffer);


int main(void){
	unsigned char offset[1];
	unsigned char buffer[128];
	//unsigned char i;
	
	unsigned char key[32] = {
		0x6c,0xec,0xc6,0x7f,0x28,0x7d,0x08,0x3d,
		0xeb,0x87,0x66,0xf0,0x73,0x8b,0x36,0xcf,
		0x16,0x4e,0xd9,0xb2,0x46,0x95,0x10,0x90,
		0x86,0x9d,0x08,0x28,0x5d,0x2e,0x19,0x3b};

	unsigned char data[16] = {
						0x00, 0x00, 0x00, 0x00,
						0x00, 0x00, 0x00, 0x00,
						0x00, 0x00, 0x00, 0x00,
						0x00, 0x00, 0x00, 0x00 };
	
	
	
	// read input:
	// 16 bytes of plaintext
	//readFromInputPort(buffer);
	// fill in the data with plaintext
	//fillData(buffer, data, 16);
	read16(data);
	
	// read input:
	// 1 byte of offset
	//readFromInputPort(buffer);
	// fill in offset for the mask
	//fillData(buffer, data, 1);
	read1(offset);
	
	aes_cenc( data, key, offset);	
	
	// output ciphertext
	/*for(i=0;i<16;i++){
		printHex(data[i]);
		outSimatorPort=';';
	}
	outSimatorPort='\n';
	*/
	return 0;
}

void read16(unsigned char* res){
	volatile char in_char;
	unsigned char i = 0;
	for (i=0; i < 16; i++){
		in_char = inSimulatorPort;
		res[i] = in_char;
	}
}

void read1(unsigned char* res){
	volatile char in_char;
	in_char = inSimulatorPort;
	res[0] = in_char;
}


void readFromInputPort(unsigned char* buffer){
	volatile char in_char;
	unsigned char i = 0;
	in_char = inSimulatorPort; // read plaintext
	do {
		buffer[i] = in_char;
		++i;
	} while ( (in_char = inSimulatorPort) != '\n' );
	buffer[i] = '\n';
}

/*
void text2hex(unsigned char* buffer, unsigned char* res){
	unsigned char i = 0, j=0;
	unsigned char tmp0, tmp1;
	while (buffer[i]!='\n'){
		if( (buffer[i]=='0') & (buffer[i+1]=='x') ){
			i+=2;
			if (('a'<=buffer[i]) & (buffer[i]<='f')){
				tmp0 = buffer[i] - 'a' + 10;
			}else{
				tmp0 = buffer[i] - '0';
			}
			i++;
			if (('a'<=buffer[i]) & (buffer[i]<='f')){
				tmp1 = buffer[i] - 'a' + 10;
			}else{
				tmp1 = buffer[i] - '0';
			}
			i++;
			res[j] = (tmp0<<4) | tmp1;
			j++;
		}else{
			i++;
		}
	}
}*/

void fillData(unsigned char* buffer, unsigned char* res, unsigned char size){
	unsigned char i;
	for(i=0; i< size; i++){
		res[i] = buffer[i];
	}
}

/*
void printHex(unsigned char byte){
	outSimatorPort = '0';
	outSimatorPort = 'x';
	if((byte >>4)<10 ){
		outSimatorPort = (byte>>4)+'0';
	}else{
		outSimatorPort = (byte>>4)-10+'a';
	}
	
	if((byte & 0xF)<10 ){
		outSimatorPort = (byte& 0xF)+'0';
	}else{
		outSimatorPort = (byte& 0xF)-10+'a';
	}
}*/

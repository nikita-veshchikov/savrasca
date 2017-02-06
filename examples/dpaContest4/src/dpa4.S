
dpa4.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	0c 94 29 00 	jmp	0x52	; 0x52 <__ctors_end>
       4:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
       8:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
       c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      10:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      14:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      18:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      1c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      20:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      24:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      28:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      2c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      30:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      34:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      38:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      3c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      40:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
      44:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>

00000048 <rc_tab>:
      48:	01 02 04 08 10 20 40 80 1b 36                       ..... @..6

00000052 <__ctors_end>:
      52:	11 24       	eor	r1, r1
      54:	1f be       	out	0x3f, r1	; 63
      56:	cf e5       	ldi	r28, 0x5F	; 95
      58:	d4 e0       	ldi	r29, 0x04	; 4
      5a:	de bf       	out	0x3e, r29	; 62
      5c:	cd bf       	out	0x3d, r28	; 61

0000005e <__do_copy_data>:
      5e:	11 e0       	ldi	r17, 0x01	; 1
      60:	a0 e6       	ldi	r26, 0x60	; 96
      62:	b0 e0       	ldi	r27, 0x00	; 0
      64:	ee ea       	ldi	r30, 0xAE	; 174
      66:	f0 e3       	ldi	r31, 0x30	; 48
      68:	02 c0       	rjmp	.+4      	; 0x6e <__do_copy_data+0x10>
      6a:	05 90       	lpm	r0, Z+
      6c:	0d 92       	st	X+, r0
      6e:	a8 39       	cpi	r26, 0x98	; 152
      70:	b1 07       	cpc	r27, r17
      72:	d9 f7       	brne	.-10     	; 0x6a <__do_copy_data+0xc>

00000074 <__do_clear_bss>:
      74:	11 e0       	ldi	r17, 0x01	; 1
      76:	a8 e9       	ldi	r26, 0x98	; 152
      78:	b1 e0       	ldi	r27, 0x01	; 1
      7a:	01 c0       	rjmp	.+2      	; 0x7e <.do_clear_bss_start>

0000007c <.do_clear_bss_loop>:
      7c:	1d 92       	st	X+, r1

0000007e <.do_clear_bss_start>:
      7e:	ab 3b       	cpi	r26, 0xBB	; 187
      80:	b1 07       	cpc	r27, r17
      82:	e1 f7       	brne	.-8      	; 0x7c <.do_clear_bss_loop>
      84:	0e 94 d7 01 	call	0x3ae	; 0x3ae <main>
      88:	0c 94 55 18 	jmp	0x30aa	; 0x30aa <_exit>

0000008c <__bad_interrupt>:
      8c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000090 <hal_init>:
uint8_t randbytes;
#endif
uint8_t z[1];
void hal_init( void )
{
	ACSR =  0x80; /* outb(0x80,ACSR) */
      90:	80 e8       	ldi	r24, 0x80	; 128
      92:	88 b9       	out	0x08, r24	; 8
	DDRA =  0x00; /* outb(0xFF,DDRA) */
      94:	1a ba       	out	0x1a, r1	; 26
	DDRB =  0b01000000; /* outb(0xFF,DDRB) */
      96:	80 e4       	ldi	r24, 0x40	; 64
      98:	87 bb       	out	0x17, r24	; 23
	DDRC =  0x00; /* outb(0xFF,DDRC) */
      9a:	14 ba       	out	0x14, r1	; 20
	DDRD =  0x00; /* outb(0xFF,DDRD) */
      9c:	11 ba       	out	0x11, r1	; 17
	PORTA = 0xFF; /* outb(0xFF,PORTA) */
      9e:	8f ef       	ldi	r24, 0xFF	; 255
      a0:	8b bb       	out	0x1b, r24	; 27
	PORTB = 0b10111111; /* outb(0xFF,PORTB) */
      a2:	9f eb       	ldi	r25, 0xBF	; 191
      a4:	98 bb       	out	0x18, r25	; 24
	PORTC = 0xFF; /* outb(0xFF,PORTC) */
      a6:	85 bb       	out	0x15, r24	; 21
	PORTD = 0xFF; /* outb(0xFF,PORTD) */
      a8:	82 bb       	out	0x12, r24	; 18

#if CONF_WITH_TRNG==1
	/* Random number gathering */
	randbytes=0;
      aa:	10 92 a1 01 	sts	0x01A1, r1
	TIMSK = 0;	/* Disable timer interrupts */
      ae:	19 be       	out	0x39, r1	; 57
	TCNT0 = 0;	/* Set timer 0 value */
      b0:	12 be       	out	0x32, r1	; 50
	TCCR0 = 1;	/* Start timer 0 */
      b2:	81 e0       	ldi	r24, 0x01	; 1
      b4:	83 bf       	out	0x33, r24	; 51
#endif

	return;
}
      b6:	08 95       	ret

000000b8 <hal_eeprom_read>:
	b: r22
*/
extern void xewrt( uint16_t addr, uint8_t b );

bool hal_eeprom_read( uint8_t *dst, uint16_t src, uint8_t len )
{
      b8:	ff 92       	push	r15
      ba:	0f 93       	push	r16
      bc:	1f 93       	push	r17
      be:	cf 93       	push	r28
      c0:	df 93       	push	r29
      c2:	ec 01       	movw	r28, r24
      c4:	8b 01       	movw	r16, r22
      c6:	f4 2e       	mov	r15, r20
	while( len-- ) {
      c8:	ff 20       	and	r15, r15
      ca:	71 f0       	breq	.+28     	; 0xe8 <hal_eeprom_read+0x30>
		if( src<EEPROM_SIZE ) {
      cc:	82 e0       	ldi	r24, 0x02	; 2
      ce:	00 30       	cpi	r16, 0x00	; 0
      d0:	18 07       	cpc	r17, r24
      d2:	40 f4       	brcc	.+16     	; 0xe4 <hal_eeprom_read+0x2c>
			/* Internal EEPROM */
			while( !eeprom_is_ready() ) {}
      d4:	e1 99       	sbic	0x1c, 1	; 28
      d6:	fe cf       	rjmp	.-4      	; 0xd4 <hal_eeprom_read+0x1c>

			*dst++ = eeprom_read_byte((uint8_t*) src++ );
      d8:	c8 01       	movw	r24, r16
      da:	0f 5f       	subi	r16, 0xFF	; 255
      dc:	1f 4f       	sbci	r17, 0xFF	; 255
      de:	0e 94 40 18 	call	0x3080	; 0x3080 <__eerd_byte_m163>
      e2:	89 93       	st	Y+, r24
      e4:	fa 94       	dec	r15
*/
extern void xewrt( uint16_t addr, uint8_t b );

bool hal_eeprom_read( uint8_t *dst, uint16_t src, uint8_t len )
{
	while( len-- ) {
      e6:	91 f7       	brne	.-28     	; 0xcc <hal_eeprom_read+0x14>
#endif /* CONF_WITH_I2CEEPROM==1 */
		}
	}

	return TRUE;
}
      e8:	81 e0       	ldi	r24, 0x01	; 1
      ea:	cd b7       	in	r28, 0x3d	; 61
      ec:	de b7       	in	r29, 0x3e	; 62
      ee:	e5 e0       	ldi	r30, 0x05	; 5
      f0:	0c 94 29 18 	jmp	0x3052	; 0x3052 <__epilogue_restores__+0x1a>

000000f4 <hal_eeprom_write>:

/* TODO: Compare written data? Return 6581 on error. */
bool hal_eeprom_write( uint16_t dst, uint8_t *src, uint8_t len )
{
      f4:	cf 92       	push	r12
      f6:	df 92       	push	r13
      f8:	ff 92       	push	r15
      fa:	0f 93       	push	r16
      fc:	1f 93       	push	r17
      fe:	cf 93       	push	r28
     100:	df 93       	push	r29
     102:	ec 01       	movw	r28, r24
     104:	8b 01       	movw	r16, r22
     106:	f4 2e       	mov	r15, r20
	while( len-- ) {
     108:	ff 20       	and	r15, r15
     10a:	79 f0       	breq	.+30     	; 0x12a <hal_eeprom_write+0x36>
		if( dst<EEPROM_SIZE ) {
     10c:	22 e0       	ldi	r18, 0x02	; 2
     10e:	c0 30       	cpi	r28, 0x00	; 0
     110:	d2 07       	cpc	r29, r18
     112:	48 f4       	brcc	.+18     	; 0x126 <hal_eeprom_write+0x32>
			/* Internal EEPROM */
			while( !eeprom_is_ready() ) {}
     114:	e1 99       	sbic	0x1c, 1	; 28
     116:	fe cf       	rjmp	.-4      	; 0x114 <hal_eeprom_write+0x20>

			eeprom_write_byte( (uint8_t*)dst++, *src++ );
     118:	ce 01       	movw	r24, r28
     11a:	21 96       	adiw	r28, 0x01	; 1
     11c:	f8 01       	movw	r30, r16
     11e:	61 91       	ld	r22, Z+
     120:	8f 01       	movw	r16, r30
     122:	0e 94 48 18 	call	0x3090	; 0x3090 <__eewr_byte_m163>
     126:	fa 94       	dec	r15
}

/* TODO: Compare written data? Return 6581 on error. */
bool hal_eeprom_write( uint16_t dst, uint8_t *src, uint8_t len )
{
	while( len-- ) {
     128:	89 f7       	brne	.-30     	; 0x10c <hal_eeprom_write+0x18>
#endif /* CONF_WITH_I2CEEPROM==1 */
		}
	}

	return TRUE;
}
     12a:	81 e0       	ldi	r24, 0x01	; 1
     12c:	df 91       	pop	r29
     12e:	cf 91       	pop	r28
     130:	1f 91       	pop	r17
     132:	0f 91       	pop	r16
     134:	ff 90       	pop	r15
     136:	df 90       	pop	r13
     138:	cf 90       	pop	r12
     13a:	08 95       	ret

0000013c <hal_io_sendByteT0>:

extern void delay1etu1(uint8_t delay);

void hal_io_sendByteT0( uint8_t b )
{
	sendbytet0( b );
     13c:	0e 94 48 06 	call	0xc90	; 0xc90 <sendbytet0>
	return;
}
     140:	08 95       	ret

00000142 <hal_trig1>:

void hal_trig1( void )
{
	return trig1();
     142:	0e 94 85 06 	call	0xd0a	; 0xd0a <trig1>
}
     146:	08 95       	ret

00000148 <hal_trig0>:

void hal_trig0( void )
{
	return trig0();
     148:	0e 94 88 06 	call	0xd10	; 0xd10 <trig0>
}
     14c:	08 95       	ret

0000014e <hal_io_recByteT0>:
	//delay1etu1(delay);
//}

uint8_t hal_io_recByteT0( void )
{
	return recbytet0();
     14e:	0e 94 03 06 	call	0xc06	; 0xc06 <recbytet0>
}
     152:	08 95       	ret

00000154 <hal_rnd_addEntropy>:


#if CONF_WITH_TRNG==1
bool hal_rnd_addEntropy( void )
{
     154:	a8 e1       	ldi	r26, 0x18	; 24
     156:	b0 e0       	ldi	r27, 0x00	; 0
     158:	e0 eb       	ldi	r30, 0xB0	; 176
     15a:	f0 e0       	ldi	r31, 0x00	; 0
     15c:	0c 94 0e 18 	jmp	0x301c	; 0x301c <__prologue_saves__+0x1c>
	//
	z[0]=0;
     160:	10 92 a0 01 	sts	0x01A0, r1
	randdata.c[(randbytes++)&0x07] = inp( TCNT0 );	/* Read timer 0 */
     164:	80 91 a1 01 	lds	r24, 0x01A1
     168:	e2 b7       	in	r30, 0x32	; 50
     16a:	f0 e0       	ldi	r31, 0x00	; 0
     16c:	90 a1       	ldd	r25, Z+32	; 0x20
     16e:	e8 2f       	mov	r30, r24
     170:	f0 e0       	ldi	r31, 0x00	; 0
     172:	e7 70       	andi	r30, 0x07	; 7
     174:	f0 70       	andi	r31, 0x00	; 0
     176:	e8 56       	subi	r30, 0x68	; 104
     178:	fe 4f       	sbci	r31, 0xFE	; 254
     17a:	90 83       	st	Z, r25
     17c:	8f 5f       	subi	r24, 0xFF	; 255
     17e:	80 93 a1 01 	sts	0x01A1, r24

	if( randbytes>7 ) {
     182:	88 30       	cpi	r24, 0x08	; 8
     184:	38 f4       	brcc	.+14     	; 0x194 <hal_rnd_addEntropy+0x40>
		if( !hal_eeprom_write( RAND_STATE_ADDR, (uint8_t*)x917.state,
			sizeof(x917.state) ) )
			return FALSE;
	}

	return TRUE;
     186:	91 e0       	ldi	r25, 0x01	; 1
}
     188:	89 2f       	mov	r24, r25
     18a:	68 96       	adiw	r28, 0x18	; 24
     18c:	e4 e0       	ldi	r30, 0x04	; 4
     18e:	0c 94 2a 18 	jmp	0x3054	; 0x3054 <__epilogue_restores__+0x1c>
     192:	46 c0       	rjmp	.+140    	; 0x220 <hal_rnd_getBlock>
		struct {
			uint32_t state[2];
			uint32_t key[4];
		} x917;

		randbytes=0;
     194:	10 92 a1 01 	sts	0x01A1, r1

		log_add( LOG_TAG_RANDOM, randdata.c, sizeof(randdata.c) );
     198:	88 e0       	ldi	r24, 0x08	; 8
     19a:	68 e9       	ldi	r22, 0x98	; 152
     19c:	71 e0       	ldi	r23, 0x01	; 1
     19e:	48 e0       	ldi	r20, 0x08	; 8
     1a0:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>

		if( !hal_eeprom_read( (uint8_t*)x917.state, RAND_STATE_ADDR+8,
     1a4:	8e 01       	movw	r16, r28
     1a6:	0f 5f       	subi	r16, 0xFF	; 255
     1a8:	1f 4f       	sbci	r17, 0xFF	; 255
     1aa:	c8 01       	movw	r24, r16
     1ac:	6e e2       	ldi	r22, 0x2E	; 46
     1ae:	70 e0       	ldi	r23, 0x00	; 0
     1b0:	48 e1       	ldi	r20, 0x18	; 24
     1b2:	0e 94 5c 00 	call	0xb8	; 0xb8 <hal_eeprom_read>
     1b6:	88 23       	and	r24, r24
     1b8:	39 f4       	brne	.+14     	; 0x1c8 <hal_rnd_addEntropy+0x74>
			sizeof(x917) ) )
			return FALSE;
     1ba:	90 e0       	ldi	r25, 0x00	; 0
			sizeof(x917.state) ) )
			return FALSE;
	}

	return TRUE;
}
     1bc:	89 2f       	mov	r24, r25
     1be:	68 96       	adiw	r28, 0x18	; 24
     1c0:	e4 e0       	ldi	r30, 0x04	; 4
     1c2:	0c 94 2a 18 	jmp	0x3054	; 0x3054 <__epilogue_restores__+0x1c>
     1c6:	2c c0       	rjmp	.+88     	; 0x220 <hal_rnd_getBlock>

		if( !hal_eeprom_read( (uint8_t*)x917.state, RAND_STATE_ADDR+8,
			sizeof(x917) ) )
			return FALSE;

		x917.state[0]=randdata.l[0];
     1c8:	80 91 98 01 	lds	r24, 0x0198
     1cc:	90 91 99 01 	lds	r25, 0x0199
     1d0:	a0 91 9a 01 	lds	r26, 0x019A
     1d4:	b0 91 9b 01 	lds	r27, 0x019B
     1d8:	89 83       	std	Y+1, r24	; 0x01
     1da:	9a 83       	std	Y+2, r25	; 0x02
     1dc:	ab 83       	std	Y+3, r26	; 0x03
     1de:	bc 83       	std	Y+4, r27	; 0x04
		x917.state[1]=randdata.l[1];
     1e0:	80 91 9c 01 	lds	r24, 0x019C
     1e4:	90 91 9d 01 	lds	r25, 0x019D
     1e8:	a0 91 9e 01 	lds	r26, 0x019E
     1ec:	b0 91 9f 01 	lds	r27, 0x019F
     1f0:	8d 83       	std	Y+5, r24	; 0x05
     1f2:	9e 83       	std	Y+6, r25	; 0x06
     1f4:	af 83       	std	Y+7, r26	; 0x07
     1f6:	b8 87       	std	Y+8, r27	; 0x08

		crypt_enc( x917.state, x917.key,(uint8_t *)z, (uint8_t)1 );
     1f8:	c8 01       	movw	r24, r16
     1fa:	be 01       	movw	r22, r28
     1fc:	67 5f       	subi	r22, 0xF7	; 247
     1fe:	7f 4f       	sbci	r23, 0xFF	; 255
     200:	40 ea       	ldi	r20, 0xA0	; 160
     202:	51 e0       	ldi	r21, 0x01	; 1
     204:	21 e0       	ldi	r18, 0x01	; 1
     206:	0e 94 54 05 	call	0xaa8	; 0xaa8 <aes_cenc>

		if( !hal_eeprom_write( RAND_STATE_ADDR, (uint8_t*)x917.state,
     20a:	86 e2       	ldi	r24, 0x26	; 38
     20c:	90 e0       	ldi	r25, 0x00	; 0
     20e:	b8 01       	movw	r22, r16
     210:	48 e0       	ldi	r20, 0x08	; 8
     212:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
	return recbytet0();
}


#if CONF_WITH_TRNG==1
bool hal_rnd_addEntropy( void )
     216:	91 e0       	ldi	r25, 0x01	; 1
     218:	88 23       	and	r24, r24
     21a:	09 f0       	breq	.+2      	; 0x21e <hal_rnd_addEntropy+0xca>
     21c:	b5 cf       	rjmp	.-150    	; 0x188 <hal_rnd_addEntropy+0x34>
     21e:	cd cf       	rjmp	.-102    	; 0x1ba <hal_rnd_addEntropy+0x66>

00000220 <hal_rnd_getBlock>:
#include <log.h>

//#if 0
/* We don't need to swap here bytes, because we just need random data. */
bool hal_rnd_getBlock( uint8_t *dst )
{
     220:	a2 e2       	ldi	r26, 0x22	; 34
     222:	b0 e0       	ldi	r27, 0x00	; 0
     224:	e6 e1       	ldi	r30, 0x16	; 22
     226:	f1 e0       	ldi	r31, 0x01	; 1
     228:	0c 94 08 18 	jmp	0x3010	; 0x3010 <__prologue_saves__+0x10>
     22c:	6c 01       	movw	r12, r24
		uint32_t state[2];
		uint32_t key[4];
	} x917;

	//uint8_t z[1];
	z[0]=0;
     22e:	10 92 a0 01 	sts	0x01A0, r1
uint16_t data;
log_enable=TRUE;
     232:	81 e0       	ldi	r24, 0x01	; 1
     234:	80 93 b9 01 	sts	0x01B9, r24

	if( ! hal_eeprom_read( (uint8_t*)&x917, RAND_STATE_ADDR, sizeof(x917) ) )
     238:	8e 01       	movw	r16, r28
     23a:	0d 5f       	subi	r16, 0xFD	; 253
     23c:	1f 4f       	sbci	r17, 0xFF	; 255
     23e:	c8 01       	movw	r24, r16
     240:	66 e2       	ldi	r22, 0x26	; 38
     242:	70 e0       	ldi	r23, 0x00	; 0
     244:	40 e2       	ldi	r20, 0x20	; 32
     246:	0e 94 5c 00 	call	0xb8	; 0xb8 <hal_eeprom_read>
     24a:	88 23       	and	r24, r24
     24c:	29 f4       	brne	.+10     	; 0x258 <hal_rnd_getBlock+0x38>
data = RAND_STATE_LEN+sizeof(x917.counter);
log_add( LOG_TAG_EEWRITE_LEN, &data, 2 );
#endif
	if( !hal_eeprom_write( RAND_STATE_ADDR+sizeof(x917.counter), (uint8_t*)&x917
		+sizeof(x917.counter), RAND_STATE_LEN+sizeof(x917.counter) ) )
		return FALSE;
     24e:	80 e0       	ldi	r24, 0x00	; 0
log_add( LOG_TAG_JOKER, "DONE", 4 );
log_enable=FALSE;

	return TRUE;
}
     250:	a2 96       	adiw	r28, 0x22	; 34
     252:	ea e0       	ldi	r30, 0x0A	; 10
     254:	0c 94 24 18 	jmp	0x3048	; 0x3048 <__epilogue_restores__+0x10>

	if( ! hal_eeprom_read( (uint8_t*)&x917, RAND_STATE_ADDR, sizeof(x917) ) )
		return FALSE;

	/* Overflow is probably not possible. Before that, the EEPROM dies. */
	x917.counter[0]++;
     258:	8b 81       	ldd	r24, Y+3	; 0x03
     25a:	9c 81       	ldd	r25, Y+4	; 0x04
     25c:	ad 81       	ldd	r26, Y+5	; 0x05
     25e:	be 81       	ldd	r27, Y+6	; 0x06
     260:	01 96       	adiw	r24, 0x01	; 1
     262:	a1 1d       	adc	r26, r1
     264:	b1 1d       	adc	r27, r1
     266:	8b 83       	std	Y+3, r24	; 0x03
     268:	9c 83       	std	Y+4, r25	; 0x04
     26a:	ad 83       	std	Y+5, r26	; 0x05
     26c:	be 83       	std	Y+6, r27	; 0x06

	if( !hal_eeprom_write( RAND_STATE_ADDR, (uint8_t*)x917.counter,
     26e:	86 e2       	ldi	r24, 0x26	; 38
     270:	90 e0       	ldi	r25, 0x00	; 0
     272:	b8 01       	movw	r22, r16
     274:	48 e0       	ldi	r20, 0x08	; 8
     276:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
     27a:	88 23       	and	r24, r24
     27c:	41 f3       	breq	.-48     	; 0x24e <hal_rnd_getBlock+0x2e>
		sizeof(x917.counter) ) )
		return FALSE;

data = dst;
     27e:	c9 82       	std	Y+1, r12	; 0x01
     280:	da 82       	std	Y+2, r13	; 0x02
log_add( LOG_TAG_JOKER, &data, 2 );
     282:	7e 01       	movw	r14, r28
     284:	08 94       	sec
     286:	e1 1c       	adc	r14, r1
     288:	f1 1c       	adc	r15, r1
     28a:	8e ef       	ldi	r24, 0xFE	; 254
     28c:	b7 01       	movw	r22, r14
     28e:	42 e0       	ldi	r20, 0x02	; 2
     290:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>
data = &(x917);
     294:	1a 83       	std	Y+2, r17	; 0x02
     296:	09 83       	std	Y+1, r16	; 0x01
log_add( LOG_TAG_JOKER, &data, 2 );
     298:	8e ef       	ldi	r24, 0xFE	; 254
     29a:	b7 01       	movw	r22, r14
     29c:	42 e0       	ldi	r20, 0x02	; 2
     29e:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>
data = &(x917.counter[0]);
     2a2:	1a 83       	std	Y+2, r17	; 0x02
     2a4:	09 83       	std	Y+1, r16	; 0x01
log_add( LOG_TAG_JOKER, &data, 2 );
     2a6:	8e ef       	ldi	r24, 0xFE	; 254
     2a8:	b7 01       	movw	r22, r14
     2aa:	42 e0       	ldi	r20, 0x02	; 2
     2ac:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>
data = &(x917.key[0]);
     2b0:	83 e1       	ldi	r24, 0x13	; 19
     2b2:	a8 2e       	mov	r10, r24
     2b4:	b1 2c       	mov	r11, r1
     2b6:	ac 0e       	add	r10, r28
     2b8:	bd 1e       	adc	r11, r29
     2ba:	ba 82       	std	Y+2, r11	; 0x02
     2bc:	a9 82       	std	Y+1, r10	; 0x01
log_add( LOG_TAG_JOKER, &data, 2 );
     2be:	8e ef       	ldi	r24, 0xFE	; 254
     2c0:	b7 01       	movw	r22, r14
     2c2:	42 e0       	ldi	r20, 0x02	; 2
     2c4:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>
	crypt_enc( &(x917.counter[0]), &(x917.key[0]),z, (uint8_t)1 );
     2c8:	c8 01       	movw	r24, r16
     2ca:	b5 01       	movw	r22, r10
     2cc:	40 ea       	ldi	r20, 0xA0	; 160
     2ce:	51 e0       	ldi	r21, 0x01	; 1
     2d0:	21 e0       	ldi	r18, 0x01	; 1
     2d2:	0e 94 54 05 	call	0xaa8	; 0xaa8 <aes_cenc>

log_add( LOG_TAG_JOKER, NULL, 0 );
     2d6:	8e ef       	ldi	r24, 0xFE	; 254
     2d8:	60 e0       	ldi	r22, 0x00	; 0
     2da:	70 e0       	ldi	r23, 0x00	; 0
     2dc:	40 e0       	ldi	r20, 0x00	; 0
     2de:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>
	((uint32_t*)dst)[0]=x917.counter[0]^x917.state[0];
     2e2:	8b 85       	ldd	r24, Y+11	; 0x0b
     2e4:	9c 85       	ldd	r25, Y+12	; 0x0c
     2e6:	ad 85       	ldd	r26, Y+13	; 0x0d
     2e8:	be 85       	ldd	r27, Y+14	; 0x0e
     2ea:	2b 81       	ldd	r18, Y+3	; 0x03
     2ec:	3c 81       	ldd	r19, Y+4	; 0x04
     2ee:	4d 81       	ldd	r20, Y+5	; 0x05
     2f0:	5e 81       	ldd	r21, Y+6	; 0x06
     2f2:	82 27       	eor	r24, r18
     2f4:	93 27       	eor	r25, r19
     2f6:	a4 27       	eor	r26, r20
     2f8:	b5 27       	eor	r27, r21
     2fa:	f6 01       	movw	r30, r12
     2fc:	80 83       	st	Z, r24
     2fe:	91 83       	std	Z+1, r25	; 0x01
     300:	a2 83       	std	Z+2, r26	; 0x02
     302:	b3 83       	std	Z+3, r27	; 0x03
	((uint32_t*)dst)[1]=x917.counter[1]^x917.state[1];
     304:	8f 85       	ldd	r24, Y+15	; 0x0f
     306:	98 89       	ldd	r25, Y+16	; 0x10
     308:	a9 89       	ldd	r26, Y+17	; 0x11
     30a:	ba 89       	ldd	r27, Y+18	; 0x12
     30c:	2f 81       	ldd	r18, Y+7	; 0x07
     30e:	38 85       	ldd	r19, Y+8	; 0x08
     310:	49 85       	ldd	r20, Y+9	; 0x09
     312:	5a 85       	ldd	r21, Y+10	; 0x0a
     314:	82 27       	eor	r24, r18
     316:	93 27       	eor	r25, r19
     318:	a4 27       	eor	r26, r20
     31a:	b5 27       	eor	r27, r21
     31c:	84 83       	std	Z+4, r24	; 0x04
     31e:	95 83       	std	Z+5, r25	; 0x05
     320:	a6 83       	std	Z+6, r26	; 0x06
     322:	b7 83       	std	Z+7, r27	; 0x07
	crypt_enc( dst, x917.key,z, (uint8_t)1 );
     324:	c6 01       	movw	r24, r12
     326:	b5 01       	movw	r22, r10
     328:	40 ea       	ldi	r20, 0xA0	; 160
     32a:	51 e0       	ldi	r21, 0x01	; 1
     32c:	21 e0       	ldi	r18, 0x01	; 1
     32e:	0e 94 54 05 	call	0xaa8	; 0xaa8 <aes_cenc>

	x917.state[0]=x917.counter[0]^((uint32_t*)dst)[0];
     332:	f6 01       	movw	r30, r12
     334:	80 81       	ld	r24, Z
     336:	91 81       	ldd	r25, Z+1	; 0x01
     338:	a2 81       	ldd	r26, Z+2	; 0x02
     33a:	b3 81       	ldd	r27, Z+3	; 0x03
     33c:	2b 81       	ldd	r18, Y+3	; 0x03
     33e:	3c 81       	ldd	r19, Y+4	; 0x04
     340:	4d 81       	ldd	r20, Y+5	; 0x05
     342:	5e 81       	ldd	r21, Y+6	; 0x06
     344:	82 27       	eor	r24, r18
     346:	93 27       	eor	r25, r19
     348:	a4 27       	eor	r26, r20
     34a:	b5 27       	eor	r27, r21
     34c:	8b 87       	std	Y+11, r24	; 0x0b
     34e:	9c 87       	std	Y+12, r25	; 0x0c
     350:	ad 87       	std	Y+13, r26	; 0x0d
     352:	be 87       	std	Y+14, r27	; 0x0e
	x917.state[1]=x917.counter[1]^((uint32_t*)dst)[1];
     354:	84 81       	ldd	r24, Z+4	; 0x04
     356:	95 81       	ldd	r25, Z+5	; 0x05
     358:	a6 81       	ldd	r26, Z+6	; 0x06
     35a:	b7 81       	ldd	r27, Z+7	; 0x07
     35c:	2f 81       	ldd	r18, Y+7	; 0x07
     35e:	38 85       	ldd	r19, Y+8	; 0x08
     360:	49 85       	ldd	r20, Y+9	; 0x09
     362:	5a 85       	ldd	r21, Y+10	; 0x0a
     364:	82 27       	eor	r24, r18
     366:	93 27       	eor	r25, r19
     368:	a4 27       	eor	r26, r20
     36a:	b5 27       	eor	r27, r21
     36c:	8f 87       	std	Y+15, r24	; 0x0f
     36e:	98 8b       	std	Y+16, r25	; 0x10
     370:	a9 8b       	std	Y+17, r26	; 0x11
     372:	ba 8b       	std	Y+18, r27	; 0x12
	crypt_enc( x917.state, x917.key,z, (uint8_t)1 );
     374:	8e 01       	movw	r16, r28
     376:	05 5f       	subi	r16, 0xF5	; 245
     378:	1f 4f       	sbci	r17, 0xFF	; 255
     37a:	c8 01       	movw	r24, r16
     37c:	b5 01       	movw	r22, r10
     37e:	40 ea       	ldi	r20, 0xA0	; 160
     380:	51 e0       	ldi	r21, 0x01	; 1
     382:	21 e0       	ldi	r18, 0x01	; 1
     384:	0e 94 54 05 	call	0xaa8	; 0xaa8 <aes_cenc>
data = &x917+sizeof(x917.counter);
log_add( LOG_TAG_EEWRITE_SRC, &data, 2 );
data = RAND_STATE_LEN+sizeof(x917.counter);
log_add( LOG_TAG_EEWRITE_LEN, &data, 2 );
#endif
	if( !hal_eeprom_write( RAND_STATE_ADDR+sizeof(x917.counter), (uint8_t*)&x917
     388:	8e e2       	ldi	r24, 0x2E	; 46
     38a:	90 e0       	ldi	r25, 0x00	; 0
     38c:	b8 01       	movw	r22, r16
     38e:	48 e2       	ldi	r20, 0x28	; 40
     390:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
     394:	88 23       	and	r24, r24
     396:	09 f4       	brne	.+2      	; 0x39a <hal_rnd_getBlock+0x17a>
     398:	5a cf       	rjmp	.-332    	; 0x24e <hal_rnd_getBlock+0x2e>
		+sizeof(x917.counter), RAND_STATE_LEN+sizeof(x917.counter) ) )
		return FALSE;
log_add( LOG_TAG_JOKER, "DONE", 4 );
     39a:	8e ef       	ldi	r24, 0xFE	; 254
     39c:	60 e6       	ldi	r22, 0x60	; 96
     39e:	70 e0       	ldi	r23, 0x00	; 0
     3a0:	44 e0       	ldi	r20, 0x04	; 4
     3a2:	0e 94 a3 05 	call	0xb46	; 0xb46 <log_add>
log_enable=FALSE;
     3a6:	10 92 b9 01 	sts	0x01B9, r1

	return TRUE;
     3aa:	81 e0       	ldi	r24, 0x01	; 1
     3ac:	51 cf       	rjmp	.-350    	; 0x250 <hal_rnd_getBlock+0x30>

000003ae <main>:
#if defined(CTAPI)
void sosse_main( void )
#else
int main(void)
#endif
{
     3ae:	a3 e3       	ldi	r26, 0x33	; 51
     3b0:	b0 e0       	ldi	r27, 0x00	; 0
     3b2:	ed ed       	ldi	r30, 0xDD	; 221
     3b4:	f1 e0       	ldi	r31, 0x01	; 1
     3b6:	0c 94 06 18 	jmp	0x300c	; 0x300c <__prologue_saves__+0xc>

	//WDTCR = 0x1e;
	WDTCR = 0x10;
     3ba:	80 e1       	ldi	r24, 0x10	; 16
     3bc:	81 bd       	out	0x21, r24	; 33
	uint8_t j[1];
	uint8_t k[1];

	/* TODO: On error? */

	hal_init();
     3be:	0e 94 48 00 	call	0x90	; 0x90 <hal_init>

	/* Send ATR */
	/* TODO: Possible from EEPROM? */
	hal_io_sendByteT0(0x3B);
     3c2:	8b e3       	ldi	r24, 0x3B	; 59
     3c4:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
	hal_io_sendByteT0( 0xAA );
     3c8:	8a ea       	ldi	r24, 0xAA	; 170
     3ca:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
	//resplen = 0;

	/* Initialize FS state in RAM. */
	/* TODO: On error? */

	uint8_t key[32] = {
     3ce:	34 e1       	ldi	r19, 0x14	; 20
     3d0:	83 2e       	mov	r8, r19
     3d2:	91 2c       	mov	r9, r1
     3d4:	8c 0e       	add	r8, r28
     3d6:	9d 1e       	adc	r9, r29
     3d8:	d4 01       	movw	r26, r8
     3da:	e5 e6       	ldi	r30, 0x65	; 101
     3dc:	f0 e0       	ldi	r31, 0x00	; 0
     3de:	80 e2       	ldi	r24, 0x20	; 32
     3e0:	01 90       	ld	r0, Z+
     3e2:	0d 92       	st	X+, r0
     3e4:	81 50       	subi	r24, 0x01	; 1
     3e6:	e1 f7       	brne	.-8      	; 0x3e0 <main+0x32>
		0x6c,0xec,0xc6,0x7f,0x28,0x7d,0x08,0x3d,
		0xeb,0x87,0x66,0xf0,0x73,0x8b,0x36,0xcf,
		0x16,0x4e,0xd9,0xb2,0x46,0x95,0x10,0x90,
		0x86,0x9d,0x08,0x28,0x5d,0x2e,0x19,0x3b};

	uint8_t data[16] = {
     3e8:	24 e0       	ldi	r18, 0x04	; 4
     3ea:	c2 2e       	mov	r12, r18
     3ec:	d1 2c       	mov	r13, r1
     3ee:	cc 0e       	add	r12, r28
     3f0:	dd 1e       	adc	r13, r29
     3f2:	80 e1       	ldi	r24, 0x10	; 16
     3f4:	f6 01       	movw	r30, r12
     3f6:	11 92       	st	Z+, r1
     3f8:	8a 95       	dec	r24
     3fa:	e9 f7       	brne	.-6      	; 0x3f6 <main+0x48>
						0x00, 0x00, 0x00, 0x00,
						0x00, 0x00, 0x00, 0x00,
						0x00, 0x00, 0x00, 0x00 };


	if (!(hal_eeprom_read(&len, ATR_LEN_ADDR, 1) && (len <= ATR_MAXLEN)))
     3fc:	ce 01       	movw	r24, r28
     3fe:	01 96       	adiw	r24, 0x01	; 1
     400:	61 e0       	ldi	r22, 0x01	; 1
     402:	70 e0       	ldi	r23, 0x00	; 0
     404:	41 e0       	ldi	r20, 0x01	; 1
     406:	0e 94 5c 00 	call	0xb8	; 0xb8 <hal_eeprom_read>
     40a:	88 23       	and	r24, r24
     40c:	09 f4       	brne	.+2      	; 0x410 <main+0x62>
     40e:	68 c0       	rjmp	.+208    	; 0x4e0 <__stack+0x81>
     410:	89 81       	ldd	r24, Y+1	; 0x01
     412:	8d 31       	cpi	r24, 0x1D	; 29
     414:	08 f0       	brcs	.+2      	; 0x418 <main+0x6a>
     416:	64 c0       	rjmp	.+200    	; 0x4e0 <__stack+0x81>
     418:	ee 24       	eor	r14, r14
     41a:	e3 94       	inc	r14
     41c:	8e 01       	movw	r16, r28
     41e:	0e 5f       	subi	r16, 0xFE	; 254
     420:	1f 4f       	sbci	r17, 0xFF	; 255
     422:	0f c0       	rjmp	.+30     	; 0x442 <main+0x94>
		for (;;) {
		}

	for (i = 1; i < len; i++) {
		if (!hal_eeprom_read(&b, ATR_ADDR + i, 1))
     424:	6e 2d       	mov	r22, r14
     426:	70 e0       	ldi	r23, 0x00	; 0
     428:	6e 5f       	subi	r22, 0xFE	; 254
     42a:	7f 4f       	sbci	r23, 0xFF	; 255
     42c:	c8 01       	movw	r24, r16
     42e:	41 e0       	ldi	r20, 0x01	; 1
     430:	0e 94 5c 00 	call	0xb8	; 0xb8 <hal_eeprom_read>
     434:	88 23       	and	r24, r24
     436:	e1 f1       	breq	.+120    	; 0x4b0 <__stack+0x51>
			for (;;) {
			}
		hal_io_sendByteT0(b);
     438:	8a 81       	ldd	r24, Y+2	; 0x02
     43a:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>

	if (!(hal_eeprom_read(&len, ATR_LEN_ADDR, 1) && (len <= ATR_MAXLEN)))
		for (;;) {
		}

	for (i = 1; i < len; i++) {
     43e:	e3 94       	inc	r14
     440:	89 81       	ldd	r24, Y+1	; 0x01
     442:	e8 16       	cp	r14, r24
     444:	78 f3       	brcs	.-34     	; 0x424 <main+0x76>
     446:	93 e0       	ldi	r25, 0x03	; 3
     448:	a9 2e       	mov	r10, r25
     44a:	b1 2c       	mov	r11, r1
     44c:	ac 0e       	add	r10, r28
     44e:	bd 1e       	adc	r11, r29


#if defined(CTAPI)
void sosse_main( void )
#else
int main(void)
     450:	09 eb       	ldi	r16, 0xB9	; 185
     452:	11 e0       	ldi	r17, 0x01	; 1

	unsigned long z=0;

	/* Command loop */
	for (;;) {
		header[1]=0x00;
     454:	10 92 a5 01 	sts	0x01A5, r1
		header[0]=0x00;
     458:	10 92 a4 01 	sts	0x01A4, r1
     45c:	84 ea       	ldi	r24, 0xA4	; 164
     45e:	e8 2e       	mov	r14, r24
     460:	81 e0       	ldi	r24, 0x01	; 1
     462:	f8 2e       	mov	r15, r24
		for (i = 0; i < 5+16; i++) { //+16
			header[i] = hal_io_recByteT0();
     464:	0e 94 a7 00 	call	0x14e	; 0x14e <hal_io_recByteT0>
     468:	f7 01       	movw	r30, r14
     46a:	81 93       	st	Z+, r24
     46c:	7f 01       	movw	r14, r30

	/* Command loop */
	for (;;) {
		header[1]=0x00;
		header[0]=0x00;
		for (i = 0; i < 5+16; i++) { //+16
     46e:	f9 eb       	ldi	r31, 0xB9	; 185
     470:	ef 16       	cp	r14, r31
     472:	f1 e0       	ldi	r31, 0x01	; 1
     474:	ff 06       	cpc	r15, r31
     476:	b1 f7       	brne	.-20     	; 0x464 <__stack+0x5>
			header[i] = hal_io_recByteT0();
		}

#if CONF_WITH_TRNG==1
		hal_rnd_addEntropy();
     478:	0e 94 aa 00 	call	0x154	; 0x154 <hal_rnd_addEntropy>
#endif

		if ((header[0] & 0xFC) == CLA_PROP) {
     47c:	80 91 a4 01 	lds	r24, 0x01A4
     480:	8c 7f       	andi	r24, 0xFC	; 252
     482:	80 38       	cpi	r24, 0x80	; 128
     484:	b1 f4       	brne	.+44     	; 0x4b2 <__stack+0x53>

			switch (header[1] & 0xFE) {
     486:	80 91 a5 01 	lds	r24, 0x01A5
     48a:	90 e0       	ldi	r25, 0x00	; 0
     48c:	8e 7f       	andi	r24, 0xFE	; 254
     48e:	90 70       	andi	r25, 0x00	; 0
     490:	80 3b       	cpi	r24, 0xB0	; 176
     492:	91 05       	cpc	r25, r1
     494:	31 f0       	breq	.+12     	; 0x4a2 <__stack+0x43>
     496:	81 3b       	cpi	r24, 0xB1	; 177
     498:	91 05       	cpc	r25, r1
     49a:	1c f0       	brlt	.+6      	; 0x4a2 <__stack+0x43>
     49c:	80 3c       	cpi	r24, 0xC0	; 192
     49e:	91 05       	cpc	r25, r1
     4a0:	69 f0       	breq	.+26     	; 0x4bc <__stack+0x5d>
				//cmd_updateBinary();
				t0_sendWord(SW_WRONG_INS);
				break;

			default:
				t0_sendWord(SW_WRONG_INS);
     4a2:	80 e0       	ldi	r24, 0x00	; 0
     4a4:	9d e6       	ldi	r25, 0x6D	; 109
     4a6:	0e 94 8a 02 	call	0x514	; 0x514 <t0_sendWord>
		} else {
			t0_sendWord(SW_WRONG_CLA);
		}

#if CONF_WITH_TRNG==1
		hal_rnd_addEntropy();
     4aa:	0e 94 aa 00 	call	0x154	; 0x154 <hal_rnd_addEntropy>
#endif

		/* Return the SW in sw */
		//t0_sendSw();
	}
     4ae:	d2 cf       	rjmp	.-92     	; 0x454 <main+0xa6>
     4b0:	ff cf       	rjmp	.-2      	; 0x4b0 <__stack+0x51>

			default:
				t0_sendWord(SW_WRONG_INS);
			}
		} else {
			t0_sendWord(SW_WRONG_CLA);
     4b2:	80 e0       	ldi	r24, 0x00	; 0
     4b4:	9e e6       	ldi	r25, 0x6E	; 110
     4b6:	0e 94 8a 02 	call	0x514	; 0x514 <t0_sendWord>
     4ba:	f7 cf       	rjmp	.-18     	; 0x4aa <__stack+0x4b>

			switch (header[1] & 0xFE) {

			case INS_GET_RESPONSE:

				hal_rnd_getBlock(&j );
     4bc:	c5 01       	movw	r24, r10
     4be:	0e 94 10 01 	call	0x220	; 0x220 <hal_rnd_getBlock>
     4c2:	f7 01       	movw	r30, r14
     4c4:	70 97       	sbiw	r30, 0x10	; 16
     4c6:	d6 01       	movw	r26, r12

				for (g = 0; g < 16; g++) {
					data[g] = header[5+g];//;
     4c8:	81 91       	ld	r24, Z+
     4ca:	8d 93       	st	X+, r24

			case INS_GET_RESPONSE:

				hal_rnd_getBlock(&j );

				for (g = 0; g < 16; g++) {
     4cc:	0e 17       	cp	r16, r30
     4ce:	1f 07       	cpc	r17, r31
     4d0:	d9 f7       	brne	.-10     	; 0x4c8 <__stack+0x69>
					data[g] = header[5+g];//;
				}

				aes_cenc( data, key,j,0 );
     4d2:	c6 01       	movw	r24, r12
     4d4:	b4 01       	movw	r22, r8
     4d6:	a5 01       	movw	r20, r10
     4d8:	20 e0       	ldi	r18, 0x00	; 0
     4da:	0e 94 54 05 	call	0xaa8	; 0xaa8 <aes_cenc>
				break;
     4de:	e5 cf       	rjmp	.-54     	; 0x4aa <__stack+0x4b>
     4e0:	ff cf       	rjmp	.-2      	; 0x4e0 <__stack+0x81>

000004e2 <sw_set>:
#else /* CONF_WITH_RETCODEMGR!=1 */
uint16_t sw;

void sw_set( uint16_t value )
{
	sw = value;
     4e2:	90 93 a3 01 	sts	0x01A3, r25
     4e6:	80 93 a2 01 	sts	0x01A2, r24
}
     4ea:	08 95       	ret

000004ec <t0_sendAck>:
uint8_t header[5+16];

/* Saves 4 bytes per ACK and costs itself 8 bytes. */
void t0_sendAck( void )
{
	hal_io_sendByteT0( header[1] );
     4ec:	80 91 a5 01 	lds	r24, 0x01A5
     4f0:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
}
     4f4:	08 95       	ret

000004f6 <t0_sendCAck>:

/* Saves 4 bytes per ~ACK and costs itself 10 bytes. */
void t0_sendCAck( void )
{
	hal_io_sendByteT0( ~header[1] );
     4f6:	80 91 a5 01 	lds	r24, 0x01A5
     4fa:	80 95       	com	r24
     4fc:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
}
     500:	08 95       	ret

00000502 <t0_sendSw>:
	sw2 = sw_get();

	hal_io_sendByteT0( (sw2>>8)&0xFF );
	hal_io_sendByteT0( sw2&0xFF );
#else
	hal_io_sendByteT0( (sw>>8)&0xFF );
     502:	80 91 a3 01 	lds	r24, 0x01A3
     506:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
	hal_io_sendByteT0( sw&0xFF );
     50a:	80 91 a2 01 	lds	r24, 0x01A2
     50e:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
#endif

	return;
}
     512:	08 95       	ret

00000514 <t0_sendWord>:

void t0_sendWord( uint16_t w )
{
     514:	1f 93       	push	r17
     516:	18 2f       	mov	r17, r24
	hal_io_sendByteT0( (w>>8)&0xFF );
     518:	89 2f       	mov	r24, r25
     51a:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
	hal_io_sendByteT0( w&0xFF );
     51e:	81 2f       	mov	r24, r17
     520:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>

	return;
}
     524:	1f 91       	pop	r17
     526:	08 95       	ret

00000528 <t0_recBlock>:

void t0_recBlock( uint8_t *dst, uint8_t len )
{
     528:	ef 92       	push	r14
     52a:	ff 92       	push	r15
     52c:	0f 93       	push	r16
     52e:	1f 93       	push	r17
     530:	cf 93       	push	r28
     532:	df 93       	push	r29
     534:	18 2f       	mov	r17, r24
     536:	06 2f       	mov	r16, r22
	uint8_t i, b;

	/* Receive */
	for( i=0; i<len; i++ ) {
     538:	66 23       	and	r22, r22
     53a:	61 f0       	breq	.+24     	; 0x554 <t0_recBlock+0x2c>
     53c:	e1 2e       	mov	r14, r17
     53e:	e7 01       	movw	r28, r14
     540:	7e 01       	movw	r14, r28
     542:	f9 2e       	mov	r15, r25
     544:	e7 01       	movw	r28, r14
		/* Data */
		b = hal_io_recByteT0();
     546:	0e 94 a7 00 	call	0x14e	; 0x14e <hal_io_recByteT0>

		*dst++ = b;
     54a:	89 93       	st	Y+, r24
void t0_recBlock( uint8_t *dst, uint8_t len )
{
	uint8_t i, b;

	/* Receive */
	for( i=0; i<len; i++ ) {
     54c:	ae 01       	movw	r20, r28
     54e:	41 1b       	sub	r20, r17
     550:	40 17       	cp	r20, r16
     552:	c8 f3       	brcs	.-14     	; 0x546 <t0_recBlock+0x1e>
		/* Data */
		b = hal_io_recByteT0();

		*dst++ = b;
	}
}
     554:	cd b7       	in	r28, 0x3d	; 61
     556:	de b7       	in	r29, 0x3e	; 62
     558:	e6 e0       	ldi	r30, 0x06	; 6
     55a:	0c 94 28 18 	jmp	0x3050	; 0x3050 <__epilogue_restores__+0x18>

0000055e <t0_testP1P2>:

bool t0_testP1P2( uint16_t p1p2 )
{
	if( (((uint16_t)header[2]<<8)|header[3])==p1p2 )
     55e:	50 91 a6 01 	lds	r21, 0x01A6
     562:	40 e0       	ldi	r20, 0x00	; 0
     564:	20 91 a7 01 	lds	r18, 0x01A7
     568:	30 e0       	ldi	r19, 0x00	; 0
     56a:	24 2b       	or	r18, r20
     56c:	35 2b       	or	r19, r21
     56e:	28 17       	cp	r18, r24
     570:	39 07       	cpc	r19, r25
     572:	31 f0       	breq	.+12     	; 0x580 <t0_testP1P2+0x22>
		return TRUE;

	sw_set( SW_WRONG_P1P2 );
     574:	86 e8       	ldi	r24, 0x86	; 134
     576:	9a e6       	ldi	r25, 0x6A	; 106
     578:	0e 94 71 02 	call	0x4e2	; 0x4e2 <sw_set>
	return FALSE;
     57c:	80 e0       	ldi	r24, 0x00	; 0
     57e:	08 95       	ret
}

bool t0_testP1P2( uint16_t p1p2 )
{
	if( (((uint16_t)header[2]<<8)|header[3])==p1p2 )
		return TRUE;
     580:	81 e0       	ldi	r24, 0x01	; 1

	sw_set( SW_WRONG_P1P2 );
	return FALSE;
}
     582:	08 95       	ret

00000584 <t0_testP3>:

bool t0_testP3( uint8_t p3 )
{
	if( header[4]==p3 )
     584:	90 91 a8 01 	lds	r25, 0x01A8
     588:	98 17       	cp	r25, r24
     58a:	31 f0       	breq	.+12     	; 0x598 <t0_testP3+0x14>
		return TRUE;

	sw_set( SW_WRONG_LEN );
     58c:	80 e0       	ldi	r24, 0x00	; 0
     58e:	97 e6       	ldi	r25, 0x67	; 103
     590:	0e 94 71 02 	call	0x4e2	; 0x4e2 <sw_set>
	return FALSE;
     594:	80 e0       	ldi	r24, 0x00	; 0
     596:	08 95       	ret
}

bool t0_testP3( uint8_t p3 )
{
	if( header[4]==p3 )
		return TRUE;
     598:	81 e0       	ldi	r24, 0x01	; 1

	sw_set( SW_WRONG_LEN );
	return FALSE;
}
     59a:	08 95       	ret

0000059c <aes_shiftcol>:
#include "aes_enc.h"
#include <avr/pgmspace.h>
#include "hal.h"
#include "t0.h"

void aes_shiftcol(void* data, uint8_t shift){
     59c:	a4 e0       	ldi	r26, 0x04	; 4
     59e:	b0 e0       	ldi	r27, 0x00	; 0
     5a0:	e4 ed       	ldi	r30, 0xD4	; 212
     5a2:	f2 e0       	ldi	r31, 0x02	; 2
     5a4:	0c 94 10 18 	jmp	0x3020	; 0x3020 <__prologue_saves__+0x20>
	//entier_de_test++;
	uint8_t tmp[4];
	tmp[0] = ((uint8_t*)data)[ 0];
     5a8:	fc 01       	movw	r30, r24
     5aa:	80 81       	ld	r24, Z
     5ac:	89 83       	std	Y+1, r24	; 0x01
	tmp[1] = ((uint8_t*)data)[ 4];
     5ae:	84 81       	ldd	r24, Z+4	; 0x04
     5b0:	8a 83       	std	Y+2, r24	; 0x02
	tmp[2] = ((uint8_t*)data)[ 8];
     5b2:	80 85       	ldd	r24, Z+8	; 0x08
     5b4:	8b 83       	std	Y+3, r24	; 0x03
	tmp[3] = ((uint8_t*)data)[12];
     5b6:	84 85       	ldd	r24, Z+12	; 0x0c
     5b8:	8c 83       	std	Y+4, r24	; 0x04
	((uint8_t*)data)[ 0] = tmp[(shift+0)&3];
     5ba:	70 e0       	ldi	r23, 0x00	; 0
     5bc:	cb 01       	movw	r24, r22
     5be:	83 70       	andi	r24, 0x03	; 3
     5c0:	90 70       	andi	r25, 0x00	; 0
     5c2:	9e 01       	movw	r18, r28
     5c4:	2f 5f       	subi	r18, 0xFF	; 255
     5c6:	3f 4f       	sbci	r19, 0xFF	; 255
     5c8:	82 0f       	add	r24, r18
     5ca:	93 1f       	adc	r25, r19
     5cc:	dc 01       	movw	r26, r24
     5ce:	8c 91       	ld	r24, X
     5d0:	80 83       	st	Z, r24
	((uint8_t*)data)[ 4] = tmp[(shift+1)&3];
     5d2:	cb 01       	movw	r24, r22
     5d4:	01 96       	adiw	r24, 0x01	; 1
     5d6:	83 70       	andi	r24, 0x03	; 3
     5d8:	90 70       	andi	r25, 0x00	; 0
     5da:	82 0f       	add	r24, r18
     5dc:	93 1f       	adc	r25, r19
     5de:	dc 01       	movw	r26, r24
     5e0:	8c 91       	ld	r24, X
     5e2:	84 83       	std	Z+4, r24	; 0x04
	((uint8_t*)data)[ 8] = tmp[(shift+2)&3];
     5e4:	cb 01       	movw	r24, r22
     5e6:	02 96       	adiw	r24, 0x02	; 2
     5e8:	83 70       	andi	r24, 0x03	; 3
     5ea:	90 70       	andi	r25, 0x00	; 0
     5ec:	82 0f       	add	r24, r18
     5ee:	93 1f       	adc	r25, r19
     5f0:	dc 01       	movw	r26, r24
     5f2:	8c 91       	ld	r24, X
     5f4:	80 87       	std	Z+8, r24	; 0x08
	((uint8_t*)data)[12] = tmp[(shift+3)&3];
     5f6:	db 01       	movw	r26, r22
     5f8:	13 96       	adiw	r26, 0x03	; 3
     5fa:	a3 70       	andi	r26, 0x03	; 3
     5fc:	b0 70       	andi	r27, 0x00	; 0
     5fe:	a2 0f       	add	r26, r18
     600:	b3 1f       	adc	r27, r19
     602:	8c 91       	ld	r24, X
     604:	84 87       	std	Z+12, r24	; 0x0c
}
     606:	24 96       	adiw	r28, 0x04	; 4
     608:	e2 e0       	ldi	r30, 0x02	; 2
     60a:	0c 94 2c 18 	jmp	0x3058	; 0x3058 <__epilogue_restores__+0x20>

0000060e <aes_encrypt_core>:
}


/*This is the generic core of AES RSM */

void aes_encrypt_core(uint8_t* j, aes_cipher_state_t* state, const aes_genctx_t* ks, uint8_t rounds,uint8_t rng) {
     60e:	ab e2       	ldi	r26, 0x2B	; 43
     610:	b0 e0       	ldi	r27, 0x00	; 0
     612:	ed e0       	ldi	r30, 0x0D	; 13
     614:	f3 e0       	ldi	r31, 0x03	; 3
     616:	0c 94 00 18 	jmp	0x3000	; 0x3000 <__prologue_saves__>
     61a:	4c 01       	movw	r8, r24
     61c:	5b 01       	movw	r10, r22
     61e:	5d a3       	std	Y+37, r21	; 0x25
     620:	4c a3       	std	Y+36, r20	; 0x24
     622:	2f a3       	std	Y+39, r18	; 0x27
     624:	0e a3       	std	Y+38, r16	; 0x26
    uint8_t i;

    if(!rng)
     626:	00 23       	and	r16, r16
     628:	09 f4       	brne	.+2      	; 0x62c <aes_encrypt_core+0x1e>
     62a:	7b c1       	rjmp	.+758    	; 0x922 <aes_encrypt_core+0x314>
       	hal_trig1();
     62c:	2c a1       	ldd	r18, Y+36	; 0x24
     62e:	3d a1       	ldd	r19, Y+37	; 0x25
     630:	b9 a6       	std	Y+41, r11	; 0x29
     632:	a8 a6       	std	Y+40, r10	; 0x28
}


/*This is the generic core of AES RSM */

void aes_encrypt_core(uint8_t* j, aes_cipher_state_t* state, const aes_genctx_t* ks, uint8_t rounds,uint8_t rng) {
     634:	d5 01       	movw	r26, r10
     636:	80 e0       	ldi	r24, 0x00	; 0
     638:	90 e0       	ldi	r25, 0x00	; 0
    if(!rng)
       	hal_trig1();
    //The plaintext is first xored with the mask j of the array of masks, j being the random offset
    // The we xor it the key ( First Add round key)
    for (i = 0; i < 16; ++i) {;
        state->s[i] ^= pgm_read_byte(m+((j[0] + i) % 16));
     63a:	f4 01       	movw	r30, r8
     63c:	40 81       	ld	r20, Z
     63e:	fc 01       	movw	r30, r24
     640:	e4 0f       	add	r30, r20
     642:	f1 1d       	adc	r31, r1
     644:	ef 70       	andi	r30, 0x0F	; 15
     646:	f0 70       	andi	r31, 0x00	; 0
     648:	e0 50       	subi	r30, 0x00	; 0
     64a:	fe 4d       	sbci	r31, 0xDE	; 222
     64c:	54 91       	lpm	r21, Z+
     64e:	4c 91       	ld	r20, X
     650:	54 27       	eor	r21, r20
     652:	5c 93       	st	X, r21
        state->s[i] ^= ks->key[0].ks[i]; //
     654:	f9 01       	movw	r30, r18
     656:	41 91       	ld	r20, Z+
     658:	9f 01       	movw	r18, r30
     65a:	45 27       	eor	r20, r21
     65c:	4d 93       	st	X+, r20
     65e:	01 96       	adiw	r24, 0x01	; 1

    if(!rng)
       	hal_trig1();
    //The plaintext is first xored with the mask j of the array of masks, j being the random offset
    // The we xor it the key ( First Add round key)
    for (i = 0; i < 16; ++i) {;
     660:	80 31       	cpi	r24, 0x10	; 16
     662:	91 05       	cpc	r25, r1
     664:	51 f7       	brne	.-44     	; 0x63a <aes_encrypt_core+0x2c>
    }

    i = 1;

    // First 13 rounds of AES 256
    for (; rounds > 1; --rounds) { 						// For the first round, state is masked with m[j[0]]
     666:	ff a1       	ldd	r31, Y+39	; 0x27
     668:	f2 30       	cpi	r31, 0x02	; 2
     66a:	08 f4       	brcc	.+2      	; 0x66e <aes_encrypt_core+0x60>
     66c:	5d c1       	rjmp	.+698    	; 0x928 <aes_encrypt_core+0x31a>
     66e:	f4 01       	movw	r30, r8
     670:	20 81       	ld	r18, Z
     672:	4f a0       	ldd	r4, Y+39	; 0x27
     674:	f1 e0       	ldi	r31, 0x01	; 1
     676:	fb a3       	std	Y+35, r31	; 0x23
     678:	ae 01       	movw	r20, r28
     67a:	4f 5e       	subi	r20, 0xEF	; 239
     67c:	5f 4f       	sbci	r21, 0xFF	; 255
     67e:	5b a7       	std	Y+43, r21	; 0x2b
     680:	4a a7       	std	Y+42, r20	; 0x2a
     682:	11 e2       	ldi	r17, 0x21	; 33
     684:	21 2e       	mov	r2, r17
     686:	31 2c       	mov	r3, r1
     688:	2c 0e       	add	r2, r28
     68a:	3d 1e       	adc	r3, r29
     68c:	3e 01       	movw	r6, r28
     68e:	08 94       	sec
     690:	61 1c       	adc	r6, r1
     692:	71 1c       	adc	r7, r1
     694:	c4 01       	movw	r24, r8
     696:	94 2c       	mov	r9, r4
     698:	2c 01       	movw	r4, r24


    	aes_enc_round(j, state, &(ks->key[i]), rng); 	// The masked Sbox is chosen depending on the offset j
     69a:	9b a1       	ldd	r25, Y+35	; 0x23
     69c:	89 2f       	mov	r24, r25
     69e:	90 e0       	ldi	r25, 0x00	; 0
     6a0:	82 95       	swap	r24
     6a2:	92 95       	swap	r25
     6a4:	90 7f       	andi	r25, 0xF0	; 240
     6a6:	98 27       	eor	r25, r24
     6a8:	80 7f       	andi	r24, 0xF0	; 240
     6aa:	98 27       	eor	r25, r24
     6ac:	ac a1       	ldd	r26, Y+36	; 0x24
     6ae:	bd a1       	ldd	r27, Y+37	; 0x25
     6b0:	a8 0f       	add	r26, r24
     6b2:	b9 1f       	adc	r27, r25
     6b4:	ba a3       	std	Y+34, r27	; 0x22
     6b6:	a9 a3       	std	Y+33, r26	; 0x21
void aes_enc_round(uint8_t* j,aes_cipher_state_t* state, const aes_roundkey_t* k,uint8_t rng){
	uint8_t tmp[16], t, i;
    int idx;

    // Order  of the execution of the Sboxes
    uint8_t dummy_idx[]={0,2,4,6,8,10,12,14,1,3,5,7,9,11,13,15};
     6b8:	de 01       	movw	r26, r28
     6ba:	51 96       	adiw	r26, 0x11	; 17
     6bc:	e5 e8       	ldi	r30, 0x85	; 133
     6be:	f0 e0       	ldi	r31, 0x00	; 0
     6c0:	80 e1       	ldi	r24, 0x10	; 16
     6c2:	01 90       	ld	r0, Z+
     6c4:	0d 92       	st	X+, r0
     6c6:	81 50       	subi	r24, 0x01	; 1
     6c8:	e1 f7       	brne	.-8      	; 0x6c2 <aes_encrypt_core+0xb4>
     6ca:	30 e0       	ldi	r19, 0x00	; 0
     6cc:	de 01       	movw	r26, r28
     6ce:	51 96       	adiw	r26, 0x11	; 17
     6d0:	bd 01       	movw	r22, r26
     6d2:	a9 01       	movw	r20, r18

	// subBytes
	for(i=0; i<16; ++i){
		idx = (((j[0] + dummy_idx[i]) % 16)*256); 			// Selection of the Sbox to be read depending
     6d4:	fb 01       	movw	r30, r22
     6d6:	81 91       	ld	r24, Z+
     6d8:	bf 01       	movw	r22, r30
     6da:	90 e0       	ldi	r25, 0x00	; 0
     6dc:	fa 01       	movw	r30, r20
     6de:	e8 0f       	add	r30, r24
     6e0:	f9 1f       	adc	r31, r25
     6e2:	ef 70       	andi	r30, 0x0F	; 15
     6e4:	f0 70       	andi	r31, 0x00	; 0
     6e6:	fe 2f       	mov	r31, r30
     6e8:	ee 27       	eor	r30, r30
															// on the byte index of state, and the value of the offset
		tmp[dummy_idx[i]] = pgm_read_byte(aes_sbox0+(idx + (state->s[dummy_idx[i]])));
     6ea:	95 01       	movw	r18, r10
     6ec:	28 0f       	add	r18, r24
     6ee:	39 1f       	adc	r19, r25
     6f0:	d9 01       	movw	r26, r18
     6f2:	2c 91       	ld	r18, X
     6f4:	e2 0f       	add	r30, r18
     6f6:	f1 1d       	adc	r31, r1
     6f8:	e0 50       	subi	r30, 0x00	; 0
     6fa:	f0 4f       	sbci	r31, 0xF0	; 240
     6fc:	e4 91       	lpm	r30, Z+
     6fe:	86 0d       	add	r24, r6
     700:	97 1d       	adc	r25, r7
     702:	dc 01       	movw	r26, r24
     704:	ec 93       	st	X, r30

    // Order  of the execution of the Sboxes
    uint8_t dummy_idx[]={0,2,4,6,8,10,12,14,1,3,5,7,9,11,13,15};

	// subBytes
	for(i=0; i<16; ++i){
     706:	62 15       	cp	r22, r2
     708:	73 05       	cpc	r23, r3
     70a:	21 f7       	brne	.-56     	; 0x6d4 <aes_encrypt_core+0xc6>


	}
	// after subByte, state is masked with m[j+1] ... m[j+1+16  mod 16]
	// shiftRows /
	aes_shiftcol(tmp+1, 1);
     70c:	ce 01       	movw	r24, r28
     70e:	02 96       	adiw	r24, 0x02	; 2
     710:	61 e0       	ldi	r22, 0x01	; 1
     712:	0e 94 ce 02 	call	0x59c	; 0x59c <aes_shiftcol>
	aes_shiftcol(tmp+2, 2);
     716:	ce 01       	movw	r24, r28
     718:	03 96       	adiw	r24, 0x03	; 3
     71a:	62 e0       	ldi	r22, 0x02	; 2
     71c:	0e 94 ce 02 	call	0x59c	; 0x59c <aes_shiftcol>
	aes_shiftcol(tmp+3, 3);
     720:	ce 01       	movw	r24, r28
     722:	04 96       	adiw	r24, 0x04	; 4
     724:	63 e0       	ldi	r22, 0x03	; 3
     726:	0e 94 ce 02 	call	0x59c	; 0x59c <aes_shiftcol>
}


/*This is the generic core of AES RSM */

void aes_encrypt_core(uint8_t* j, aes_cipher_state_t* state, const aes_genctx_t* ks, uint8_t rounds,uint8_t rng) {
     72a:	75 01       	movw	r14, r10
     72c:	83 01       	movw	r16, r6
     72e:	d9 2c       	mov	r13, r9
     730:	43 01       	movw	r8, r6
	aes_shiftcol(tmp+1, 1);
	aes_shiftcol(tmp+2, 2);
	aes_shiftcol(tmp+3, 3);
	// mixColums /j
	for(i=0; i<4; ++i){
		t = tmp[4*i+0] ^ tmp[4*i+1] ^ tmp[4*i+2] ^ tmp[4*i+3];
     732:	f8 01       	movw	r30, r16
     734:	61 81       	ldd	r22, Z+1	; 0x01
     736:	80 81       	ld	r24, Z
     738:	68 27       	eor	r22, r24
     73a:	c3 80       	ldd	r12, Z+3	; 0x03
     73c:	82 81       	ldd	r24, Z+2	; 0x02
     73e:	c8 26       	eor	r12, r24
     740:	c6 26       	eor	r12, r22
		state->s[4*i+0] =
			  GF256MUL_2(tmp[4*i+0]^tmp[4*i+1])
     742:	82 e0       	ldi	r24, 0x02	; 2
     744:	4b e1       	ldi	r20, 0x1B	; 27
     746:	0e 94 8e 06 	call	0xd1c	; 0xd1c <gf256mul>
	aes_shiftcol(tmp+2, 2);
	aes_shiftcol(tmp+3, 3);
	// mixColums /j
	for(i=0; i<4; ++i){
		t = tmp[4*i+0] ^ tmp[4*i+1] ^ tmp[4*i+2] ^ tmp[4*i+3];
		state->s[4*i+0] =
     74a:	d8 01       	movw	r26, r16
     74c:	9c 91       	ld	r25, X
     74e:	9c 25       	eor	r25, r12
     750:	98 27       	eor	r25, r24
     752:	f7 01       	movw	r30, r14
     754:	90 83       	st	Z, r25
			  GF256MUL_2(tmp[4*i+0]^tmp[4*i+1])
			^ tmp[4*i+0]
			^ t;
		state->s[4*i+1] =
			  GF256MUL_2(tmp[4*i+1]^tmp[4*i+2])
     756:	12 96       	adiw	r26, 0x02	; 2
     758:	6c 91       	ld	r22, X
     75a:	12 97       	sbiw	r26, 0x02	; 2
     75c:	11 96       	adiw	r26, 0x01	; 1
     75e:	8c 91       	ld	r24, X
     760:	68 27       	eor	r22, r24
     762:	82 e0       	ldi	r24, 0x02	; 2
     764:	4b e1       	ldi	r20, 0x1B	; 27
     766:	0e 94 8e 06 	call	0xd1c	; 0xd1c <gf256mul>
		t = tmp[4*i+0] ^ tmp[4*i+1] ^ tmp[4*i+2] ^ tmp[4*i+3];
		state->s[4*i+0] =
			  GF256MUL_2(tmp[4*i+0]^tmp[4*i+1])
			^ tmp[4*i+0]
			^ t;
		state->s[4*i+1] =
     76a:	d8 01       	movw	r26, r16
     76c:	11 96       	adiw	r26, 0x01	; 1
     76e:	9c 91       	ld	r25, X
     770:	11 97       	sbiw	r26, 0x01	; 1
     772:	9c 25       	eor	r25, r12
     774:	98 27       	eor	r25, r24
     776:	f7 01       	movw	r30, r14
     778:	91 83       	std	Z+1, r25	; 0x01
			  GF256MUL_2(tmp[4*i+1]^tmp[4*i+2])
			^ tmp[4*i+1]
			^ t;
		state->s[4*i+2] =
			  GF256MUL_2(tmp[4*i+2]^tmp[4*i+3])
     77a:	13 96       	adiw	r26, 0x03	; 3
     77c:	6c 91       	ld	r22, X
     77e:	13 97       	sbiw	r26, 0x03	; 3
     780:	12 96       	adiw	r26, 0x02	; 2
     782:	8c 91       	ld	r24, X
     784:	68 27       	eor	r22, r24
     786:	82 e0       	ldi	r24, 0x02	; 2
     788:	4b e1       	ldi	r20, 0x1B	; 27
     78a:	0e 94 8e 06 	call	0xd1c	; 0xd1c <gf256mul>
			^ t;
		state->s[4*i+1] =
			  GF256MUL_2(tmp[4*i+1]^tmp[4*i+2])
			^ tmp[4*i+1]
			^ t;
		state->s[4*i+2] =
     78e:	d8 01       	movw	r26, r16
     790:	12 96       	adiw	r26, 0x02	; 2
     792:	9c 91       	ld	r25, X
     794:	12 97       	sbiw	r26, 0x02	; 2
     796:	9c 25       	eor	r25, r12
     798:	98 27       	eor	r25, r24
     79a:	f7 01       	movw	r30, r14
     79c:	92 83       	std	Z+2, r25	; 0x02
			  GF256MUL_2(tmp[4*i+2]^tmp[4*i+3])
			^ tmp[4*i+2]
			^ t;
		state->s[4*i+3] =
			  GF256MUL_2(tmp[4*i+3]^tmp[4*i+0])
     79e:	6c 91       	ld	r22, X
     7a0:	13 96       	adiw	r26, 0x03	; 3
     7a2:	8c 91       	ld	r24, X
     7a4:	68 27       	eor	r22, r24
     7a6:	82 e0       	ldi	r24, 0x02	; 2
     7a8:	4b e1       	ldi	r20, 0x1B	; 27
     7aa:	0e 94 8e 06 	call	0xd1c	; 0xd1c <gf256mul>
			^ t;
		state->s[4*i+2] =
			  GF256MUL_2(tmp[4*i+2]^tmp[4*i+3])
			^ tmp[4*i+2]
			^ t;
		state->s[4*i+3] =
     7ae:	d8 01       	movw	r26, r16
     7b0:	13 96       	adiw	r26, 0x03	; 3
     7b2:	9c 91       	ld	r25, X
     7b4:	13 97       	sbiw	r26, 0x03	; 3
     7b6:	9c 25       	eor	r25, r12
     7b8:	98 27       	eor	r25, r24
     7ba:	f7 01       	movw	r30, r14
     7bc:	93 83       	std	Z+3, r25	; 0x03
     7be:	0c 5f       	subi	r16, 0xFC	; 252
     7c0:	1f 4f       	sbci	r17, 0xFF	; 255
     7c2:	44 e0       	ldi	r20, 0x04	; 4
     7c4:	50 e0       	ldi	r21, 0x00	; 0
     7c6:	e4 0e       	add	r14, r20
     7c8:	f5 1e       	adc	r15, r21
	// shiftRows /
	aes_shiftcol(tmp+1, 1);
	aes_shiftcol(tmp+2, 2);
	aes_shiftcol(tmp+3, 3);
	// mixColums /j
	for(i=0; i<4; ++i){
     7ca:	8a a5       	ldd	r24, Y+42	; 0x2a
     7cc:	9b a5       	ldd	r25, Y+43	; 0x2b
     7ce:	08 17       	cp	r16, r24
     7d0:	19 07       	cpc	r17, r25
     7d2:	09 f0       	breq	.+2      	; 0x7d6 <aes_encrypt_core+0x1c8>
     7d4:	ae cf       	rjmp	.-164    	; 0x732 <aes_encrypt_core+0x124>
     7d6:	c4 01       	movw	r24, r8
     7d8:	9d 2c       	mov	r9, r13
     7da:	6c 01       	movw	r12, r24
     7dc:	29 a1       	ldd	r18, Y+33	; 0x21
     7de:	3a a1       	ldd	r19, Y+34	; 0x22
     7e0:	d5 01       	movw	r26, r10
     7e2:	80 e0       	ldi	r24, 0x00	; 0
     7e4:	90 e0       	ldi	r25, 0x00	; 0
	//Here we apply POK, ie. we apply mask compensation by removing the composite mask end remasking with the mask that
	//we had at the output of the masked Sbox

	// addKey /
	for(i=0; i<16; ++i){
		tmp[i] = pgm_read_byte(pok+((((j[0]+1)%16)*16) + i));
     7e6:	f2 01       	movw	r30, r4
     7e8:	40 81       	ld	r20, Z
     7ea:	e4 2f       	mov	r30, r20
     7ec:	f0 e0       	ldi	r31, 0x00	; 0
     7ee:	31 96       	adiw	r30, 0x01	; 1
     7f0:	ef 70       	andi	r30, 0x0F	; 15
     7f2:	f0 70       	andi	r31, 0x00	; 0
     7f4:	e2 95       	swap	r30
     7f6:	f2 95       	swap	r31
     7f8:	f0 7f       	andi	r31, 0xF0	; 240
     7fa:	fe 27       	eor	r31, r30
     7fc:	e0 7f       	andi	r30, 0xF0	; 240
     7fe:	fe 27       	eor	r31, r30
     800:	e8 0f       	add	r30, r24
     802:	f9 1f       	adc	r31, r25
     804:	e0 50       	subi	r30, 0x00	; 0
     806:	f0 4e       	sbci	r31, 0xE0	; 224
     808:	64 91       	lpm	r22, Z+
     80a:	f6 01       	movw	r30, r12
     80c:	61 93       	st	Z+, r22
     80e:	6f 01       	movw	r12, r30
		state->s[i] ^= ((k->ks[i])^tmp[i]) ;
     810:	f9 01       	movw	r30, r18
     812:	41 91       	ld	r20, Z+
     814:	9f 01       	movw	r18, r30
     816:	5c 91       	ld	r21, X
     818:	45 27       	eor	r20, r21
     81a:	46 27       	eor	r20, r22
     81c:	4d 93       	st	X+, r20
     81e:	01 96       	adiw	r24, 0x01	; 1

	//Here we apply POK, ie. we apply mask compensation by removing the composite mask end remasking with the mask that
	//we had at the output of the masked Sbox

	// addKey /
	for(i=0; i<16; ++i){
     820:	80 31       	cpi	r24, 0x10	; 16
     822:	91 05       	cpc	r25, r1
     824:	01 f7       	brne	.-64     	; 0x7e6 <aes_encrypt_core+0x1d8>
    for (; rounds > 1; --rounds) { 						// For the first round, state is masked with m[j[0]]


    	aes_enc_round(j, state, &(ks->key[i]), rng); 	// The masked Sbox is chosen depending on the offset j
        												// The final state of each round is masked with m[j+1]
        if(!rng)
     826:	fe a1       	ldd	r31, Y+38	; 0x26
     828:	ff 23       	and	r31, r31
     82a:	09 f4       	brne	.+2      	; 0x82e <aes_encrypt_core+0x220>
     82c:	77 c0       	rjmp	.+238    	; 0x91c <aes_encrypt_core+0x30e>
        	hal_trig0();
        ++i;
     82e:	4b a1       	ldd	r20, Y+35	; 0x23
     830:	4f 5f       	subi	r20, 0xFF	; 255
     832:	4b a3       	std	Y+35, r20	; 0x23
        j[0] = (j[0] + 1) % 16; // At the end of each round , the mask is shifted by 1 byte
     834:	d2 01       	movw	r26, r4
     836:	8c 91       	ld	r24, X
     838:	90 e0       	ldi	r25, 0x00	; 0
     83a:	01 96       	adiw	r24, 0x01	; 1
     83c:	8f 70       	andi	r24, 0x0F	; 15
     83e:	90 70       	andi	r25, 0x00	; 0
     840:	28 2f       	mov	r18, r24
     842:	8c 93       	st	X, r24
    }

    i = 1;

    // First 13 rounds of AES 256
    for (; rounds > 1; --rounds) { 						// For the first round, state is masked with m[j[0]]
     844:	9a 94       	dec	r9
     846:	b9 2d       	mov	r27, r9
     848:	b2 30       	cpi	r27, 0x02	; 2
     84a:	08 f0       	brcs	.+2      	; 0x84e <aes_encrypt_core+0x240>
     84c:	26 cf       	rjmp	.-436    	; 0x69a <aes_encrypt_core+0x8c>
     84e:	42 01       	movw	r8, r4

    	aes_enc_round(j, state, &(ks->key[i]), rng); 	// The masked Sbox is chosen depending on the offset j
        												// The final state of each round is masked with m[j+1]
        if(!rng)
        	hal_trig0();
        ++i;
     850:	0f a1       	ldd	r16, Y+39	; 0x27
        j[0] = (j[0] + 1) % 16; // At the end of each round , the mask is shifted by 1 byte
    }


    // Last round
    aes_enc_lastround(j, state, &(ks->key[i]));
     852:	10 e0       	ldi	r17, 0x00	; 0
     854:	02 95       	swap	r16
     856:	12 95       	swap	r17
     858:	10 7f       	andi	r17, 0xF0	; 240
     85a:	10 27       	eor	r17, r16
     85c:	00 7f       	andi	r16, 0xF0	; 240
     85e:	10 27       	eor	r17, r16
     860:	ec a1       	ldd	r30, Y+36	; 0x24
     862:	fd a1       	ldd	r31, Y+37	; 0x25
     864:	0e 0f       	add	r16, r30
     866:	1f 1f       	adc	r17, r31
     868:	d5 01       	movw	r26, r10
     86a:	80 e0       	ldi	r24, 0x00	; 0
     86c:	90 e0       	ldi	r25, 0x00	; 0
     86e:	02 c0       	rjmp	.+4      	; 0x874 <aes_encrypt_core+0x266>
	uint8_t i;
	uint8_t tmp;
        int idx;
	// subBytes /

	for(i=0; i<16; ++i){
     870:	f4 01       	movw	r30, r8
     872:	20 81       	ld	r18, Z
		//tmp= pgm_read_byte( aes_sbox + j[0] + state->s[i] );
                idx =  (((j[0]+i)%16)*256);
     874:	fc 01       	movw	r30, r24
     876:	e2 0f       	add	r30, r18
     878:	f1 1d       	adc	r31, r1
     87a:	ef 70       	andi	r30, 0x0F	; 15
     87c:	f0 70       	andi	r31, 0x00	; 0
     87e:	fe 2f       	mov	r31, r30
     880:	ee 27       	eor	r30, r30
                state->s[i] = pgm_read_byte(aes_sbox0+( idx + state->s[i] ));
     882:	2c 91       	ld	r18, X
     884:	e2 0f       	add	r30, r18
     886:	f1 1d       	adc	r31, r1
     888:	e0 50       	subi	r30, 0x00	; 0
     88a:	f0 4f       	sbci	r31, 0xF0	; 240
     88c:	e4 91       	lpm	r30, Z+
     88e:	ed 93       	st	X+, r30
     890:	01 96       	adiw	r24, 0x01	; 1
	uint8_t i;
	uint8_t tmp;
        int idx;
	// subBytes /

	for(i=0; i<16; ++i){
     892:	80 31       	cpi	r24, 0x10	; 16
     894:	91 05       	cpc	r25, r1
     896:	61 f7       	brne	.-40     	; 0x870 <aes_encrypt_core+0x262>
                state->s[i] = pgm_read_byte(aes_sbox0+( idx + state->s[i] ));
	}


	// shiftRows /
	aes_shiftcol(state->s+1, 1);
     898:	c5 01       	movw	r24, r10
     89a:	01 96       	adiw	r24, 0x01	; 1
     89c:	61 e0       	ldi	r22, 0x01	; 1
     89e:	0e 94 ce 02 	call	0x59c	; 0x59c <aes_shiftcol>
	aes_shiftcol(state->s+2, 2);
     8a2:	c5 01       	movw	r24, r10
     8a4:	02 96       	adiw	r24, 0x02	; 2
     8a6:	62 e0       	ldi	r22, 0x02	; 2
     8a8:	0e 94 ce 02 	call	0x59c	; 0x59c <aes_shiftcol>
	aes_shiftcol(state->s+3, 3);
     8ac:	c5 01       	movw	r24, r10
     8ae:	03 96       	adiw	r24, 0x03	; 3
     8b0:	63 e0       	ldi	r22, 0x03	; 3
     8b2:	0e 94 ce 02 	call	0x59c	; 0x59c <aes_shiftcol>
     8b6:	d5 01       	movw	r26, r10
     8b8:	80 e0       	ldi	r24, 0x00	; 0
     8ba:	90 e0       	ldi	r25, 0x00	; 0
	// keyAdd /

	for(i=0; i<16; ++i){
                tmp =  pgm_read_byte(pok+(256 + (((j[0]+1)%16)*16) + i));
     8bc:	f4 01       	movw	r30, r8
     8be:	20 81       	ld	r18, Z
     8c0:	e2 2f       	mov	r30, r18
     8c2:	f0 e0       	ldi	r31, 0x00	; 0
     8c4:	31 96       	adiw	r30, 0x01	; 1
     8c6:	ef 70       	andi	r30, 0x0F	; 15
     8c8:	f0 70       	andi	r31, 0x00	; 0
     8ca:	70 96       	adiw	r30, 0x10	; 16
     8cc:	e2 95       	swap	r30
     8ce:	f2 95       	swap	r31
     8d0:	f0 7f       	andi	r31, 0xF0	; 240
     8d2:	fe 27       	eor	r31, r30
     8d4:	e0 7f       	andi	r30, 0xF0	; 240
     8d6:	fe 27       	eor	r31, r30
     8d8:	e8 0f       	add	r30, r24
     8da:	f9 1f       	adc	r31, r25
     8dc:	e0 50       	subi	r30, 0x00	; 0
     8de:	f0 4e       	sbci	r31, 0xE0	; 224
     8e0:	e4 91       	lpm	r30, Z+
                state->s[i] ^= tmp ;
     8e2:	2c 91       	ld	r18, X
     8e4:	2e 27       	eor	r18, r30
     8e6:	2d 93       	st	X+, r18
     8e8:	01 96       	adiw	r24, 0x01	; 1
	aes_shiftcol(state->s+1, 1);
	aes_shiftcol(state->s+2, 2);
	aes_shiftcol(state->s+3, 3);
	// keyAdd /

	for(i=0; i<16; ++i){
     8ea:	80 31       	cpi	r24, 0x10	; 16
     8ec:	91 05       	cpc	r25, r1
     8ee:	31 f7       	brne	.-52     	; 0x8bc <aes_encrypt_core+0x2ae>
     8f0:	f8 01       	movw	r30, r16
     8f2:	90 e0       	ldi	r25, 0x00	; 0
     8f4:	a8 a5       	ldd	r26, Y+40	; 0x28
     8f6:	b9 a5       	ldd	r27, Y+41	; 0x29
                tmp =  pgm_read_byte(pok+(256 + (((j[0]+1)%16)*16) + i));
                state->s[i] ^= tmp ;
	}

        for(i=0; i<16; ++i){
        	state->s[i] ^= (k->ks[i]) ;
     8f8:	21 91       	ld	r18, Z+
     8fa:	8c 91       	ld	r24, X
     8fc:	82 27       	eor	r24, r18
     8fe:	8d 93       	st	X+, r24
	for(i=0; i<16; ++i){
                tmp =  pgm_read_byte(pok+(256 + (((j[0]+1)%16)*16) + i));
                state->s[i] ^= tmp ;
	}

        for(i=0; i<16; ++i){
     900:	9f 5f       	subi	r25, 0xFF	; 255
     902:	90 31       	cpi	r25, 0x10	; 16
     904:	c9 f7       	brne	.-14     	; 0x8f8 <aes_encrypt_core+0x2ea>

    // Last round
    aes_enc_lastround(j, state, &(ks->key[i]));


    j[0] = (j[0] + 1) % 16;
     906:	d4 01       	movw	r26, r8
     908:	8c 91       	ld	r24, X
     90a:	90 e0       	ldi	r25, 0x00	; 0
     90c:	01 96       	adiw	r24, 0x01	; 1
     90e:	8f 70       	andi	r24, 0x0F	; 15
     910:	90 70       	andi	r25, 0x00	; 0
     912:	8c 93       	st	X, r24


}
     914:	ab 96       	adiw	r28, 0x2b	; 43
     916:	e2 e1       	ldi	r30, 0x12	; 18
     918:	0c 94 1c 18 	jmp	0x3038	; 0x3038 <__epilogue_restores__>


    	aes_enc_round(j, state, &(ks->key[i]), rng); 	// The masked Sbox is chosen depending on the offset j
        												// The final state of each round is masked with m[j+1]
        if(!rng)
        	hal_trig0();
     91c:	0e 94 a4 00 	call	0x148	; 0x148 <hal_trig0>
     920:	86 cf       	rjmp	.-244    	; 0x82e <aes_encrypt_core+0x220>

void aes_encrypt_core(uint8_t* j, aes_cipher_state_t* state, const aes_genctx_t* ks, uint8_t rounds,uint8_t rng) {
    uint8_t i;

    if(!rng)
       	hal_trig1();
     922:	0e 94 a1 00 	call	0x142	; 0x142 <hal_trig1>
     926:	82 ce       	rjmp	.-764    	; 0x62c <aes_encrypt_core+0x1e>
    }

    i = 1;

    // First 13 rounds of AES 256
    for (; rounds > 1; --rounds) { 						// For the first round, state is masked with m[j[0]]
     928:	d4 01       	movw	r26, r8
     92a:	2c 91       	ld	r18, X
     92c:	01 e0       	ldi	r16, 0x01	; 1
     92e:	91 cf       	rjmp	.-222    	; 0x852 <aes_encrypt_core+0x244>

00000930 <aes_init>:

const uint8_t rc_tab[] PROGMEM = { 0x01, 0x02, 0x04, 0x08,
                                   0x10, 0x20, 0x40, 0x80,
                                   0x1b, 0x36 };

void aes_init(const void* key, uint16_t keysize_b, aes_genctx_t* ctx){
     930:	a0 e0       	ldi	r26, 0x00	; 0
     932:	b0 e0       	ldi	r27, 0x00	; 0
     934:	ee e9       	ldi	r30, 0x9E	; 158
     936:	f4 e0       	ldi	r31, 0x04	; 4
     938:	0c 94 04 18 	jmp	0x3008	; 0x3008 <__prologue_saves__+0x8>
     93c:	f8 2f       	mov	r31, r24
     93e:	e9 2f       	mov	r30, r25
     940:	9b 01       	movw	r18, r22
     942:	7a 01       	movw	r14, r20
	uint8_t rc=0;
	union {
		uint32_t v32;
		uint8_t  v8[4];
	} tmp;
	nk=keysize_b>>5; /* 4, 6, 8 */
     944:	eb 01       	movw	r28, r22
     946:	d6 95       	lsr	r29
     948:	c7 95       	ror	r28
     94a:	d2 95       	swap	r29
     94c:	c2 95       	swap	r28
     94e:	cf 70       	andi	r28, 0x0F	; 15
     950:	cd 27       	eor	r28, r29
     952:	df 70       	andi	r29, 0x0F	; 15
     954:	cd 27       	eor	r28, r29
     956:	bc 2e       	mov	r11, r28
	hi=4*(nk+6+1);
     958:	0c 2f       	mov	r16, r28
     95a:	10 e0       	ldi	r17, 0x00	; 0
     95c:	a8 01       	movw	r20, r16
     95e:	49 5f       	subi	r20, 0xF9	; 249
     960:	5f 4f       	sbci	r21, 0xFF	; 255
     962:	d4 2e       	mov	r13, r20
     964:	dd 0c       	add	r13, r13
     966:	dd 0c       	add	r13, r13
	memcpy(ctx, key, keysize_b/8);
     968:	36 95       	lsr	r19
     96a:	27 95       	ror	r18
     96c:	36 95       	lsr	r19
     96e:	27 95       	ror	r18
     970:	36 95       	lsr	r19
     972:	27 95       	ror	r18
     974:	c7 01       	movw	r24, r14
     976:	6f 2f       	mov	r22, r31
     978:	7e 2f       	mov	r23, r30
     97a:	a9 01       	movw	r20, r18
     97c:	0e 94 37 18 	call	0x306e	; 0x306e <memcpy>
	next_nk = nk;
	for(i=nk;i<hi;++i){
     980:	cd 15       	cp	r28, r13
     982:	08 f0       	brcs	.+2      	; 0x986 <aes_init+0x56>
     984:	7f c0       	rjmp	.+254    	; 0xa84 <aes_init+0x154>
     986:	7c 2f       	mov	r23, r28
     988:	77 0f       	add	r23, r23
     98a:	ac 2e       	mov	r10, r28
     98c:	6c 2f       	mov	r22, r28
                                   0x10, 0x20, 0x40, 0x80,
                                   0x1b, 0x36 };

void aes_init(const void* key, uint16_t keysize_b, aes_genctx_t* ctx){
	uint8_t hi,i,nk, next_nk;
	uint8_t rc=0;
     98e:	cc 24       	eor	r12, r12
     990:	25 c0       	rjmp	.+74     	; 0x9dc <aes_init+0xac>
	memcpy(ctx, key, keysize_b/8);
	next_nk = nk;
	for(i=nk;i<hi;++i){
		tmp.v32 = ((uint32_t*)(ctx->key[0].ks))[i-1];
		if(i!=next_nk){
			if(nk==8 && i%8==4){
     992:	fb 2d       	mov	r31, r11
     994:	f8 30       	cpi	r31, 0x08	; 8
     996:	09 f4       	brne	.+2      	; 0x99a <aes_init+0x6a>
     998:	58 c0       	rjmp	.+176    	; 0xa4a <aes_init+0x11a>
			tmp.v8[2] = aes_sbox2[tmp.v8[2]];
			tmp.v8[3] = aes_sbox2[tmp.v8[3]];
			tmp.v8[0] ^= pgm_read_byte(rc_tab+rc);
			rc++;
		}
		((uint32_t*)(ctx->key[0].ks))[i] = ((uint32_t*)(ctx->key[0].ks))[i-nk]
     99a:	fa 01       	movw	r30, r20
     99c:	ee 0f       	add	r30, r30
     99e:	ff 1f       	adc	r31, r31
     9a0:	ee 0f       	add	r30, r30
     9a2:	ff 1f       	adc	r31, r31
     9a4:	e2 0f       	add	r30, r18
     9a6:	f3 1f       	adc	r31, r19
     9a8:	40 1b       	sub	r20, r16
     9aa:	51 0b       	sbc	r21, r17
     9ac:	44 0f       	add	r20, r20
     9ae:	55 1f       	adc	r21, r21
     9b0:	44 0f       	add	r20, r20
     9b2:	55 1f       	adc	r21, r21
     9b4:	42 0f       	add	r20, r18
     9b6:	53 1f       	adc	r21, r19
		                                   ^ tmp.v32;
     9b8:	ea 01       	movw	r28, r20
     9ba:	28 81       	ld	r18, Y
     9bc:	39 81       	ldd	r19, Y+1	; 0x01
     9be:	4a 81       	ldd	r20, Y+2	; 0x02
     9c0:	5b 81       	ldd	r21, Y+3	; 0x03
     9c2:	28 27       	eor	r18, r24
     9c4:	39 27       	eor	r19, r25
     9c6:	4a 27       	eor	r20, r26
     9c8:	5b 27       	eor	r21, r27
			tmp.v8[2] = aes_sbox2[tmp.v8[2]];
			tmp.v8[3] = aes_sbox2[tmp.v8[3]];
			tmp.v8[0] ^= pgm_read_byte(rc_tab+rc);
			rc++;
		}
		((uint32_t*)(ctx->key[0].ks))[i] = ((uint32_t*)(ctx->key[0].ks))[i-nk]
     9ca:	20 83       	st	Z, r18
     9cc:	31 83       	std	Z+1, r19	; 0x01
     9ce:	42 83       	std	Z+2, r20	; 0x02
     9d0:	53 83       	std	Z+3, r21	; 0x03
	} tmp;
	nk=keysize_b>>5; /* 4, 6, 8 */
	hi=4*(nk+6+1);
	memcpy(ctx, key, keysize_b/8);
	next_nk = nk;
	for(i=nk;i<hi;++i){
     9d2:	6f 5f       	subi	r22, 0xFF	; 255
     9d4:	7f 5f       	subi	r23, 0xFF	; 255
     9d6:	6d 15       	cp	r22, r13
     9d8:	08 f0       	brcs	.+2      	; 0x9dc <aes_init+0xac>
     9da:	54 c0       	rjmp	.+168    	; 0xa84 <aes_init+0x154>
		tmp.v32 = ((uint32_t*)(ctx->key[0].ks))[i-1];
     9dc:	97 01       	movw	r18, r14
     9de:	46 2f       	mov	r20, r22
     9e0:	50 e0       	ldi	r21, 0x00	; 0
     9e2:	fa 01       	movw	r30, r20
     9e4:	31 97       	sbiw	r30, 0x01	; 1
     9e6:	ee 0f       	add	r30, r30
     9e8:	ff 1f       	adc	r31, r31
     9ea:	ee 0f       	add	r30, r30
     9ec:	ff 1f       	adc	r31, r31
     9ee:	ee 0d       	add	r30, r14
     9f0:	ff 1d       	adc	r31, r15
     9f2:	80 81       	ld	r24, Z
     9f4:	91 81       	ldd	r25, Z+1	; 0x01
     9f6:	a2 81       	ldd	r26, Z+2	; 0x02
     9f8:	b3 81       	ldd	r27, Z+3	; 0x03
     9fa:	88 2e       	mov	r8, r24
     9fc:	e9 2f       	mov	r30, r25
     9fe:	7a 2e       	mov	r7, r26
     a00:	9b 2e       	mov	r9, r27
		if(i!=next_nk){
     a02:	6a 15       	cp	r22, r10
     a04:	31 f6       	brne	.-116    	; 0x992 <aes_init+0x62>
				tmp.v8[3] = aes_sbox2[tmp.v8[3]];
			}
		} else {
			next_nk += nk;
			aes_rotword(&(tmp.v32));
			tmp.v8[0] = aes_sbox2[tmp.v8[0]];
     a06:	f0 e0       	ldi	r31, 0x00	; 0
     a08:	eb 56       	subi	r30, 0x6B	; 107
     a0a:	ff 4f       	sbci	r31, 0xFF	; 255
     a0c:	a0 80       	ld	r10, Z
			tmp.v8[1] = aes_sbox2[tmp.v8[1]];
     a0e:	8a 2f       	mov	r24, r26
     a10:	90 e0       	ldi	r25, 0x00	; 0
     a12:	8b 56       	subi	r24, 0x6B	; 107
     a14:	9f 4f       	sbci	r25, 0xFF	; 255
			tmp.v8[2] = aes_sbox2[tmp.v8[2]];
     a16:	cb 2f       	mov	r28, r27
     a18:	d0 e0       	ldi	r29, 0x00	; 0
     a1a:	cb 56       	subi	r28, 0x6B	; 107
     a1c:	df 4f       	sbci	r29, 0xFF	; 255
			tmp.v8[3] = aes_sbox2[tmp.v8[3]];
     a1e:	a8 2d       	mov	r26, r8
     a20:	b0 e0       	ldi	r27, 0x00	; 0
     a22:	ab 56       	subi	r26, 0x6B	; 107
     a24:	bf 4f       	sbci	r27, 0xFF	; 255
			tmp.v8[0] ^= pgm_read_byte(rc_tab+rc);
     a26:	ec 2d       	mov	r30, r12
     a28:	f0 e0       	ldi	r31, 0x00	; 0
     a2a:	e8 5b       	subi	r30, 0xB8	; 184
     a2c:	ff 4f       	sbci	r31, 0xFF	; 255
     a2e:	e4 91       	lpm	r30, Z+
			rc++;
     a30:	c3 94       	inc	r12
     a32:	7e 2e       	mov	r7, r30
     a34:	7a 24       	eor	r7, r10
     a36:	fc 01       	movw	r30, r24
     a38:	80 80       	ld	r8, Z
     a3a:	98 80       	ld	r9, Y
     a3c:	fc 91       	ld	r31, X
     a3e:	87 2d       	mov	r24, r7
     a40:	98 2d       	mov	r25, r8
     a42:	a9 2d       	mov	r26, r9
     a44:	bf 2f       	mov	r27, r31
				tmp.v8[1] = aes_sbox2[tmp.v8[1]];
				tmp.v8[2] = aes_sbox2[tmp.v8[2]];
				tmp.v8[3] = aes_sbox2[tmp.v8[3]];
			}
		} else {
			next_nk += nk;
     a46:	a7 2e       	mov	r10, r23
     a48:	a8 cf       	rjmp	.-176    	; 0x99a <aes_init+0x6a>
	memcpy(ctx, key, keysize_b/8);
	next_nk = nk;
	for(i=nk;i<hi;++i){
		tmp.v32 = ((uint32_t*)(ctx->key[0].ks))[i-1];
		if(i!=next_nk){
			if(nk==8 && i%8==4){
     a4a:	f6 2f       	mov	r31, r22
     a4c:	f7 70       	andi	r31, 0x07	; 7
     a4e:	f4 30       	cpi	r31, 0x04	; 4
     a50:	09 f0       	breq	.+2      	; 0xa54 <aes_init+0x124>
     a52:	a3 cf       	rjmp	.-186    	; 0x99a <aes_init+0x6a>
				tmp.v8[0] =aes_sbox2[tmp.v8[0]];
     a54:	a8 2f       	mov	r26, r24
     a56:	b0 e0       	ldi	r27, 0x00	; 0
     a58:	ab 56       	subi	r26, 0x6B	; 107
     a5a:	bf 4f       	sbci	r27, 0xFF	; 255
				tmp.v8[1] = aes_sbox2[tmp.v8[1]];
     a5c:	f0 e0       	ldi	r31, 0x00	; 0
     a5e:	eb 56       	subi	r30, 0x6B	; 107
     a60:	ff 4f       	sbci	r31, 0xFF	; 255
				tmp.v8[2] = aes_sbox2[tmp.v8[2]];
     a62:	87 2d       	mov	r24, r7
     a64:	90 e0       	ldi	r25, 0x00	; 0
     a66:	8b 56       	subi	r24, 0x6B	; 107
     a68:	9f 4f       	sbci	r25, 0xFF	; 255
				tmp.v8[3] = aes_sbox2[tmp.v8[3]];
     a6a:	c9 2d       	mov	r28, r9
     a6c:	d0 e0       	ldi	r29, 0x00	; 0
     a6e:	cb 56       	subi	r28, 0x6B	; 107
     a70:	df 4f       	sbci	r29, 0xFF	; 255
     a72:	8c 90       	ld	r8, X
     a74:	90 80       	ld	r9, Z
     a76:	fc 01       	movw	r30, r24
     a78:	70 80       	ld	r7, Z
     a7a:	68 80       	ld	r6, Y
     a7c:	c4 01       	movw	r24, r8
     a7e:	a7 2d       	mov	r26, r7
     a80:	b6 2d       	mov	r27, r6
     a82:	8b cf       	rjmp	.-234    	; 0x99a <aes_init+0x6a>
			rc++;
		}
		((uint32_t*)(ctx->key[0].ks))[i] = ((uint32_t*)(ctx->key[0].ks))[i-nk]
		                                   ^ tmp.v32;
	}
}
     a84:	cd b7       	in	r28, 0x3d	; 61
     a86:	de b7       	in	r29, 0x3e	; 62
     a88:	ee e0       	ldi	r30, 0x0E	; 14
     a8a:	0c 94 20 18 	jmp	0x3040	; 0x3040 <__epilogue_restores__+0x8>

00000a8e <aes256_init>:

void aes256_init(const void* key, aes256_ctx_t* ctx){
     a8e:	ab 01       	movw	r20, r22
	aes_init(key, 256, (aes_genctx_t*)ctx);
     a90:	60 e0       	ldi	r22, 0x00	; 0
     a92:	71 e0       	ldi	r23, 0x01	; 1
     a94:	0e 94 98 04 	call	0x930	; 0x930 <aes_init>
}
     a98:	08 95       	ret

00000a9a <aes256_enc>:
#include <sw.h>


/*  This is the AES RSM 256 encryption function that call the generic AES RSM encryption core*/

void aes256_enc(uint8_t* j, void* buffer, aes256_ctx_t* ctx,uint8_t rng){
     a9a:	0f 93       	push	r16
     a9c:	02 2f       	mov	r16, r18
	aes_encrypt_core(j,buffer, (aes_genctx_t*)ctx, 14,(uint8_t)rng);
     a9e:	2e e0       	ldi	r18, 0x0E	; 14
     aa0:	0e 94 07 03 	call	0x60e	; 0x60e <aes_encrypt_core>
}
     aa4:	0f 91       	pop	r16
     aa6:	08 95       	ret

00000aa8 <aes_cenc>:
 *			k 	: Pointer to first byte of the key
 *			j  	: Pointer to the output of the random offset
 *			rng : Flag that enables the Trigger signal during AES encryption when = 1
 *
 *  */
void aes_cenc(uint8_t *v, uint8_t *k,uint8_t *j, uint8_t rng) {
     aa8:	a0 ef       	ldi	r26, 0xF0	; 240
     aaa:	b0 e0       	ldi	r27, 0x00	; 0
     aac:	ea e5       	ldi	r30, 0x5A	; 90
     aae:	f5 e0       	ldi	r31, 0x05	; 5
     ab0:	0c 94 08 18 	jmp	0x3010	; 0x3010 <__prologue_saves__+0x10>
     ab4:	c8 2e       	mov	r12, r24
     ab6:	b9 2e       	mov	r11, r25
     ab8:	cb 01       	movw	r24, r22
     aba:	7a 01       	movw	r14, r20
     abc:	d2 2e       	mov	r13, r18
	aes256_ctx_t ctx;
	uint8_t i = 0;
	uint8_t tmp=j[0];
     abe:	fa 01       	movw	r30, r20
     ac0:	a0 80       	ld	r10, Z
	//Initialization

	aes256_init(k, &ctx);
     ac2:	8e 01       	movw	r16, r28
     ac4:	0f 5f       	subi	r16, 0xFF	; 255
     ac6:	1f 4f       	sbci	r17, 0xFF	; 255
     ac8:	b8 01       	movw	r22, r16
     aca:	0e 94 47 05 	call	0xa8e	; 0xa8e <aes256_init>

	//Encryption
	aes256_enc(j, v, &ctx,(uint8_t) rng);
     ace:	c7 01       	movw	r24, r14
     ad0:	6c 2d       	mov	r22, r12
     ad2:	7b 2d       	mov	r23, r11
     ad4:	a8 01       	movw	r20, r16
     ad6:	2d 2d       	mov	r18, r13
     ad8:	0e 94 4d 05 	call	0xa9a	; 0xa9a <aes256_enc>
	if(!rng){
     adc:	dd 20       	and	r13, r13
     ade:	31 f0       	breq	.+12     	; 0xaec <aes_cenc+0x44>

	sw_set(SW_OK);
	t0_sendAck();
	}

}
     ae0:	c0 51       	subi	r28, 0x10	; 16
     ae2:	df 4f       	sbci	r29, 0xFF	; 255
     ae4:	ea e0       	ldi	r30, 0x0A	; 10
     ae6:	0c 94 24 18 	jmp	0x3048	; 0x3048 <__epilogue_restores__+0x10>
     aea:	1d c0       	rjmp	.+58     	; 0xb26 <log_init>

	//Encryption
	aes256_enc(j, v, &ctx,(uint8_t) rng);
	if(!rng){
		/* ACK */
		t0_sendAck();
     aec:	0e 94 76 02 	call	0x4ec	; 0x4ec <t0_sendAck>
     af0:	0c 2d       	mov	r16, r12
     af2:	1b 2d       	mov	r17, r11
		for( i=0; i<16; i++ ) {
     af4:	ee 24       	eor	r14, r14
		/* Data */
		hal_io_sendByteT0( v[i] );
     af6:	f8 01       	movw	r30, r16
     af8:	81 91       	ld	r24, Z+
     afa:	8f 01       	movw	r16, r30
     afc:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>
	//Encryption
	aes256_enc(j, v, &ctx,(uint8_t) rng);
	if(!rng){
		/* ACK */
		t0_sendAck();
		for( i=0; i<16; i++ ) {
     b00:	e3 94       	inc	r14
     b02:	fe 2d       	mov	r31, r14
     b04:	f0 31       	cpi	r31, 0x10	; 16
     b06:	b9 f7       	brne	.-18     	; 0xaf6 <aes_cenc+0x4e>
		/* Data */
		hal_io_sendByteT0( v[i] );
		}

		hal_io_sendByteT0((tmp)%16);
     b08:	8a 2d       	mov	r24, r10
     b0a:	8f 70       	andi	r24, 0x0F	; 15
     b0c:	0e 94 9e 00 	call	0x13c	; 0x13c <hal_io_sendByteT0>

	sw_set(SW_OK);
     b10:	80 e0       	ldi	r24, 0x00	; 0
     b12:	90 e9       	ldi	r25, 0x90	; 144
     b14:	0e 94 71 02 	call	0x4e2	; 0x4e2 <sw_set>
	t0_sendAck();
     b18:	0e 94 76 02 	call	0x4ec	; 0x4ec <t0_sendAck>
	}

}
     b1c:	c0 51       	subi	r28, 0x10	; 16
     b1e:	df 4f       	sbci	r29, 0xFF	; 255
     b20:	ea e0       	ldi	r30, 0x0A	; 10
     b22:	0c 94 24 18 	jmp	0x3048	; 0x3048 <__epilogue_restores__+0x10>

00000b26 <log_init>:
uint16_t dst=LOG_START+2;
bool log_enable;

void log_init( void )
{
	dst=LOG_START+2;
     b26:	82 e0       	ldi	r24, 0x02	; 2
     b28:	98 e1       	ldi	r25, 0x18	; 24
     b2a:	90 93 96 01 	sts	0x0196, r25
     b2e:	80 93 95 01 	sts	0x0195, r24
	hal_eeprom_write( LOG_START, (uint8_t *) &dst, 2 );
     b32:	80 e0       	ldi	r24, 0x00	; 0
     b34:	98 e1       	ldi	r25, 0x18	; 24
     b36:	65 e9       	ldi	r22, 0x95	; 149
     b38:	71 e0       	ldi	r23, 0x01	; 1
     b3a:	42 e0       	ldi	r20, 0x02	; 2
     b3c:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
	log_enable=FALSE;
     b40:	10 92 b9 01 	sts	0x01B9, r1
}
     b44:	08 95       	ret

00000b46 <log_add>:

void log_add( uint8_t tag, uint8_t *data, uint8_t len )
{
     b46:	a2 e0       	ldi	r26, 0x02	; 2
     b48:	b0 e0       	ldi	r27, 0x00	; 0
     b4a:	e9 ea       	ldi	r30, 0xA9	; 169
     b4c:	f5 e0       	ldi	r31, 0x05	; 5
     b4e:	0c 94 0d 18 	jmp	0x301a	; 0x301a <__prologue_saves__+0x1a>
     b52:	89 83       	std	Y+1, r24	; 0x01
     b54:	8b 01       	movw	r16, r22
     b56:	4a 83       	std	Y+2, r20	; 0x02
	bool save=log_enable;
     b58:	f0 90 b9 01 	lds	r15, 0x01B9

	if( !log_enable || dst<LOG_START ) return;
     b5c:	ff 20       	and	r15, r15
     b5e:	41 f0       	breq	.+16     	; 0xb70 <log_add+0x2a>
     b60:	80 91 95 01 	lds	r24, 0x0195
     b64:	90 91 96 01 	lds	r25, 0x0196
     b68:	28 e1       	ldi	r18, 0x18	; 24
     b6a:	80 30       	cpi	r24, 0x00	; 0
     b6c:	92 07       	cpc	r25, r18
     b6e:	28 f4       	brcc	.+10     	; 0xb7a <log_add+0x34>
	hal_eeprom_write( dst++, &len, 1 );
	hal_eeprom_write( dst, data, len );
	dst+=len;
	hal_eeprom_write( LOG_START, (uint8_t *) &dst, 2 );
	log_enable=save;
}
     b70:	22 96       	adiw	r28, 0x02	; 2
     b72:	e5 e0       	ldi	r30, 0x05	; 5
     b74:	0c 94 29 18 	jmp	0x3052	; 0x3052 <__epilogue_restores__+0x1a>
     b78:	40 c0       	rjmp	.+128    	; 0xbfa <intrabitdelay>
{
	bool save=log_enable;

	if( !log_enable || dst<LOG_START ) return;

	log_enable=FALSE;
     b7a:	10 92 b9 01 	sts	0x01B9, r1
	hal_eeprom_write( dst++, &tag, 1 );
     b7e:	9c 01       	movw	r18, r24
     b80:	2f 5f       	subi	r18, 0xFF	; 255
     b82:	3f 4f       	sbci	r19, 0xFF	; 255
     b84:	30 93 96 01 	sts	0x0196, r19
     b88:	20 93 95 01 	sts	0x0195, r18
     b8c:	be 01       	movw	r22, r28
     b8e:	6f 5f       	subi	r22, 0xFF	; 255
     b90:	7f 4f       	sbci	r23, 0xFF	; 255
     b92:	41 e0       	ldi	r20, 0x01	; 1
     b94:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
	hal_eeprom_write( dst++, &len, 1 );
     b98:	80 91 95 01 	lds	r24, 0x0195
     b9c:	90 91 96 01 	lds	r25, 0x0196
     ba0:	9c 01       	movw	r18, r24
     ba2:	2f 5f       	subi	r18, 0xFF	; 255
     ba4:	3f 4f       	sbci	r19, 0xFF	; 255
     ba6:	30 93 96 01 	sts	0x0196, r19
     baa:	20 93 95 01 	sts	0x0195, r18
     bae:	be 01       	movw	r22, r28
     bb0:	6e 5f       	subi	r22, 0xFE	; 254
     bb2:	7f 4f       	sbci	r23, 0xFF	; 255
     bb4:	41 e0       	ldi	r20, 0x01	; 1
     bb6:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
	hal_eeprom_write( dst, data, len );
     bba:	80 91 95 01 	lds	r24, 0x0195
     bbe:	90 91 96 01 	lds	r25, 0x0196
     bc2:	b8 01       	movw	r22, r16
     bc4:	4a 81       	ldd	r20, Y+2	; 0x02
     bc6:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
	dst+=len;
     bca:	2a 81       	ldd	r18, Y+2	; 0x02
     bcc:	80 91 95 01 	lds	r24, 0x0195
     bd0:	90 91 96 01 	lds	r25, 0x0196
     bd4:	82 0f       	add	r24, r18
     bd6:	91 1d       	adc	r25, r1
     bd8:	90 93 96 01 	sts	0x0196, r25
     bdc:	80 93 95 01 	sts	0x0195, r24
	hal_eeprom_write( LOG_START, (uint8_t *) &dst, 2 );
     be0:	80 e0       	ldi	r24, 0x00	; 0
     be2:	98 e1       	ldi	r25, 0x18	; 24
     be4:	65 e9       	ldi	r22, 0x95	; 149
     be6:	71 e0       	ldi	r23, 0x01	; 1
     be8:	42 e0       	ldi	r20, 0x02	; 2
     bea:	0e 94 7a 00 	call	0xf4	; 0xf4 <hal_eeprom_write>
	log_enable=save;
     bee:	f0 92 b9 01 	sts	0x01B9, r15
}
     bf2:	22 96       	adiw	r28, 0x02	; 2
     bf4:	e5 e0       	ldi	r30, 0x05	; 5
     bf6:	0c 94 29 18 	jmp	0x3052	; 0x3052 <__epilogue_restores__+0x1a>

00000bfa <intrabitdelay>:
     bfa:	65 e1       	ldi	r22, 0x15	; 21

00000bfc <delay>:
     bfc:	6a 95       	dec	r22
     bfe:	f1 f7       	brne	.-4      	; 0xbfc <delay>
     c00:	08 95       	ret

00000c02 <delay1etu>:
     c02:	69 e7       	ldi	r22, 0x79	; 121
     c04:	fb cf       	rjmp	.-10     	; 0xbfc <delay>

00000c06 <recbytet0>:
     c06:	7f 93       	push	r23
     c08:	6f 93       	push	r22
     c0a:	5f 93       	push	r21
     c0c:	4f 93       	push	r20
     c0e:	61 e0       	ldi	r22, 0x01	; 1
     c10:	60 93 ba 01 	sts	0x01BA, r22

00000c14 <restartrecbyte>:
     c14:	be 98       	cbi	0x17, 6	; 23
     c16:	c6 98       	cbi	0x18, 6	; 24

00000c18 <waitforstart>:
     c18:	b6 99       	sbic	0x16, 6	; 22
     c1a:	fe cf       	rjmp	.-4      	; 0xc18 <waitforstart>
     c1c:	b6 99       	sbic	0x16, 6	; 22
     c1e:	fc cf       	rjmp	.-8      	; 0xc18 <waitforstart>
     c20:	88 27       	eor	r24, r24
     c22:	99 27       	eor	r25, r25
     c24:	6f e1       	ldi	r22, 0x1F	; 31
     c26:	ea df       	rcall	.-44     	; 0xbfc <delay>
     c28:	22 d0       	rcall	.+68     	; 0xc6e <getbit>
     c2a:	00 00       	nop
     c2c:	59 e0       	ldi	r21, 0x09	; 9
     c2e:	44 27       	eor	r20, r20
     c30:	62 e4       	ldi	r22, 0x42	; 66
     c32:	00 00       	nop
	...

00000c36 <rnextbit>:
     c36:	e2 df       	rcall	.-60     	; 0xbfc <delay>
     c38:	1a d0       	rcall	.+52     	; 0xc6e <getbit>
     c3a:	47 0f       	add	r20, r23
     c3c:	88 94       	clc
     c3e:	70 fd       	sbrc	r23, 0
     c40:	08 94       	sec
     c42:	87 95       	ror	r24
     c44:	61 e4       	ldi	r22, 0x41	; 65
     c46:	5a 95       	dec	r21
     c48:	b1 f7       	brne	.-20     	; 0xc36 <rnextbit>
     c4a:	88 1f       	adc	r24, r24
     c4c:	40 fd       	sbrc	r20, 0
     c4e:	08 c0       	rjmp	.+16     	; 0xc60 <regetbyte>
     c50:	6c e4       	ldi	r22, 0x4C	; 76
     c52:	d4 df       	rcall	.-88     	; 0xbfc <delay>
     c54:	99 27       	eor	r25, r25
     c56:	4f 91       	pop	r20
     c58:	5f 91       	pop	r21
     c5a:	6f 91       	pop	r22
     c5c:	7f 91       	pop	r23
     c5e:	08 95       	ret

00000c60 <regetbyte>:
     c60:	6c e4       	ldi	r22, 0x4C	; 76
     c62:	cc df       	rcall	.-104    	; 0xbfc <delay>
     c64:	be 9a       	sbi	0x17, 6	; 23
     c66:	c6 98       	cbi	0x18, 6	; 24
     c68:	66 eb       	ldi	r22, 0xB6	; 182
     c6a:	c8 df       	rcall	.-112    	; 0xbfc <delay>
     c6c:	d3 cf       	rjmp	.-90     	; 0xc14 <restartrecbyte>

00000c6e <getbit>:
     c6e:	77 27       	eor	r23, r23
     c70:	88 94       	clc
     c72:	b6 99       	sbic	0x16, 6	; 22
     c74:	08 94       	sec
     c76:	79 1f       	adc	r23, r25
     c78:	c0 df       	rcall	.-128    	; 0xbfa <intrabitdelay>
     c7a:	88 94       	clc
     c7c:	b6 99       	sbic	0x16, 6	; 22
     c7e:	08 94       	sec
     c80:	79 1f       	adc	r23, r25
     c82:	bb df       	rcall	.-138    	; 0xbfa <intrabitdelay>
     c84:	88 94       	clc
     c86:	b6 99       	sbic	0x16, 6	; 22
     c88:	08 94       	sec
     c8a:	79 1f       	adc	r23, r25
     c8c:	76 95       	lsr	r23
     c8e:	08 95       	ret

00000c90 <sendbytet0>:
     c90:	6f 93       	push	r22
     c92:	7f 93       	push	r23
     c94:	60 91 ba 01 	lds	r22, 0x01BA
     c98:	66 23       	and	r22, r22
     c9a:	29 f0       	breq	.+10     	; 0xca6 <resendbytet0>
     c9c:	b2 df       	rcall	.-156    	; 0xc02 <delay1etu>
     c9e:	b1 df       	rcall	.-158    	; 0xc02 <delay1etu>
     ca0:	60 e0       	ldi	r22, 0x00	; 0
     ca2:	60 93 ba 01 	sts	0x01BA, r22

00000ca6 <resendbytet0>:
     ca6:	c6 9a       	sbi	0x18, 6	; 24
     ca8:	be 9a       	sbi	0x17, 6	; 23
     caa:	c6 98       	cbi	0x18, 6	; 24
     cac:	67 e7       	ldi	r22, 0x77	; 119
     cae:	a6 df       	rcall	.-180    	; 0xbfc <delay>
     cb0:	98 e0       	ldi	r25, 0x08	; 8
     cb2:	77 27       	eor	r23, r23

00000cb4 <snextbit>:
     cb4:	87 95       	ror	r24
     cb6:	10 f0       	brcs	.+4      	; 0xcbc <sendbit1>
     cb8:	c6 98       	cbi	0x18, 6	; 24
     cba:	02 c0       	rjmp	.+4      	; 0xcc0 <bitset>

00000cbc <sendbit1>:
     cbc:	c6 9a       	sbi	0x18, 6	; 24
     cbe:	73 95       	inc	r23

00000cc0 <bitset>:
     cc0:	66 e7       	ldi	r22, 0x76	; 118
     cc2:	9c df       	rcall	.-200    	; 0xbfc <delay>
     cc4:	00 00       	nop
     cc6:	9a 95       	dec	r25
     cc8:	a9 f7       	brne	.-22     	; 0xcb4 <snextbit>
     cca:	70 fd       	sbrc	r23, 0
     ccc:	04 c0       	rjmp	.+8      	; 0xcd6 <sendparity1>
     cce:	00 00       	nop
     cd0:	00 00       	nop
     cd2:	c6 98       	cbi	0x18, 6	; 24
     cd4:	04 c0       	rjmp	.+8      	; 0xcde <delayparity>

00000cd6 <sendparity1>:
     cd6:	00 00       	nop
     cd8:	c6 9a       	sbi	0x18, 6	; 24
     cda:	00 00       	nop
	...

00000cde <delayparity>:
     cde:	60 e7       	ldi	r22, 0x70	; 112
     ce0:	8d df       	rcall	.-230    	; 0xbfc <delay>
     ce2:	c6 9a       	sbi	0x18, 6	; 24
     ce4:	67 e7       	ldi	r22, 0x77	; 119
     ce6:	8a df       	rcall	.-236    	; 0xbfc <delay>
     ce8:	be 98       	cbi	0x17, 6	; 23
     cea:	c6 98       	cbi	0x18, 6	; 24
     cec:	88 94       	clc
     cee:	b6 99       	sbic	0x16, 6	; 22
     cf0:	08 94       	sec
     cf2:	30 f0       	brcs	.+12     	; 0xd00 <retsendbytet0>
     cf4:	87 95       	ror	r24

00000cf6 <waitforendoferror>:
     cf6:	b6 99       	sbic	0x16, 6	; 22
     cf8:	fe cf       	rjmp	.-4      	; 0xcf6 <waitforendoferror>
     cfa:	6a e3       	ldi	r22, 0x3A	; 58
     cfc:	7f df       	rcall	.-258    	; 0xbfc <delay>
     cfe:	d3 cf       	rjmp	.-90     	; 0xca6 <resendbytet0>

00000d00 <retsendbytet0>:
     d00:	64 e7       	ldi	r22, 0x74	; 116
     d02:	7c df       	rcall	.-264    	; 0xbfc <delay>
     d04:	7f 91       	pop	r23
     d06:	6f 91       	pop	r22
     d08:	08 95       	ret

00000d0a <trig1>:
     d0a:	bf 9a       	sbi	0x17, 7	; 23
     d0c:	c7 9a       	sbi	0x18, 7	; 24
     d0e:	08 95       	ret

00000d10 <trig0>:
     d10:	bf 9a       	sbi	0x17, 7	; 23
     d12:	c7 98       	cbi	0x18, 7	; 24
     d14:	08 95       	ret

00000d16 <delay1etu1>:
     d16:	69 e7       	ldi	r22, 0x79	; 121
     d18:	71 cf       	rjmp	.-286    	; 0xbfc <delay>
     d1a:	08 95       	ret

00000d1c <gf256mul>:
     d1c:	78 2f       	mov	r23, r24
     d1e:	88 27       	eor	r24, r24
     d20:	76 95       	lsr	r23
     d22:	31 f0       	breq	.+12     	; 0xd30 <gf256mul+0x14>
     d24:	08 f4       	brcc	.+2      	; 0xd28 <gf256mul+0xc>
     d26:	86 27       	eor	r24, r22
     d28:	66 0f       	add	r22, r22
     d2a:	08 f4       	brcc	.+2      	; 0xd2e <gf256mul+0x12>
     d2c:	64 27       	eor	r22, r20
     d2e:	f8 cf       	rjmp	.-16     	; 0xd20 <gf256mul+0x4>
     d30:	08 f4       	brcc	.+2      	; 0xd34 <gf256mul+0x18>
     d32:	86 27       	eor	r24, r22
     d34:	08 95       	ret
	...

00001000 <aes_sbox0>:
    1000:	6c 73       	andi	r22, 0x3C	; 60
    1002:	78 74       	andi	r23, 0x48	; 72
    1004:	fd 64       	ori	r31, 0x4D	; 77
    1006:	60 ca       	rjmp	.-2880   	; 0x4c8 <__stack+0x69>
    1008:	3f 0e       	add	r3, r31
    100a:	68 24       	eor	r6, r8
    100c:	f1 d8       	rcall	.-3614   	; 0x1f0 <hal_rnd_addEntropy+0x9c>
    100e:	a4 79       	andi	r26, 0x94	; 148
    1010:	c5 8d       	ldd	r28, Z+29	; 0x1d
    1012:	c6 72       	andi	r28, 0x26	; 38
    1014:	f5 56       	subi	r31, 0x65	; 101
    1016:	48 ff       	.word	0xff48	; ????
    1018:	a2 db       	rcall	.-2236   	; 0x75e <aes_encrypt_core+0x150>
    101a:	ad a0       	ldd	r10, Y+37	; 0x25
    101c:	93 ab       	std	Z+51, r25	; 0x33
    101e:	7d cf       	rjmp	.-262    	; 0xf1a <gf256mul+0x1fe>
    1020:	b8 f2       	brcs	.-82     	; 0xfd0 <gf256mul+0x2b4>
    1022:	9c 29       	or	r25, r12
    1024:	39 30       	cpi	r19, 0x09	; 9
    1026:	f8 c3       	rjmp	.+2032   	; 0x1818 <aes_sbox0+0x818>
    1028:	3b aa       	std	Y+51, r3	; 0x33
    102a:	ea fe       	.word	0xfeea	; ????
    102c:	7e d7       	rcall	.+3836   	; 0x1f2a <aes_sbox0+0xf2a>
    102e:	3e 1a       	sub	r3, r30
    1030:	0b c8       	rjmp	.-4074   	; 0x48 <rc_tab>
    1032:	2c cc       	rjmp	.-1960   	; 0x88c <aes_encrypt_core+0x27e>
    1034:	17 99       	sbic	0x02, 7	; 2
    1036:	0a 95       	dec	r16
    1038:	08 1d       	adc	r16, r8
    103a:	8f ed       	ldi	r24, 0xDF	; 223
    103c:	e4 28       	or	r14, r4
    103e:	bd 7a       	andi	r27, 0xAD	; 173
    1040:	06 8c       	ldd	r0, Z+30	; 0x1e
    1042:	23 15       	cp	r18, r3
    1044:	14 61       	ori	r17, 0x14	; 20
    1046:	55 af       	std	Z+61, r21	; 0x3d
    1048:	5d 34       	cpi	r21, 0x4D	; 77
    104a:	d9 bc       	out	0x29, r13	; 41
    104c:	26 ec       	ldi	r18, 0xC6	; 198
    104e:	20 8b       	std	Z+16, r18	; 0x10
    1050:	5c de       	rcall	.-840    	; 0xd0a <trig1>
    1052:	0f e2       	ldi	r16, 0x2F	; 47
    1054:	2f f3       	brie	.-54     	; 0x1020 <aes_sbox0+0x20>
    1056:	be 54       	subi	r27, 0x4E	; 78
    1058:	65 c4       	rjmp	.+2250   	; 0x1924 <aes_sbox0+0x924>
    105a:	b1 36       	cpi	r27, 0x61	; 97
    105c:	45 43       	sbci	r20, 0x35	; 53
    105e:	57 c0       	rjmp	.+174    	; 0x110e <aes_sbox0+0x10e>
    1060:	df e0       	ldi	r29, 0x0F	; 15
    1062:	a5 f4       	brhc	.+40     	; 0x108c <aes_sbox0+0x8c>
    1064:	4c 42       	sbci	r20, 0x2C	; 44
    1066:	3c 8a       	std	Y+20, r3	; 0x14
    1068:	4a f6       	brpl	.-110    	; 0xffc <gf256mul+0x2e0>
    106a:	0d 70       	andi	r16, 0x0D	; 13
    106c:	5f 33       	cpi	r21, 0x3F	; 63
    106e:	90 a7       	std	Z+40, r25	; 0x28
    1070:	5e ac       	ldd	r5, Y+62	; 0x3e
    1072:	4f 80       	ldd	r4, Y+7	; 0x07
    1074:	9d 92       	st	X+, r9
    1076:	37 fa       	bst	r3, 7
    1078:	b3 b9       	out	0x03, r27	; 3
    107a:	d5 2e       	mov	r13, r21
    107c:	1f f0       	brie	.+6      	; 0x1084 <aes_sbox0+0x84>
    107e:	fc dd       	rcall	.-1032   	; 0xc78 <getbit+0xa>
    1080:	c2 03       	fmuls	r20, r18
    1082:	1c e3       	ldi	r17, 0x3C	; 60
    1084:	50 98       	cbi	0x0a, 0	; 10
    1086:	4b 18       	sub	r4, r11
    1088:	cb a8       	ldd	r12, Y+51	; 0x33
    108a:	71 32       	cpi	r23, 0x21	; 33
    108c:	6b 52       	subi	r22, 0x2B	; 43
    108e:	16 7c       	andi	r17, 0xC6	; 198
    1090:	6f 8e       	std	Y+31, r6	; 0x1f
    1092:	40 d3       	rcall	.+1664   	; 0x1714 <aes_sbox0+0x714>
    1094:	2d 25       	eor	r18, r13
    1096:	9f 87       	std	Y+15, r25	; 0x0f
    1098:	49 e1       	ldi	r20, 0x19	; 25
    109a:	b7 1b       	sub	r27, r23
    109c:	d1 51       	subi	r29, 0x11	; 17
    109e:	04 d4       	rcall	.+2056   	; 0x18a8 <aes_sbox0+0x8a8>
    10a0:	ef 3d       	cpi	r30, 0xDF	; 223
    10a2:	35 05       	cpc	r19, r5
    10a4:	46 09       	sbc	r20, r6
    10a6:	2b 53       	subi	r18, 0x3B	; 59
    10a8:	cd dc       	rcall	.-1638   	; 0xa44 <aes_init+0x114>
    10aa:	a3 6d       	ori	r26, 0xD3	; 211
    10ac:	9e 9a       	sbi	0x13, 6	; 19
    10ae:	eb 76       	andi	r30, 0x6B	; 107
    10b0:	e8 c7       	rjmp	.+4048   	; 0x2082 <pok+0x82>
    10b2:	38 62       	ori	r19, 0x28	; 40
    10b4:	82 da       	rcall	.-2812   	; 0x5ba <aes_shiftcol+0x1e>
    10b6:	41 a6       	std	Z+41, r4	; 0x29
    10b8:	63 59       	subi	r22, 0x93	; 147
    10ba:	fb e5       	ldi	r31, 0x5B	; 91
    10bc:	6a 75       	andi	r22, 0x5A	; 90
    10be:	a1 07       	cpc	r26, r17
    10c0:	b5 77       	andi	r27, 0x75	; 117
    10c2:	2a 21       	and	r18, r10
    10c4:	13 a9       	ldd	r17, Z+51	; 0x33
    10c6:	bb c9       	rjmp	.-3210   	; 0x43e <main+0x90>
    10c8:	e7 d2       	rcall	.+1486   	; 0x1698 <aes_sbox0+0x698>
    10ca:	7b 10       	cpse	r7, r11
    10cc:	44 b2       	in	r4, 0x14	; 20
    10ce:	84 85       	ldd	r24, Z+12	; 0x0c
    10d0:	7f 31       	cpi	r23, 0x1F	; 31
    10d2:	ba 69       	ori	r27, 0x9A	; 154
    10d4:	47 0c       	add	r4, r7
    10d6:	f9 01       	movw	r30, r18
    10d8:	6e 3a       	cpi	r22, 0xAE	; 174
    10da:	58 b6       	in	r5, 0x38	; 56
    10dc:	89 ce       	rjmp	.-750    	; 0xdf0 <gf256mul+0xd4>
    10de:	12 91       	ld	r17, -Z
    10e0:	ee f7       	brtc	.-6      	; 0x10dc <aes_sbox0+0xdc>
    10e2:	97 1e       	adc	r9, r23
    10e4:	66 d6       	rcall	.+3276   	; 0x1db2 <aes_sbox0+0xdb2>
    10e6:	81 9b       	sbis	0x10, 1	; 16
    10e8:	94 11       	cpse	r25, r4
    10ea:	88 e6       	ldi	r24, 0x68	; 104
    10ec:	c1 5a       	subi	r28, 0xA1	; 161
    10ee:	27 d0       	rcall	.+78     	; 0x113e <aes_sbox0+0x13e>
    10f0:	83 ae       	std	Z+59, r8	; 0x3b
    10f2:	86 02       	muls	r24, r22
    10f4:	b0 e9       	ldi	r27, 0x90	; 144
    10f6:	4d 67       	ori	r20, 0x7D	; 125
    10f8:	4e 96       	adiw	r24, 0x1e	; 30
    10fa:	22 00       	.word	0x0022	; ????
    10fc:	bf 5b       	subi	r27, 0xBF	; 191
    10fe:	b4 19       	sub	r27, r4
    1100:	40 9d       	mul	r20, r0
    1102:	e1 c8       	rjmp	.-3646   	; 0x2c6 <hal_rnd_getBlock+0xa6>
    1104:	1d 51       	subi	r17, 0x1D	; 29
    1106:	37 06       	cpc	r3, r23
    1108:	f3 59       	subi	r31, 0x93	; 147
    110a:	5d c4       	rjmp	.+2234   	; 0x19c6 <aes_sbox0+0x9c6>
    110c:	4d 41       	sbci	r20, 0x1D	; 29
    110e:	4a 55       	subi	r20, 0x5A	; 90
    1110:	f6 44       	sbci	r31, 0x46	; 70
    1112:	92 aa       	std	Z+50, r9	; 0x32
    1114:	99 94       	.word	0x9499	; ????
    1116:	e2 9b       	sbis	0x1c, 2	; 28
    1118:	c6 71       	andi	r28, 0x16	; 22
    111a:	6f cc       	rjmp	.-1826   	; 0x9fa <aes_init+0xca>
    111c:	4b ff       	.word	0xff4b	; ????
    111e:	b4 fc       	sbrc	r11, 4
    1120:	23 07       	cpc	r18, r19
    1122:	ee 47       	sbci	r30, 0x7E	; 126
    1124:	c7 d3       	rcall	.+1934   	; 0x18b4 <aes_sbox0+0x8b4>
    1126:	93 02       	muls	r25, r19
    1128:	fa c1       	rjmp	.+1012   	; 0x151e <aes_sbox0+0x51e>
    112a:	09 00       	.word	0x0009	; ????
    112c:	10 a5       	ldd	r17, Z+40	; 0x28
    112e:	cb 81       	ldd	r28, Y+3	; 0x03
    1130:	43 84       	ldd	r4, Z+11	; 0x0b
    1132:	11 dd       	rcall	.-1502   	; 0xb56 <log_add+0x10>
    1134:	d4 b6       	in	r13, 0x34	; 52
    1136:	24 31       	cpi	r18, 0x14	; 20
    1138:	ac 33       	cpi	r26, 0x3C	; 60
    113a:	a0 2e       	mov	r10, r16
    113c:	f5 15       	cp	r31, r5
    113e:	f1 32       	cpi	r31, 0x21	; 33
    1140:	b2 19       	sub	r27, r2
    1142:	d5 1f       	adc	r29, r21
    1144:	85 e0       	ldi	r24, 0x05	; 5
    1146:	0d 64       	ori	r16, 0x4D	; 77
    1148:	96 6c       	ori	r25, 0xC6	; 198
    114a:	58 2d       	mov	r21, r8
    114c:	2c 1a       	sub	r2, r28
    114e:	b5 3f       	cpi	r27, 0xF5	; 245
    1150:	f9 6e       	ori	r31, 0xE9	; 233
    1152:	7a 7c       	andi	r23, 0xCA	; 202
    1154:	0f 88       	ldd	r0, Y+23	; 0x17
    1156:	fd 5c       	subi	r31, 0xCD	; 205
    1158:	6d 87       	std	Y+13, r22	; 0x0d
    115a:	ca 16       	cp	r12, r26
    115c:	db 36       	cpi	r29, 0x6B	; 107
    115e:	e7 65       	ori	r30, 0x57	; 87
    1160:	9e a9       	ldd	r25, Y+54	; 0x36
    1162:	0a 66       	ori	r16, 0x6A	; 106
    1164:	49 34       	cpi	r20, 0x49	; 73
    1166:	cf 73       	andi	r28, 0x3F	; 63
    1168:	b3 05       	cpc	r27, r3
    116a:	7b 75       	andi	r23, 0x5B	; 91
    116c:	cd 9c       	mul	r12, r13
    116e:	d9 e6       	ldi	r29, 0x69	; 105
    1170:	e4 c5       	rjmp	.+3016   	; 0x1d3a <aes_sbox0+0xd3a>
    1172:	c9 26       	eor	r12, r25
    1174:	17 ec       	ldi	r17, 0xC7	; 199
    1176:	80 8a       	std	Z+16, r8	; 0x10
    1178:	c3 0e       	add	r12, r19
    117a:	ab a4       	ldd	r10, Y+43	; 0x2b
    117c:	b9 76       	andi	r27, 0x69	; 105
    117e:	95 67       	ori	r25, 0x75	; 117
    1180:	45 2f       	mov	r20, r21
    1182:	6b 52       	subi	r22, 0x2B	; 43
    1184:	0b 48       	sbci	r16, 0x8B	; 139
    1186:	91 f2       	breq	.-92     	; 0x112c <aes_sbox0+0x12c>
    1188:	21 72       	andi	r18, 0x21	; 33
    118a:	a1 69       	ori	r26, 0x91	; 145
    118c:	da 25       	eor	r29, r10
    118e:	3a fb       	.word	0xfb3a	; ????
    1190:	ed 3d       	cpi	r30, 0xDD	; 221
    1192:	68 e8       	ldi	r22, 0x88	; 136
    1194:	22 8e       	std	Z+26, r2	; 0x1a
    1196:	d8 70       	andi	r29, 0x08	; 8
    1198:	be a6       	std	Y+46, r11	; 0x2e
    119a:	1c 14       	cp	r1, r12
    119c:	ea 79       	andi	r30, 0x9A	; 154
    119e:	b7 56       	subi	r27, 0x67	; 103
    11a0:	4f d2       	rcall	.+1182   	; 0x1640 <aes_sbox0+0x640>
    11a2:	a3 a7       	std	Z+43, r26	; 0x2b
    11a4:	54 9a       	sbi	0x0a, 4	; 10
    11a6:	e5 f4       	brhc	.+56     	; 0x11e0 <aes_sbox0+0x1e0>
    11a8:	6a 12       	cpse	r6, r26
    11aa:	30 7f       	andi	r19, 0xF0	; 240
    11ac:	3c 0c       	add	r3, r12
    11ae:	04 d6       	rcall	.+3080   	; 0x1db8 <aes_sbox0+0xdb8>
    11b0:	3e 98       	cbi	0x07, 6	; 7
    11b2:	4c 53       	subi	r20, 0x3C	; 60
    11b4:	dc c2       	rjmp	.+1464   	; 0x176e <aes_sbox0+0x76e>
    11b6:	60 5a       	subi	r22, 0xA0	; 160
    11b8:	9f 78       	andi	r25, 0x8F	; 143
    11ba:	e3 bb       	out	0x13, r30	; 19
    11bc:	5b 01       	movw	r10, r22
    11be:	fe d1       	rcall	.+1020   	; 0x15bc <aes_sbox0+0x5bc>
    11c0:	bc bd       	out	0x2c, r27	; 44
    11c2:	8b 7d       	andi	r24, 0xDB	; 219
    11c4:	29 42       	sbci	r18, 0x29	; 41
    11c6:	eb de       	rcall	.-554    	; 0xf9e <gf256mul+0x282>
    11c8:	f0 82       	st	Z, r15
    11ca:	90 2a       	or	r9, r16
    11cc:	18 13       	cpse	r17, r24
    11ce:	4e 8c       	ldd	r4, Y+30	; 0x1e
    11d0:	a8 2b       	or	r26, r24
    11d2:	f7 b0       	in	r15, 0x07	; 7
    11d4:	8f 61       	ori	r24, 0x1F	; 31
    11d6:	03 57       	subi	r16, 0x73	; 115
    11d8:	38 c0       	rjmp	.+112    	; 0x124a <aes_sbox0+0x24a>
    11da:	35 7e       	andi	r19, 0xE5	; 229
    11dc:	50 83       	st	Z, r21
    11de:	08 46       	sbci	r16, 0x68	; 104
    11e0:	e9 1e       	adc	r14, r25
    11e2:	63 f8       	bld	r6, 3
    11e4:	df b1       	in	r29, 0x0f	; 15
    11e6:	28 ad       	ldd	r18, Y+56	; 0x38
    11e8:	a2 b8       	out	0x02, r10	; 2
    11ea:	ef 5f       	subi	r30, 0xFF	; 255
    11ec:	27 ae       	std	Z+63, r2	; 0x3f
    11ee:	ce d7       	rcall	.+3996   	; 0x218c <pok+0x18c>
    11f0:	20 8d       	ldd	r18, Z+24	; 0x18
    11f2:	62 86       	std	Z+10, r6	; 0x0a
    11f4:	39 1b       	sub	r19, r25
    11f6:	af 77       	andi	r26, 0x7F	; 127
    11f8:	5e 74       	andi	r21, 0x4E	; 78
    11fa:	d0 89       	ldd	r29, Z+16	; 0x10
    11fc:	3b bf       	out	0x3b, r19	; 59
    11fe:	97 ba       	out	0x17, r9	; 23
    1200:	3c a3       	std	Y+36, r19	; 0x24
    1202:	21 af       	std	Z+57, r18	; 0x39
    1204:	1a fa       	.word	0xfa1a	; ????
    1206:	3d fe       	.word	0xfe3d	; ????
    1208:	8b 4c       	sbci	r24, 0xCB	; 203
    120a:	d2 1e       	adc	r13, r18
    120c:	b9 db       	rcall	.-2190   	; 0x980 <aes_init+0x50>
    120e:	3e 2b       	or	r19, r30
    1210:	ce f5       	brtc	.+114    	; 0x1284 <aes_sbox0+0x284>
    1212:	0f 06       	cpc	r0, r31
    1214:	aa 1f       	adc	r26, r26
    1216:	8e c4       	rjmp	.+2332   	; 0x1b34 <aes_sbox0+0xb34>
    1218:	08 2c       	mov	r0, r8
    121a:	48 e1       	ldi	r20, 0x18	; 24
    121c:	dc c8       	rjmp	.-3656   	; 0x3d6 <main+0x28>
    121e:	0d 9c       	mul	r0, r13
    1220:	7e c9       	rjmp	.-3332   	; 0x51e <t0_sendWord+0xa>
    1222:	c3 60       	ori	r28, 0x03	; 3
    1224:	f0 44       	sbci	r31, 0x40	; 64
    1226:	f3 bb       	out	0x13, r31	; 19
    1228:	4b f9       	.word	0xf94b	; ????
    122a:	a5 9d       	mul	r26, r5
    122c:	9b 96       	adiw	r26, 0x2b	; 43
    122e:	94 ed       	ldi	r25, 0xD4	; 212
    1230:	56 fc       	sbrc	r5, 6
    1232:	cb 52       	subi	r28, 0x2B	; 43
    1234:	4e 42       	sbci	r20, 0x2E	; 46
    1236:	5a 45       	sbci	r21, 0x5A	; 90
    1238:	92 4f       	sbci	r25, 0xF2	; 242
    123a:	c7 ee       	ldi	r28, 0xE7	; 231
    123c:	5e 12       	cpse	r5, r30
    123e:	09 38       	cpi	r16, 0x89	; 137
    1240:	01 cc       	rjmp	.-2046   	; 0xa44 <aes_init+0x114>
    1242:	ab a4       	ldd	r10, Y+43	; 0x2b
    1244:	79 b6       	in	r7, 0x39	; 57
    1246:	68 9a       	sbi	0x0d, 0	; 13
    1248:	ca eb       	ldi	r28, 0xBA	; 186
    124a:	29 c6       	rjmp	.+3154   	; 0x1e9e <aes_sbox0+0xe9e>
    124c:	e3 18       	sub	r14, r3
    124e:	85 8f       	std	Z+29, r24	; 0x1d
    1250:	0a bc       	out	0x2a, r0	; 42
    1252:	7a 74       	andi	r23, 0x4A	; 74
    1254:	93 c2       	rjmp	.+1318   	; 0x177c <aes_sbox0+0x77c>
    1256:	e9 d6       	rcall	.+3538   	; 0x202a <pok+0x2a>
    1258:	a6 91       	elpm	r26, Z+
    125a:	69 05       	cpc	r22, r9
    125c:	3b 46       	sbci	r19, 0x6B	; 107
    125e:	7c c0       	rjmp	.+248    	; 0x1358 <aes_sbox0+0x358>
    1260:	88 62       	ori	r24, 0x28	; 40
    1262:	19 c5       	rjmp	.+2610   	; 0x1c96 <aes_sbox0+0xc96>
    1264:	39 d4       	rcall	.+2162   	; 0x1ad8 <aes_sbox0+0xad8>
    1266:	6a e8       	ldi	r22, 0x8A	; 138
    1268:	61 f6       	brne	.-104    	; 0x1202 <aes_sbox0+0x202>
    126a:	73 75       	andi	r23, 0x53	; 83
    126c:	87 00       	.word	0x0087	; ????
    126e:	53 f2       	brvs	.-108    	; 0x1204 <aes_sbox0+0x204>
    1270:	63 99       	sbic	0x0c, 3	; 12
    1272:	22 57       	subi	r18, 0x72	; 114
    1274:	15 23       	and	r17, r21
    1276:	30 ba       	out	0x10, r3	; 16
    1278:	16 bd       	out	0x26, r17	; 38
    127a:	10 da       	rcall	.-3040   	; 0x69c <aes_encrypt_core+0x8e>
    127c:	ef 8a       	std	Y+23, r14	; 0x17
    127e:	6b 02       	muls	r22, r27
    1280:	77 90       	elpm	r7, Z+
    1282:	b4 ec       	ldi	r27, 0xC4	; 196
    1284:	0e 54       	subi	r16, 0x4E	; 78
    1286:	de f1       	brts	.+118    	; 0x12fe <aes_sbox0+0x2fe>
    1288:	97 31       	cpi	r25, 0x17	; 23
    128a:	5c 43       	sbci	r21, 0x3C	; 60
    128c:	cd d3       	rcall	.+1946   	; 0x1a28 <aes_sbox0+0xa28>
    128e:	55 6f       	ori	r21, 0xF5	; 245
    1290:	1d 65       	ori	r17, 0x5D	; 93
    1292:	70 3f       	cpi	r23, 0xF0	; 240
    1294:	03 33       	cpi	r16, 0x33	; 51
    1296:	d9 0b       	sbc	r29, r25
    1298:	dd 40       	sbci	r29, 0x0D	; 13
    129a:	a8 ac       	ldd	r10, Y+56	; 0x38
    129c:	95 5b       	subi	r25, 0xB5	; 181
    129e:	fb ea       	ldi	r31, 0xAB	; 171
    12a0:	a9 b1       	in	r26, 0x09	; 9
    12a2:	1b 13       	cpse	r17, r27
    12a4:	76 e5       	ldi	r23, 0x56	; 86
    12a6:	59 b8       	out	0x09, r5	; 9
    12a8:	32 e2       	ldi	r19, 0x22	; 34
    12aa:	e7 67       	ori	r30, 0x77	; 119
    12ac:	81 2d       	mov	r24, r1
    12ae:	7f d7       	rcall	.+3838   	; 0x21ae <pok+0x1ae>
    12b0:	7d 2e       	mov	r7, r29
    12b2:	66 ae       	std	Z+62, r6	; 0x3e
    12b4:	2a d5       	rcall	.+2644   	; 0x1d0a <aes_sbox0+0xd0a>
    12b6:	f4 35       	cpi	r31, 0x54	; 84
    12b8:	20 4a       	sbci	r18, 0xA0	; 160
    12ba:	5d 64       	ori	r21, 0x4D	; 77
    12bc:	47 04       	cpc	r4, r7
    12be:	fd 9e       	mul	r15, r29
    12c0:	7b 51       	subi	r23, 0x1B	; 27
    12c2:	86 df       	rcall	.-244    	; 0x11d0 <aes_sbox0+0x1d0>
    12c4:	b0 34       	cpi	r27, 0x40	; 64
    12c6:	b5 98       	cbi	0x16, 5	; 22
    12c8:	82 2f       	mov	r24, r18
    12ca:	89 6d       	ori	r24, 0xD9	; 217
    12cc:	14 36       	cpi	r17, 0x64	; 100
    12ce:	78 a0       	ldd	r7, Y+32	; 0x20
    12d0:	b7 ad       	ldd	r27, Z+63	; 0x3f
    12d2:	50 e0       	ldi	r21, 0x00	; 0
    12d4:	a1 28       	or	r10, r1
    12d6:	d8 c1       	rjmp	.+944    	; 0x1688 <aes_sbox0+0x688>
    12d8:	11 e6       	ldi	r17, 0x61	; 97
    12da:	f7 6c       	ori	r31, 0xC7	; 199
    12dc:	be d0       	rcall	.+380    	; 0x145a <aes_sbox0+0x45a>
    12de:	a2 27       	eor	r26, r18
    12e0:	cf 37       	cpi	r28, 0x7F	; 127
    12e2:	71 3a       	cpi	r23, 0xA1	; 161
    12e4:	8c 5f       	subi	r24, 0xFC	; 252
    12e6:	49 07       	cpc	r20, r25
    12e8:	24 a7       	std	Z+44, r18	; 0x2c
    12ea:	bf f8       	.word	0xf8bf	; ????
    12ec:	6e 80       	ldd	r6, Y+6	; 0x06
    12ee:	58 0c       	add	r5, r8
    12f0:	8d ff       	.word	0xff8d	; ????
    12f2:	25 9f       	mul	r18, r21
    12f4:	1c 17       	cp	r17, r28
    12f6:	83 41       	sbci	r24, 0x13	; 19
    12f8:	b2 b3       	in	r27, 0x12	; 18
    12fa:	72 84       	ldd	r7, Z+10	; 0x0a
    12fc:	4d 26       	eor	r4, r29
    12fe:	d1 e4       	ldi	r29, 0x41	; 65
    1300:	41 54       	subi	r20, 0x41	; 65
    1302:	b1 d3       	rcall	.+1890   	; 0x1a66 <aes_sbox0+0xa66>
    1304:	74 b8       	out	0x04, r7	; 4
    1306:	26 e1       	ldi	r18, 0x16	; 22
    1308:	94 57       	subi	r25, 0x74	; 116
    130a:	90 70       	andi	r25, 0x00	; 0
    130c:	c5 4b       	sbci	r28, 0xB5	; 181
    130e:	c9 56       	subi	r28, 0x69	; 105
    1310:	f6 67       	ori	r31, 0x76	; 118
    1312:	a2 b6       	in	r10, 0x32	; 50
    1314:	8b 22       	and	r8, r27
    1316:	46 62       	ori	r20, 0x26	; 38
    1318:	ae e4       	ldi	r26, 0x4E	; 78
    131a:	75 c0       	rjmp	.+234    	; 0x1406 <aes_sbox0+0x406>
    131c:	6c 65       	ori	r22, 0x5C	; 92
    131e:	9f a4       	ldd	r9, Y+47	; 0x2f
    1320:	87 fe       	sbrs	r8, 7
    1322:	fc f1       	brlt	.+126    	; 0x13a2 <aes_sbox0+0x3a2>
    1324:	f7 cf       	rjmp	.-18     	; 0x1314 <aes_sbox0+0x314>
    1326:	93 21       	and	r25, r3
    1328:	d1 99       	sbic	0x1a, 1	; 26
    132a:	2e 9a       	sbi	0x05, 6	; 5
    132c:	0a a9       	ldd	r16, Y+50	; 0x32
    132e:	a3 14       	cp	r10, r3
    1330:	52 63       	ori	r21, 0x32	; 50
    1332:	78 34       	cpi	r23, 0x48	; 72
    1334:	84 ad       	ldd	r24, Z+60	; 0x3c
    1336:	25 f8       	bld	r2, 5
    1338:	2f 30       	cpi	r18, 0x0F	; 15
    133a:	28 24       	eor	r2, r8
    133c:	38 a1       	ldd	r19, Y+32	; 0x20
    133e:	96 3c       	cpi	r25, 0xC6	; 198
    1340:	e5 ef       	ldi	r30, 0xF5	; 245
    1342:	72 89       	ldd	r23, Z+18	; 0x12
    1344:	ac 43       	sbci	r26, 0x3C	; 60
    1346:	81 a0       	ldd	r8, Z+33	; 0x21
    1348:	f0 02       	muls	r31, r16
    134a:	dc 13       	cpse	r29, r28
    134c:	ce c1       	rjmp	.+924    	; 0x16ea <aes_sbox0+0x6ea>
    134e:	a6 6b       	ori	r26, 0xB6	; 182
    1350:	aa 16       	cp	r10, r26
    1352:	2c 51       	subi	r18, 0x1C	; 28
    1354:	6f 03       	fmul	r22, r23
    1356:	fb cc       	rjmp	.-1546   	; 0xd4e <gf256mul+0x32>
    1358:	bc 83       	std	Y+4, r27	; 0x04
    135a:	a8 f9       	.word	0xf9a8	; ????
    135c:	1e 10       	cpse	r1, r14
    135e:	d6 60       	ori	r29, 0x06	; 6
    1360:	98 39       	cpi	r25, 0x98	; 152
    1362:	6a ed       	ldi	r22, 0xDA	; 218
    1364:	1f 19       	sub	r17, r15
    1366:	9c 0b       	sbc	r25, r28
    1368:	82 00       	.word	0x0082	; ????
    136a:	be 53       	subi	r27, 0x3E	; 62
    136c:	af 73       	andi	r26, 0x3F	; 63
    136e:	08 e2       	ldi	r16, 0x28	; 40
    1370:	68 01       	movw	r12, r16
    1372:	e0 85       	ldd	r30, Z+8	; 0x08
    1374:	b0 7a       	andi	r27, 0xA0	; 160
    1376:	d7 7c       	andi	r29, 0xC7	; 199
    1378:	d0 5a       	subi	r29, 0xA0	; 160
    137a:	49 7f       	andi	r20, 0xF9	; 249
    137c:	3d 48       	sbci	r19, 0x8D	; 141
    137e:	f3 09       	sbc	r31, r3
    1380:	05 3f       	cpi	r16, 0xF5	; 245
    1382:	b9 a7       	std	Y+41, r27	; 0x29
    1384:	29 36       	cpi	r18, 0x69	; 105
    1386:	5b fd       	.word	0xfd5b	; ????
    1388:	9b b4       	in	r9, 0x2b	; 43
    138a:	3e 64       	ori	r19, 0x4E	; 78
    138c:	86 de       	rcall	.-756    	; 0x109a <aes_sbox0+0x9a>
    138e:	fa 1d       	adc	r31, r10
    1390:	80 91 31 ff 	lds	r24, 0xFF31
    1394:	c6 c2       	rjmp	.+1420   	; 0x1922 <aes_sbox0+0x922>
    1396:	2a b7       	in	r18, 0x3a	; 58
    1398:	61 b3       	in	r22, 0x11	; 17
    139a:	59 69       	ori	r21, 0x99	; 153
    139c:	55 1a       	sub	r5, r21
    139e:	0f 77       	andi	r16, 0x7F	; 127
    13a0:	bd 15       	cp	r27, r13
    13a2:	47 eb       	ldi	r20, 0xB7	; 183
    13a4:	0d 8d       	ldd	r16, Y+29	; 0x1d
    13a6:	88 58       	subi	r24, 0x88	; 136
    13a8:	d2 33       	cpi	r29, 0x32	; 50
    13aa:	8f 1c       	adc	r8, r15
    13ac:	79 71       	andi	r23, 0x19	; 25
    13ae:	db c3       	rjmp	.+1974   	; 0x1b66 <aes_sbox0+0xb66>
    13b0:	f4 97       	sbiw	r30, 0x34	; 52
    13b2:	6e 2d       	mov	r22, r14
    13b4:	0e 37       	cpi	r16, 0x7E	; 126
    13b6:	20 4a       	sbci	r18, 0xA0	; 160
    13b8:	5f 9e       	mul	r5, r31
    13ba:	bf 40       	sbci	r27, 0x0F	; 15
    13bc:	c4 0c       	add	r12, r4
    13be:	44 17       	cp	r20, r20
    13c0:	ca 12       	cpse	r12, r26
    13c2:	5c 7e       	andi	r21, 0xEC	; 236
    13c4:	07 e3       	ldi	r16, 0x37	; 55
    13c6:	45 e8       	ldi	r20, 0x85	; 133
    13c8:	f2 df       	rcall	.-28     	; 0x13ae <aes_sbox0+0x3ae>
    13ca:	5e da       	rcall	.-2884   	; 0x888 <aes_encrypt_core+0x27a>
    13cc:	b5 ec       	ldi	r27, 0xC5	; 197
    13ce:	3b 11       	cpse	r19, r11
    13d0:	4d c8       	rjmp	.-3942   	; 0x46c <__stack+0xd>
    13d2:	ba d4       	rcall	.+2420   	; 0x1d48 <aes_sbox0+0xd48>
    13d4:	06 9d       	mul	r16, r6
    13d6:	8c 7b       	andi	r24, 0xBC	; 188
    13d8:	ab b2       	in	r10, 0x1b	; 27
    13da:	42 cb       	rjmp	.-2428   	; 0xa60 <aes_init+0x130>
    13dc:	8a 3a       	cpi	r24, 0xAA	; 170
    13de:	c7 dd       	rcall	.-1138   	; 0xf6e <gf256mul+0x252>
    13e0:	66 32       	cpi	r22, 0x26	; 38
    13e2:	ea 04       	cpc	r14, r10
    13e4:	92 d5       	rcall	.+2852   	; 0x1f0a <aes_sbox0+0xf0a>
    13e6:	cd 4e       	sbci	r28, 0xED	; 237
    13e8:	6d 23       	and	r22, r29
    13ea:	35 e6       	ldi	r19, 0x65	; 101
    13ec:	50 1b       	sub	r21, r16
    13ee:	5d a5       	ldd	r21, Y+45	; 0x2d
    13f0:	8e bb       	out	0x1e, r24	; 30
    13f2:	4c 27       	eor	r20, r28
    13f4:	ee 18       	sub	r14, r14
    13f6:	d9 d8       	rcall	.-3662   	; 0x5aa <aes_shiftcol+0xe>
    13f8:	2b e9       	ldi	r18, 0x9B	; 155
    13fa:	7d 76       	andi	r23, 0x6D	; 109
    13fc:	f5 4f       	sbci	r31, 0xF5	; 245
    13fe:	95 e7       	ldi	r25, 0x75	; 117
    1400:	b1 5c       	subi	r27, 0xC1	; 193
    1402:	8d 0f       	add	r24, r29
    1404:	07 ed       	ldi	r16, 0xD7	; 215
    1406:	a0 7c       	andi	r26, 0xC0	; 192
    1408:	65 e2       	ldi	r22, 0x25	; 37
    140a:	97 36       	cpi	r25, 0x67	; 103
    140c:	93 04       	cpc	r9, r3
    140e:	10 16       	cp	r1, r16
    1410:	46 70       	andi	r20, 0x06	; 6
    1412:	df 55       	subi	r29, 0x5F	; 95
    1414:	fc 06       	cpc	r15, r28
    1416:	32 47       	sbci	r19, 0x72	; 114
    1418:	ef 8a       	std	Y+23, r14	; 0x17
    141a:	67 0e       	add	r6, r23
    141c:	d8 73       	andi	r29, 0x38	; 56
    141e:	bf 75       	andi	r27, 0x5F	; 95
    1420:	d3 1c       	adc	r13, r3
    1422:	ff 0d       	add	r31, r15
    1424:	a9 64       	ori	r26, 0x49	; 73
    1426:	c1 ce       	rjmp	.-638    	; 0x11aa <aes_sbox0+0x1aa>
    1428:	7d 86       	std	Y+13, r7	; 0x0d
    142a:	ea e0       	ldi	r30, 0x0A	; 10
    142c:	8e af       	std	Y+62, r24	; 0x3e
    142e:	a3 4c       	sbci	r26, 0xC3	; 195
    1430:	a7 f6       	brid	.-88     	; 0x13da <aes_sbox0+0x3da>
    1432:	b3 8c       	ldd	r11, Z+27	; 0x1b
    1434:	d9 6f       	ori	r29, 0xF9	; 249
    1436:	11 1f       	adc	r17, r17
    1438:	23 5e       	subi	r18, 0xE3	; 227
    143a:	a5 19       	sub	r26, r5
    143c:	f4 c3       	rjmp	.+2024   	; 0x1c26 <aes_sbox0+0xc26>
    143e:	60 0c       	add	r6, r0
    1440:	21 95       	neg	r18
    1442:	de 96       	adiw	r26, 0x3e	; 62
    1444:	ac 1b       	sub	r26, r28
    1446:	05 a6       	std	Z+45, r0	; 0x2d
    1448:	f3 fe       	sbrs	r15, 3
    144a:	88 f1       	brcs	.+98     	; 0x14ae <aes_sbox0+0x4ae>
    144c:	9c 2e       	mov	r9, r28
    144e:	f8 c0       	rjmp	.+496    	; 0x1640 <aes_sbox0+0x640>
    1450:	27 2b       	or	r18, r23
    1452:	20 3f       	cpi	r18, 0xF0	; 240
    1454:	99 33       	cpi	r25, 0x39	; 57
    1456:	37 ae       	std	Z+63, r3	; 0x3f
    1458:	77 3b       	cpi	r23, 0xB7	; 183
    145a:	5d 6c       	ori	r21, 0xCD	; 205
    145c:	2a f7       	brpl	.-54     	; 0x1428 <aes_sbox0+0x428>
    145e:	8b a2       	std	Y+35, r8	; 0x23
    1460:	9f 7f       	andi	r25, 0xFF	; 255
    1462:	9b 58       	subi	r25, 0x8B	; 139
    1464:	c6 59       	subi	r28, 0x96	; 150
    1466:	ca 44       	sbci	r28, 0x4A	; 74
    1468:	be dc       	rcall	.-1668   	; 0xde6 <gf256mul+0xca>
    146a:	4e 5b       	subi	r20, 0xBE	; 190
    146c:	29 ee       	ldi	r18, 0xE9	; 233
    146e:	7b b7       	in	r23, 0x3b	; 59
    1470:	7a cf       	rjmp	.-268    	; 0x1366 <aes_sbox0+0x366>
    1472:	a1 eb       	ldi	r26, 0xB1	; 177
    1474:	90 ab       	std	Z+48, r25	; 0x30
    1476:	63 6a       	ori	r22, 0xA3	; 163
    1478:	ad b9       	out	0x0d, r26	; 13
    147a:	f9 68       	ori	r31, 0x89	; 137
    147c:	49 6d       	ori	r20, 0xD9	; 217
    147e:	84 2d       	mov	r24, r4
    1480:	3a e9       	ldi	r19, 0x9A	; 154
    1482:	62 2c       	mov	r6, r2
    1484:	52 aa       	std	Z+50, r5	; 0x32
    1486:	5f 14       	cp	r5, r15
    1488:	e5 0b       	sbc	r30, r21
    148a:	69 3d       	cpi	r22, 0xD9	; 217
    148c:	c2 41       	sbci	r28, 0x12	; 18
    148e:	9d da       	rcall	.-2758   	; 0x9ca <aes_init+0x9a>
    1490:	72 79       	andi	r23, 0x92	; 146
    1492:	24 e6       	ldi	r18, 0x64	; 100
    1494:	9a e8       	ldi	r25, 0x8A	; 138
    1496:	fa 40       	sbci	r31, 0x0A	; 10
    1498:	43 28       	or	r4, r3
    149a:	81 b4       	in	r8, 0x21	; 33
    149c:	d6 d7       	rcall	.+4012   	; 0x244a <m+0x24a>
    149e:	e1 17       	cp	r30, r17
    14a0:	51 d5       	rcall	.+2722   	; 0x1f44 <aes_sbox0+0xf44>
    14a2:	fd d0       	rcall	.+506    	; 0x169e <aes_sbox0+0x69e>
    14a4:	34 1e       	adc	r3, r20
    14a6:	ba e3       	ldi	r27, 0x3A	; 58
    14a8:	53 71       	andi	r21, 0x13	; 19
    14aa:	c5 1d       	adc	r28, r5
    14ac:	4a e7       	ldi	r20, 0x7A	; 122
    14ae:	08 ec       	ldi	r16, 0xC8	; 200
    14b0:	4d c4       	rjmp	.+2202   	; 0x1d4c <aes_sbox0+0xd4c>
    14b2:	a4 bd       	out	0x24, r26	; 36
    14b4:	c8 d2       	rcall	.+1424   	; 0x1a46 <aes_sbox0+0xa46>
    14b6:	85 35       	cpi	r24, 0x55	; 85
    14b8:	b5 db       	rcall	.-2198   	; 0xc24 <waitforstart+0xc>
    14ba:	42 c7       	rjmp	.+3716   	; 0x2340 <m+0x140>
    14bc:	83 74       	andi	r24, 0x43	; 67
    14be:	09 92       	st	Y+, r0
    14c0:	80 13       	cpse	r24, r16
    14c2:	dd 3c       	cpi	r29, 0xCD	; 205
    14c4:	d4 cc       	rjmp	.-1624   	; 0xe6e <gf256mul+0x152>
    14c6:	76 7e       	andi	r23, 0xE6	; 230
    14c8:	48 e4       	ldi	r20, 0x48	; 72
    14ca:	b2 1a       	sub	r11, r18
    14cc:	87 57       	subi	r24, 0x77	; 119
    14ce:	02 82       	std	Z+2, r0	; 0x02
    14d0:	b0 4f       	sbci	r27, 0xF0	; 240
    14d2:	50 91 4b 18 	lds	r21, 0x184B
    14d6:	cb 03       	fmulsu	r20, r19
    14d8:	61 22       	and	r6, r17
    14da:	fb 98       	cbi	0x1f, 3	; 31
    14dc:	2f 45       	sbci	r18, 0x5F	; 95
    14de:	01 38       	cpi	r16, 0x81	; 129
    14e0:	31 6b       	ori	r19, 0xB1	; 177
    14e2:	94 bb       	out	0x14, r25	; 20
    14e4:	f5 12       	cpse	r15, r21
    14e6:	89 d1       	rcall	.+786    	; 0x17fa <aes_sbox0+0x7fa>
    14e8:	b6 a8       	ldd	r11, Z+54	; 0x36
    14ea:	0a 30       	cpi	r16, 0x0A	; 10
    14ec:	54 f2       	brlt	.-108    	; 0x1482 <aes_sbox0+0x482>
    14ee:	26 39       	cpi	r18, 0x96	; 150
    14f0:	56 66       	ori	r21, 0x66	; 102
    14f2:	6e bc       	out	0x2e, r6	; 46
    14f4:	00 78       	andi	r16, 0x80	; 128
    14f6:	5a 15       	cp	r21, r10
    14f8:	3e f0       	brts	.+14     	; 0x1508 <aes_sbox0+0x508>
    14fa:	8f 9e       	mul	r8, r31
    14fc:	25 b8       	out	0x05, r2	; 5
    14fe:	c9 cd       	rjmp	.-1134   	; 0x1092 <aes_sbox0+0x92>
    1500:	2f 29       	or	r18, r15
    1502:	3d aa       	std	Y+53, r3	; 0x35
    1504:	0f ae       	std	Y+63, r0	; 0x3f
    1506:	db 5c       	subi	r29, 0xCB	; 203
    1508:	45 99       	sbic	0x08, 5	; 8
    150a:	d4 3e       	cpi	r29, 0xE4	; 228
    150c:	36 b4       	in	r3, 0x26	; 38
    150e:	65 88       	ldd	r6, Z+21	; 0x15
    1510:	4c 86       	std	Y+12, r4	; 0x0c
    1512:	4a e1       	ldi	r20, 0x1A	; 26
    1514:	37 5e       	subi	r19, 0xE7	; 231
    1516:	b3 d6       	rcall	.+3430   	; 0x227e <m+0x7e>
    1518:	7e 0b       	sbc	r23, r30
    151a:	3f c5       	rjmp	.+2686   	; 0x1f9a <aes_sbox0+0xf9a>
    151c:	6c e6       	ldi	r22, 0x6C	; 108
    151e:	49 7f       	andi	r20, 0xF9	; 249
    1520:	75 9a       	sbi	0x0e, 5	; 14
    1522:	96 b7       	in	r25, 0x36	; 54
    1524:	d9 d3       	rcall	.+1970   	; 0x1cd8 <aes_sbox0+0xcd8>
    1526:	bf 44       	sbci	r27, 0x4F	; 79
    1528:	f7 f8       	bld	r15, 7
    152a:	5d 90       	ld	r5, X+
    152c:	34 c6       	rjmp	.+3176   	; 0x2196 <pok+0x196>
    152e:	25 ea       	ldi	r18, 0xA5	; 165
    1530:	35 59       	subi	r19, 0x95	; 149
    1532:	fa cd       	rjmp	.-1036   	; 0x1128 <aes_sbox0+0x128>
    1534:	20 9c       	mul	r2, r0
    1536:	67 1a       	sub	r6, r23
    1538:	26 28       	or	r2, r6
    153a:	56 e0       	ldi	r21, 0x06	; 6
    153c:	b5 8a       	std	Z+21, r11	; 0x15
    153e:	cf 9e       	mul	r12, r31
    1540:	f9 c1       	rjmp	.+1010   	; 0x1934 <aes_sbox0+0x934>
    1542:	17 a5       	ldd	r17, Z+47	; 0x2f
    1544:	c8 b1       	in	r28, 0x08	; 8
    1546:	c7 ca       	rjmp	.-2674   	; 0xad6 <aes_cenc+0x2e>
    1548:	9f 3c       	cpi	r25, 0xCF	; 207
    154a:	22 95       	swap	r18
    154c:	af e7       	ldi	r26, 0x7F	; 127
    154e:	ac 18       	sub	r10, r12
    1550:	9b b2       	in	r9, 0x1b	; 27
    1552:	ce 13       	cpse	r28, r30
    1554:	55 64       	ori	r21, 0x45	; 69
    1556:	02 4e       	sbci	r16, 0xE2	; 226
    1558:	97 0e       	add	r9, r23
    155a:	0a a0       	ldd	r0, Y+34	; 0x22
    155c:	06 19       	sub	r16, r6
    155e:	12 1e       	adc	r1, r18
    1560:	8e 42       	sbci	r24, 0x2E	; 46
    1562:	d7 10       	cpse	r13, r7
    1564:	62 77       	andi	r22, 0x72	; 114
    1566:	e5 87       	std	Z+13, r30	; 0x0d
    1568:	7d f3       	brhs	.-34     	; 0x1548 <aes_sbox0+0x548>
    156a:	60 ff       	sbrs	r22, 0
    156c:	61 a2       	std	Z+33, r6	; 0x21
    156e:	46 a6       	std	Z+46, r4	; 0x2e
    1570:	14 bd       	out	0x24, r17	; 36
    1572:	54 70       	andi	r21, 0x04	; 4
    1574:	51 c0       	rjmp	.+162    	; 0x1618 <aes_sbox0+0x618>
    1576:	80 94       	com	r8
    1578:	53 5a       	subi	r21, 0xA3	; 163
    157a:	92 a9       	ldd	r25, Z+50	; 0x32
    157c:	d2 98       	cbi	0x1a, 2	; 26
    157e:	f6 43       	sbci	r31, 0x36	; 54
    1580:	e3 a4       	ldd	r14, Z+43	; 0x2b
    1582:	78 fb       	.word	0xfb78	; ????
    1584:	04 50       	subi	r16, 0x04	; 4
    1586:	32 dc       	rcall	.-1948   	; 0xdec <gf256mul+0xd0>
    1588:	2d 66       	ori	r18, 0x6D	; 109
    158a:	93 6b       	ori	r25, 0xB3	; 179
    158c:	15 5b       	subi	r17, 0xB5	; 181
    158e:	d0 03       	fmuls	r21, r16
    1590:	2e d8       	rcall	.-4004   	; 0x5ee <aes_shiftcol+0x52>
    1592:	ee ef       	ldi	r30, 0xFE	; 254
    1594:	8d b8       	out	0x0d, r8	; 13
    1596:	11 7a       	andi	r17, 0xA1	; 161
    1598:	79 c3       	rjmp	.+1778   	; 0x1c8c <aes_sbox0+0xc8c>
    159a:	d1 a3       	std	Z+33, r29	; 0x21
    159c:	df 1d       	adc	r29, r15
    159e:	40 4b       	sbci	r20, 0xB0	; 176
    15a0:	d5 31       	cpi	r29, 0x15	; 21
    15a2:	de 73       	andi	r29, 0x3E	; 62
    15a4:	24 fc       	sbrc	r2, 4
    15a6:	48 6a       	ori	r20, 0xA8	; 168
    15a8:	da 83       	std	Y+2, r29	; 0x02
    15aa:	27 0d       	add	r18, r7
    15ac:	e9 c4       	rjmp	.+2514   	; 0x1f80 <aes_sbox0+0xf80>
    15ae:	ec 68       	ori	r30, 0x8C	; 140
    15b0:	ab 30       	cpi	r26, 0x0B	; 11
    15b2:	4d ba       	out	0x1d, r4	; 29
    15b4:	fe 7b       	andi	r31, 0xBE	; 190
    15b6:	e2 8c       	ldd	r14, Z+26	; 0x1a
    15b8:	0c bc       	out	0x2c, r0	; 44
    15ba:	eb f1       	brvs	.+122    	; 0x1636 <aes_sbox0+0x636>
    15bc:	84 9d       	mul	r24, r4
    15be:	fd 74       	andi	r31, 0x4D	; 77
    15c0:	bb 3b       	cpi	r27, 0xBB	; 187
    15c2:	6e be       	out	0x3e, r6	; 62
    15c4:	23 8b       	std	Z+19, r18	; 0x13
    15c6:	dd 71       	andi	r29, 0x1D	; 29
    15c8:	47 4f       	sbci	r20, 0xF7	; 247
    15ca:	f5 ed       	ldi	r31, 0xD5	; 213
    15cc:	05 e4       	ldi	r16, 0x45	; 69
    15ce:	2a b9       	out	0x0a, r18	; 10
    15d0:	01 38       	cpi	r16, 0x81	; 129
    15d2:	7c 16       	cp	r7, r28
    15d4:	a1 c2       	rjmp	.+1346   	; 0x1b18 <aes_sbox0+0xb18>
    15d6:	1b 58       	subi	r17, 0x8B	; 139
    15d8:	3a f2       	brmi	.-114    	; 0x1568 <aes_sbox0+0x568>
    15da:	21 72       	andi	r18, 0x21	; 33
    15dc:	a8 69       	ori	r26, 0x98	; 152
    15de:	76 89       	ldd	r23, Z+22	; 0x16
    15e0:	00 1f       	adc	r16, r16
    15e2:	cb 6d       	ori	r28, 0xDB	; 219
    15e4:	09 33       	cpi	r16, 0x39	; 57
    15e6:	91 8f       	std	Z+25, r25	; 0x19
    15e8:	e8 b0       	in	r14, 0x08	; 8
    15ea:	2b cc       	rjmp	.-1962   	; 0xe42 <gf256mul+0x126>
    15ec:	82 ad       	ldd	r24, Z+58	; 0x3a
    15ee:	52 08       	sbc	r5, r2
    15f0:	f4 f0       	brlt	.+60     	; 0x162e <aes_sbox0+0x62e>
    15f2:	81 1c       	adc	r8, r1
    15f4:	a7 b6       	in	r10, 0x37	; 55
    15f6:	c9 07       	cpc	r28, r25
    15f8:	2c 63       	ori	r18, 0x3C	; 60
    15fa:	41 39       	cpi	r20, 0x91	; 145
    15fc:	85 57       	subi	r24, 0x75	; 117
    15fe:	5f 6f       	ori	r21, 0xFF	; 255
    1600:	27 29       	or	r18, r7
    1602:	ef 59       	subi	r30, 0x9F	; 159
    1604:	85 ba       	out	0x15, r8	; 21
    1606:	91 c0       	rjmp	.+290    	; 0x172a <aes_sbox0+0x72a>
    1608:	56 3a       	cpi	r21, 0xA6	; 166
    160a:	c2 f5       	brpl	.+112    	; 0x167c <aes_sbox0+0x67c>
    160c:	93 2f       	mov	r25, r19
    160e:	15 68       	ori	r17, 0x85	; 133
    1610:	f7 f8       	bld	r15, 7
    1612:	9f 52       	subi	r25, 0x2F	; 47
    1614:	c9 3b       	cpi	r28, 0xB9	; 185
    1616:	e5 2a       	or	r14, r21
    1618:	95 7a       	andi	r25, 0xA5	; 165
    161a:	b8 99       	sbic	0x17, 0	; 23
    161c:	dc d6       	rcall	.+3512   	; 0x23d6 <m+0x1d6>
    161e:	4b b0       	in	r4, 0x0b	; 11
    1620:	04 71       	andi	r16, 0x14	; 20
    1622:	ca 30       	cpi	r28, 0x0A	; 10
    1624:	e9 63       	ori	r30, 0x39	; 57
    1626:	70 46       	sbci	r23, 0x60	; 96
    1628:	89 43       	sbci	r24, 0x39	; 57
    162a:	ee 45       	sbci	r30, 0x5E	; 94
    162c:	51 38       	cpi	r21, 0x81	; 129
    162e:	d9 bc       	out	0x29, r13	; 41
    1630:	96 4a       	sbci	r25, 0xA6	; 166
    1632:	31 db       	rcall	.-2462   	; 0xc96 <sendbytet0+0x6>
    1634:	bb 39       	cpi	r27, 0x9B	; 155
    1636:	87 6a       	ori	r24, 0xA7	; 167
    1638:	26 20       	and	r2, r6
    163a:	a5 32       	cpi	r26, 0x25	; 37
    163c:	a1 00       	.word	0x00a1	; ????
    163e:	53 d4       	rcall	.+2214   	; 0x1ee6 <aes_sbox0+0xee6>
    1640:	55 5c       	subi	r21, 0xC5	; 197
    1642:	a6 9d       	mul	r26, r6
    1644:	97 dd       	rcall	.-1234   	; 0x1174 <aes_sbox0+0x174>
    1646:	4c f9       	.word	0xf94c	; ????
    1648:	b2 1b       	sub	r27, r18
    164a:	7f 5b       	subi	r23, 0xBF	; 191
    164c:	cf 5e       	subi	r28, 0xEF	; 239
    164e:	9b 8f       	std	Y+27, r25	; 0x1b
    1650:	fc 72       	andi	r31, 0x2C	; 44
    1652:	f0 6f       	ori	r31, 0xF0	; 240
    1654:	ad 6e       	ori	r26, 0xED	; 237
    1656:	a9 49       	sbci	r26, 0x99	; 153
    1658:	4d 81       	ldd	r20, Y+5	; 0x05
    165a:	1f d8       	rcall	.-4034   	; 0x69a <aes_encrypt_core+0x8c>
    165c:	78 6d       	ori	r23, 0xD8	; 216
    165e:	88 ea       	ldi	r24, 0xA8	; 168
    1660:	01 98       	cbi	0x00, 1	; 0
    1662:	af 05       	cpc	r26, r15
    1664:	16 09       	sbc	r17, r6
    1666:	11 1d       	adc	r17, r1
    1668:	bd 94 1c c1 	jmp	0x2f8238	; 0x2f8238 <__data_load_end+0x2f5052>
    166c:	6b 5a       	subi	r22, 0xAB	; 171
    166e:	41 0d       	add	r20, r1
    1670:	33 90       	.word	0x9033	; ????
    1672:	9a 2d       	mov	r25, r10
    1674:	e8 a0       	ldd	r14, Y+32	; 0x20
    1676:	17 a3       	std	Z+39, r17	; 0x27
    1678:	ce f6       	brtc	.-78     	; 0x162c <aes_sbox0+0x62c>
    167a:	aa 18       	sub	r10, r10
    167c:	be c7       	rjmp	.+3964   	; 0x25fa <m+0x3fa>
    167e:	c5 c8       	rjmp	.-3702   	; 0x80a <aes_encrypt_core+0x1fc>
    1680:	b3 03       	fmuls	r19, r19
    1682:	fe e4       	ldi	r31, 0x4E	; 78
    1684:	92 8b       	std	Z+18, r25	; 0x12
    1686:	7b f2       	brvs	.-98     	; 0x1626 <aes_sbox0+0x626>
    1688:	3f a4       	ldd	r3, Y+47	; 0x2f
    168a:	b5 42       	sbci	r27, 0x25	; 37
    168c:	74 f1       	brlt	.+92     	; 0x16ea <aes_sbox0+0x6ea>
    168e:	83 ed       	ldi	r24, 0xD3	; 211
    1690:	8c d5       	rcall	.+2840   	; 0x21aa <pok+0x1aa>
    1692:	02 28       	or	r0, r2
    1694:	cb e6       	ldi	r28, 0x6B	; 107
    1696:	67 e3       	ldi	r22, 0x37	; 55
    1698:	3e da       	rcall	.-2948   	; 0xb16 <aes_cenc+0x6e>
    169a:	7c d1       	rcall	.+760    	; 0x1994 <aes_sbox0+0x994>
    169c:	f3 2b       	or	r31, r19
    169e:	65 47       	sbci	r22, 0x75	; 117
    16a0:	cc 76       	andi	r28, 0x6C	; 108
    16a2:	ac de       	rcall	.-680    	; 0x13fc <aes_sbox0+0x3fc>
    16a4:	12 d0       	rcall	.+36     	; 0x16ca <aes_sbox0+0x6ca>
    16a6:	44 4f       	sbci	r20, 0xF4	; 244
    16a8:	d7 21       	and	r29, r7
    16aa:	e0 e1       	ldi	r30, 0x10	; 16
    16ac:	b7 82       	std	Z+7, r11	; 0x07
    16ae:	75 1e       	adc	r7, r21
    16b0:	69 22       	and	r6, r25
    16b2:	64 9c       	mul	r6, r4
    16b4:	54 1a       	sub	r5, r20
    16b6:	0c df       	rcall	.-488    	; 0x14d0 <aes_sbox0+0x4d0>
    16b8:	ab ec       	ldi	r26, 0xCB	; 203
    16ba:	f4 77       	andi	r31, 0x74	; 116
    16bc:	5f 0b       	sbc	r21, r31
    16be:	d3 3d       	cpi	r29, 0xD3	; 211
    16c0:	6c 23       	and	r22, r28
    16c2:	36 4e       	sbci	r19, 0xE6	; 230
    16c4:	58 8a       	std	Y+16, r5	; 0x10
    16c6:	60 50       	subi	r22, 0x00	; 0
    16c8:	ff fb       	.word	0xfbff	; ????
    16ca:	13 8e       	std	Z+27, r1	; 0x1b
    16cc:	b9 a8       	ldd	r11, Y+49	; 0x31
    16ce:	08 c6       	rjmp	.+3088   	; 0x22e0 <m+0xe0>
    16d0:	bf e7       	ldi	r27, 0x7F	; 127
    16d2:	c3 24       	eor	r12, r3
    16d4:	a2 8d       	ldd	r26, Z+26	; 0x1a
    16d6:	07 5d       	subi	r16, 0xD7	; 215
    16d8:	10 0f       	add	r17, r16
    16da:	62 c4       	rjmp	.+2244   	; 0x1fa0 <aes_sbox0+0xfa0>
    16dc:	3c 06       	cpc	r3, r28
    16de:	80 9e       	mul	r8, r16
    16e0:	fd 35       	cpi	r31, 0x5D	; 93
    16e2:	7d 2e       	mov	r7, r29
    16e4:	66 a7       	std	Z+46, r22	; 0x2e
    16e6:	86 79       	andi	r24, 0x96	; 150
    16e8:	37 0e       	add	r3, r23
    16ea:	19 73       	andi	r17, 0x39	; 57
    16ec:	cd ae       	std	Y+61, r12	; 0x3d
    16ee:	57 14       	cp	r5, r7
    16f0:	40 48       	sbci	r20, 0x80	; 128
    16f2:	e2 fa       	bst	r14, 2
    16f4:	eb 0a       	sbc	r14, r27
    16f6:	b6 25       	eor	r27, r6
    16f8:	34 b4       	in	r3, 0x24	; 36
    16fa:	b1 61       	ori	r27, 0x11	; 17
    16fc:	84 2c       	mov	r8, r4
    16fe:	7e d2       	rcall	.+1276   	; 0x1bfc <aes_sbox0+0xbfc>
    1700:	97 ea       	ldi	r25, 0xA7	; 167
    1702:	d0 6c       	ori	r29, 0xC0	; 192
    1704:	0a 3d       	cpi	r16, 0xDA	; 218
    1706:	c5 a9       	ldd	r28, Z+53	; 0x35
    1708:	3f 6e       	ori	r19, 0xEF	; 239
    170a:	45 7a       	andi	r20, 0xA5	; 165
    170c:	a6 10       	cpse	r10, r6
    170e:	d6 d8       	rcall	.-3668   	; 0x8bc <aes_encrypt_core+0x2ae>
    1710:	4f b4       	in	r4, 0x2f	; 47
    1712:	29 23       	and	r18, r25
    1714:	66 47       	sbci	r22, 0x76	; 118
    1716:	85 6a       	ori	r24, 0xA5	; 165
    1718:	d5 1a       	sub	r13, r21
    171a:	c4 36       	cpi	r28, 0x64	; 100
    171c:	ad 60       	ori	r26, 0x0D	; 13
    171e:	07 08       	sbc	r0, r7
    1720:	43 26       	eor	r4, r19
    1722:	c7 ae       	std	Z+63, r12	; 0x3f
    1724:	ba 11       	cpse	r27, r10
    1726:	bc 76       	andi	r27, 0x6C	; 108
    1728:	b9 8f       	std	Y+25, r27	; 0x19
    172a:	9c 16       	cp	r9, r28
    172c:	cf 35       	cpi	r28, 0x5F	; 95
    172e:	8e fb       	.word	0xfb8e	; ????
    1730:	2b ac       	ldd	r2, Y+59	; 0x3b
    1732:	ff 5e       	subi	r31, 0xEF	; 239
    1734:	cd 5a       	subi	r28, 0xAD	; 173
    1736:	df d9       	rcall	.-3138   	; 0xaf6 <aes_cenc+0x4e>
    1738:	95 78       	andi	r25, 0x85	; 133
    173a:	c6 44       	sbci	r28, 0x46	; 70
    173c:	24 ce       	rjmp	.-952    	; 0x1386 <aes_sbox0+0x386>
    173e:	b5 69       	ori	r27, 0x95	; 149
    1740:	70 64       	ori	r23, 0x40	; 64
    1742:	a1 30       	cpi	r26, 0x01	; 1
    1744:	a4 80       	ldd	r10, Z+4	; 0x04
    1746:	e4 4d       	sbci	r30, 0xD4	; 212
    1748:	06 b3       	in	r16, 0x16	; 22
    174a:	22 68       	ori	r18, 0x82	; 130
    174c:	62 59       	subi	r22, 0x92	; 146
    174e:	a3 aa       	std	Z+51, r10	; 0x33
    1750:	15 77       	andi	r17, 0x75	; 117
    1752:	92 87       	std	Z+10, r25	; 0x0a
    1754:	27 e0       	ldi	r18, 0x07	; 7
    1756:	7e b2       	in	r7, 0x1e	; 30
    1758:	b6 56       	subi	r27, 0x66	; 102
    175a:	91 52       	subi	r25, 0x21	; 33
    175c:	90 0f       	add	r25, r16
    175e:	8d 03       	fmulsu	r16, r21
    1760:	f2 be       	out	0x32, r15	; 50
    1762:	a5 94       	asr	r10
    1764:	3e e3       	ldi	r19, 0x3E	; 62
    1766:	6b 42       	sbci	r22, 0x2B	; 43
    1768:	e2 ee       	ldi	r30, 0xE2	; 226
    176a:	f6 e9       	ldi	r31, 0x96	; 150
    176c:	fa 50       	subi	r31, 0x0A	; 10
    176e:	67 fe       	sbrs	r6, 7
    1770:	37 3a       	cpi	r19, 0xA7	; 167
    1772:	38 41       	sbci	r19, 0x18	; 24
    1774:	e7 55       	subi	r30, 0x57	; 87
    1776:	09 31       	cpi	r16, 0x19	; 25
    1778:	5c e8       	ldi	r21, 0x8C	; 140
    177a:	5f 17       	cp	r21, r31
    177c:	d2 65       	ori	r29, 0x52	; 82
    177e:	6f cc       	rjmp	.-1826   	; 0x105e <aes_sbox0+0x5e>
    1780:	12 7c       	andi	r17, 0xC2	; 194
    1782:	0e 8b       	std	Y+22, r16	; 0x16
    1784:	bd 4a       	sbci	r27, 0xAD	; 173
    1786:	5b c0       	rjmp	.+182    	; 0x183e <aes_sbox0+0x83e>
    1788:	0d 84       	ldd	r0, Y+13	; 0x0d
    178a:	74 6d       	ori	r23, 0xD4	; 212
    178c:	1b 01       	movw	r2, r22
    178e:	fc 4c       	sbci	r31, 0xCC	; 204
    1790:	b8 9a       	sbi	0x17, 0	; 23
    1792:	d4 0c       	add	r13, r4
    1794:	2e 83       	std	Y+6, r18	; 0x06
    1796:	25 c1       	rjmp	.+586    	; 0x19e2 <aes_sbox0+0x9e2>
    1798:	1c 98       	cbi	0x03, 4	; 3
    179a:	19 34       	cpi	r17, 0x49	; 73
    179c:	d7 fd       	sbrc	r29, 7
    179e:	2a 73       	andi	r18, 0x3A	; 58
    17a0:	e1 8a       	std	Z+17, r14	; 0x11
    17a2:	7d 48       	sbci	r23, 0x8D	; 141
    17a4:	1e 1f       	adc	r17, r30
    17a6:	de 28       	or	r13, r14
    17a8:	b0 bb       	out	0x10, r27	; 16
    17aa:	2f ed       	ldi	r18, 0xDF	; 223
    17ac:	21 53       	subi	r18, 0x31	; 49
    17ae:	89 33       	cpi	r24, 0x39	; 57
    17b0:	c2 2c       	mov	r12, r2
    17b2:	f4 a0       	ldd	r15, Z+36	; 0x24
    17b4:	88 0b       	sbc	r24, r24
    17b6:	13 54       	subi	r17, 0x43	; 67
    17b8:	20 f3       	brcs	.-56     	; 0x1782 <aes_sbox0+0x782>
    17ba:	e5 ab       	std	Z+53, r30	; 0x35
    17bc:	63 9b       	sbis	0x0c, 3	; 12
    17be:	dd 96       	adiw	r26, 0x3d	; 61
    17c0:	39 f7       	brne	.-50     	; 0x1790 <aes_sbox0+0x790>
    17c2:	57 46       	sbci	r21, 0x67	; 103
    17c4:	71 ec       	ldi	r23, 0xC1	; 193
    17c6:	04 00       	.word	0x0004	; ????
    17c8:	af 9f       	mul	r26, r31
    17ca:	75 a7       	std	Z+45, r23	; 0x2d
    17cc:	b1 c9       	rjmp	.-3230   	; 0xb30 <log_init+0xa>
    17ce:	dc 93       	st	X, r29
    17d0:	61 7f       	andi	r22, 0xF1	; 241
    17d2:	f9 c3       	rjmp	.+2034   	; 0x1fc6 <aes_sbox0+0xfc6>
    17d4:	3b 9d       	mul	r19, r11
    17d6:	f0 ef       	ldi	r31, 0xF0	; 240
    17d8:	a2 f8       	bld	r10, 2
    17da:	72 5d       	subi	r23, 0xD2	; 210
    17dc:	db 3c       	cpi	r29, 0xCB	; 203
    17de:	18 40       	sbci	r17, 0x08	; 8
    17e0:	eb a8       	ldd	r14, Y+51	; 0x33
    17e2:	51 32       	cpi	r21, 0x21	; 33
    17e4:	8c e6       	ldi	r24, 0x6C	; 108
    17e6:	f1 c8       	rjmp	.-3614   	; 0x9ca <aes_init+0x9a>
    17e8:	86 79       	andi	r24, 0x96	; 150
    17ea:	58 99       	sbic	0x0b, 0	; 11
    17ec:	d1 82       	std	Z+1, r13	; 0x01
    17ee:	ca 02       	muls	r28, r26
    17f0:	2d 81       	ldd	r18, Y+5	; 0x05
    17f2:	d3 7b       	andi	r29, 0xB3	; 179
    17f4:	9e 4e       	sbci	r25, 0xEE	; 238
    17f6:	4b cb       	rjmp	.-2410   	; 0xe8e <gf256mul+0x172>
    17f8:	da 49       	sbci	r29, 0x9A	; 154
    17fa:	f5 14       	cp	r15, r5
    17fc:	05 1d       	adc	r16, r5
    17fe:	b7 bf       	out	0x37, r27	; 55
    1800:	b0 b8       	out	0x00, r11	; 0
    1802:	12 0a       	sbc	r1, r18
    1804:	1b fa       	.word	0xfa1b	; ????
    1806:	46 d5       	rcall	.+2700   	; 0x2294 <m+0x94>
    1808:	c4 44       	sbci	r28, 0x44	; 68
    180a:	41 91       	ld	r20, Z+
    180c:	74 dc       	rcall	.-1816   	; 0x10f6 <aes_sbox0+0xf6>
    180e:	8e 22       	and	r8, r30
    1810:	0d c5       	rjmp	.+2586   	; 0x222c <m+0x2c>
    1812:	8d de       	rcall	.-742    	; 0x152e <aes_sbox0+0x52e>
    1814:	96 57       	subi	r25, 0x76	; 118
    1816:	76 89       	ldd	r23, Z+22	; 0x16
    1818:	c7 fe       	sbrs	r12, 7
    181a:	e9 83       	std	Y+1, r30	; 0x01
    181c:	3d 5e       	subi	r19, 0xED	; 237
    181e:	a7 e4       	ldi	r26, 0x47	; 71
    1820:	4f 17       	cp	r20, r31
    1822:	33 d4       	rcall	.+2150   	; 0x208a <pok+0x8a>
    1824:	52 7d       	andi	r21, 0xD2	; 210
    1826:	f7 ad       	ldd	r31, Z+63	; 0x3f
    1828:	e0 ff       	sbrs	r30, 0
    182a:	92 34       	cpi	r25, 0x42	; 66
    182c:	cc f6       	brge	.-78     	; 0x17e0 <aes_sbox0+0x7e0>
    182e:	70 6e       	ori	r23, 0xE0	; 224
    1830:	9c d3       	rcall	.+1848   	; 0x1f6a <aes_sbox0+0xf6a>
    1832:	c6 be       	out	0x36, r12	; 54
    1834:	a8 7a       	andi	r26, 0xA8	; 168
    1836:	90 a0       	ldd	r9, Z+32	; 0x20
    1838:	0f 0b       	sbc	r16, r31
    183a:	e3 7e       	andi	r30, 0xE3	; 227
    183c:	49 58       	subi	r20, 0x89	; 137
    183e:	f8 36       	cpi	r31, 0x68	; 104
    1840:	99 d2       	rcall	.+1330   	; 0x1d74 <aes_sbox0+0xd74>
    1842:	94 6c       	ori	r25, 0xC4	; 196
    1844:	a4 ea       	ldi	r26, 0xA4	; 164
    1846:	fc 2f       	mov	r31, r28
    1848:	5b 1c       	adc	r5, r11
    184a:	04 87       	std	Z+12, r16	; 0x0c
    184c:	af fb       	.word	0xfbaf	; ????
    184e:	23 cd       	rjmp	.-1466   	; 0x1296 <aes_sbox0+0x296>
    1850:	3c 86       	std	Y+12, r3	; 0x0c
    1852:	5c 2e       	mov	r5, r28
    1854:	e2 20       	and	r14, r2
    1856:	b4 bf       	out	0x34, r27	; 52
    1858:	27 d1       	rcall	.+590    	; 0x1aa8 <aes_sbox0+0xaa8>
    185a:	10 11       	cpse	r17, r0
    185c:	47 72       	andi	r20, 0x27	; 39
    185e:	85 ee       	ldi	r24, 0xE5	; 229
    1860:	7c 25       	eor	r23, r12
    1862:	f2 d8       	rcall	.-3612   	; 0xa48 <aes_init+0x118>
    1864:	3b 16       	cp	r3, r27
    1866:	97 13       	cpse	r25, r23
    1868:	ce 2a       	or	r12, r30
    186a:	8c 21       	and	r24, r12
    186c:	03 db       	rcall	.-2554   	; 0xe74 <gf256mul+0x158>
    186e:	95 b7       	in	r25, 0x35	; 53
    1870:	43 f3       	brvs	.-48     	; 0x1842 <aes_sbox0+0x842>
    1872:	0e 14       	cp	r0, r14
    1874:	62 7b       	andi	r22, 0xB2	; 178
    1876:	8b 02       	muls	r24, r27
    1878:	cf 54       	subi	r28, 0x4F	; 79
    187a:	45 b2       	in	r4, 0x15	; 21
    187c:	84 01       	movw	r16, r8
    187e:	73 1d       	adc	r23, r3
    1880:	c3 60       	ori	r28, 0x03	; 3
    1882:	6a dd       	rcall	.-1324   	; 0x1358 <aes_sbox0+0x358>
    1884:	18 50       	subi	r17, 0x08	; 8
    1886:	e7 53       	subi	r30, 0x37	; 55
    1888:	3e 06       	cpc	r3, r30
    188a:	5a e8       	ldi	r21, 0x8A	; 138
    188c:	4e 37       	cpi	r20, 0x7E	; 126
    188e:	35 38       	cpi	r19, 0x85	; 133
    1890:	f1 68       	ori	r31, 0x81	; 129
    1892:	5f f5       	brid	.+86     	; 0x18ea <aes_sbox0+0x8ea>
    1894:	e6 f9       	bld	r30, 6
    1896:	e1 ed       	ldi	r30, 0xD1	; 209
    1898:	4d 64       	ori	r20, 0x4D	; 77
    189a:	ec 31       	cpi	r30, 0x1C	; 28
    189c:	9b aa       	std	Y+51, r9	; 0x33
    189e:	b1 fd       	sbrc	r27, 1
    18a0:	0c 82       	std	Y+4, r0	; 0x04
    18a2:	00 9f       	mul	r16, r16
    18a4:	5d 9e       	mul	r5, r29
    18a6:	59 b9       	out	0x09, r21	; 9
    18a8:	bd 71       	andi	r27, 0x1D	; 29
    18aa:	ef 28       	or	r14, r15
    18ac:	88 9d       	mul	r24, r8
    18ae:	78 1a       	sub	r7, r24
    18b0:	a5 ac       	ldd	r10, Z+61	; 0x3d
    18b2:	56 6d       	ori	r21, 0xD6	; 214
    18b4:	67 2d       	mov	r22, r7
    18b6:	bc 09       	sbc	r27, r12
    18b8:	42 eb       	ldi	r20, 0xB2	; 178
    18ba:	8f ab       	std	Y+55, r24	; 0x37
    18bc:	3f ae       	std	Y+63, r3	; 0x3f
    18be:	6b 7f       	andi	r22, 0xFB	; 251
    18c0:	66 ba       	out	0x16, r6	; 22
    18c2:	c1 2b       	or	r28, r17
    18c4:	4b c9       	rjmp	.-3434   	; 0xb5c <log_add+0x16>
    18c6:	77 9a       	sbi	0x0e, 7	; 14
    18c8:	d6 d0       	rcall	.+428    	; 0x1a76 <aes_sbox0+0xa76>
    18ca:	55 c2       	rjmp	.+1194   	; 0x1d76 <aes_sbox0+0xd76>
    18cc:	51 f0       	breq	.+20     	; 0x18e2 <aes_sbox0+0x8e2>
    18ce:	a3 24       	eor	r10, r3
    18d0:	f4 81       	ldd	r31, Z+4	; 0x04
    18d2:	3a c0       	rjmp	.+116    	; 0x1948 <aes_sbox0+0x948>
    18d4:	19 93       	st	Y+, r17
    18d6:	80 b6       	in	r8, 0x30	; 48
    18d8:	79 b3       	in	r23, 0x19	; 25
    18da:	1e b5       	in	r17, 0x2e	; 46
    18dc:	a1 c8       	rjmp	.-3774   	; 0xa20 <aes_init+0xf0>
    18de:	29 4c       	sbci	r18, 0xC9	; 201
    18e0:	07 08       	sbc	r0, r7
    18e2:	6f a2       	std	Y+39, r6	; 0x27
    18e4:	39 cb       	rjmp	.-2446   	; 0xf58 <gf256mul+0x23c>
    18e6:	15 da       	rcall	.-3030   	; 0xd12 <trig0+0x2>
    18e8:	65 8a       	std	Z+21, r6	; 0x15
    18ea:	48 69       	ori	r20, 0x98	; 152
    18ec:	2c 26       	eor	r2, r28
    18ee:	bb 40       	sbci	r27, 0x0B	; 11
    18f0:	d7 d9       	rcall	.-3154   	; 0xca0 <sendbytet0+0x10>
    18f2:	1f a9       	ldd	r17, Y+55	; 0x37
    18f4:	75 4a       	sbci	r23, 0xA5	; 165
    18f6:	61 30       	cpi	r22, 0x01	; 1
    18f8:	a6 ca       	rjmp	.-2740   	; 0xe46 <gf256mul+0x12a>
    18fa:	32 05       	cpc	r19, r2
    18fc:	63 df       	rcall	.-314    	; 0x17c4 <aes_sbox0+0x7c4>
    18fe:	e5 98       	cbi	0x1c, 5	; 28
    1900:	1b b7       	in	r17, 0x3b	; 59
    1902:	e5 4d       	sbci	r30, 0xD5	; 213
    1904:	a8 78       	andi	r26, 0x88	; 136
    1906:	7d fd       	.word	0xfd7d	; ????
    1908:	ec 7f       	andi	r30, 0xFC	; 252
    190a:	c3 22       	and	r12, r19
    190c:	33 2b       	or	r19, r19
    190e:	81 89       	ldd	r24, Z+17	; 0x11
    1910:	dd 9e       	mul	r13, r29
    1912:	67 04       	cpc	r6, r7
    1914:	ba d0       	rcall	.+372    	; 0x1a8a <aes_sbox0+0xa8a>
    1916:	c7 fe       	sbrs	r12, 7
    1918:	b0 4f       	sbci	r27, 0xF0	; 240
    191a:	6e af       	std	Y+62, r22	; 0x3e
    191c:	e7 b4       	in	r14, 0x27	; 39
    191e:	fc 34       	cpi	r31, 0x4C	; 76
    1920:	57 49       	sbci	r21, 0x97	; 151
    1922:	cf f5       	brid	.+114    	; 0x1996 <aes_sbox0+0x996>
    1924:	0d ab       	std	Y+53, r16	; 0x35
    1926:	c6 d9       	rcall	.-3188   	; 0xcb4 <snextbit>
    1928:	94 ce       	rjmp	.-728    	; 0x1652 <aes_sbox0+0x652>
    192a:	44 6b       	ori	r20, 0xB4	; 180
    192c:	ed 0a       	sbc	r14, r29
    192e:	2e 76       	andi	r18, 0x6E	; 110
    1930:	0f c1       	rjmp	.+542    	; 0x1b50 <aes_sbox0+0xb50>
    1932:	61 70       	andi	r22, 0x01	; 1
    1934:	47 da       	rcall	.-2930   	; 0xdc4 <gf256mul+0xa8>
    1936:	32 36       	cpi	r19, 0x62	; 98
    1938:	99 a9       	ldd	r25, Y+49	; 0x31
    193a:	43 91       	.word	0x9143	; ????
    193c:	87 ff       	sbrs	r24, 7
    193e:	ea a5       	ldd	r30, Y+42	; 0x2a
    1940:	f4 1a       	sub	r15, r20
    1942:	c2 96       	adiw	r24, 0x32	; 50
    1944:	be 3d       	cpi	r27, 0xDE	; 222
    1946:	25 62       	ori	r18, 0x25	; 37
    1948:	16 c5       	rjmp	.+2604   	; 0x2376 <m+0x176>
    194a:	d3 9d       	mul	r29, r3
    194c:	55 ad       	ldd	r21, Z+61	; 0x3d
    194e:	eb a0       	ldd	r14, Y+35	; 0x23
    1950:	d7 bc       	out	0x27, r13	; 39
    1952:	4b 7e       	andi	r20, 0xEB	; 235
    1954:	28 29       	or	r18, r8
    1956:	e8 1e       	adc	r14, r24
    1958:	86 8d       	ldd	r24, Z+30	; 0x1e
    195a:	19 db       	rcall	.-2510   	; 0xf8e <gf256mul+0x272>
    195c:	17 65       	ori	r17, 0x57	; 87
    195e:	bf 05       	cpc	r27, r15
    1960:	8e ac       	ldd	r8, Y+62	; 0x3e
    1962:	e2 3a       	cpi	r30, 0xA2	; 162
    1964:	18 b5       	in	r17, 0x28	; 40
    1966:	13 f7       	brvc	.-60     	; 0x192c <aes_sbox0+0x92c>
    1968:	2a ae       	std	Y+58, r2	; 0x3a
    196a:	2f 02       	muls	r18, r31
    196c:	e1 cb       	rjmp	.-2110   	; 0x1130 <aes_sbox0+0x130>
    196e:	1c 45       	sbci	r17, 0x5C	; 92
    1970:	24 4a       	sbci	r18, 0xA4	; 164
    1972:	38 bd       	out	0x28, r19	; 40
    1974:	8b 7c       	andi	r24, 0xCB	; 203
    1976:	6d f6       	brhc	.-102    	; 0x1912 <aes_sbox0+0x912>
    1978:	3b b2       	in	r3, 0x1b	; 27
    197a:	42 5b       	subi	r20, 0xB2	; 178
    197c:	2d 37       	cpi	r18, 0x7D	; 125
    197e:	ca 7a       	andi	r28, 0xAA	; 170
    1980:	01 0c       	add	r0, r1
    1982:	0e 77       	andi	r16, 0x7E	; 126
    1984:	d1 63       	ori	r29, 0x31	; 49
    1986:	3f 07       	cpc	r19, r31
    1988:	6a de       	rcall	.-812    	; 0x165e <aes_sbox0+0x65e>
    198a:	69 21       	and	r22, r9
    198c:	e4 53       	subi	r30, 0x34	; 52
    198e:	59 fa       	.word	0xfa59	; ????
    1990:	c4 88       	ldd	r12, Z+20	; 0x14
    1992:	93 a2       	std	Z+35, r9	; 0x23
    1994:	08 d5       	rcall	.+2576   	; 0x23a6 <m+0x1a6>
    1996:	5d 74       	andi	r21, 0x4D	; 77
    1998:	d4 d8       	rcall	.-3672   	; 0xb42 <log_init+0x1c>
    199a:	c0 df       	rcall	.-128    	; 0x191c <aes_sbox0+0x91c>
    199c:	cc 66       	ori	r28, 0x6C	; 108
    199e:	51 c8       	rjmp	.-3934   	; 0xa42 <aes_init+0x112>
    19a0:	23 41       	sbci	r18, 0x13	; 19
    19a2:	a4 b1       	in	r26, 0x04	; 4
    19a4:	11 d6       	rcall	.+3106   	; 0x25c8 <m+0x3c8>
    19a6:	48 84       	ldd	r4, Y+8	; 0x08
    19a8:	80 60       	ori	r24, 0x00	; 0
    19aa:	a7 64       	ori	r26, 0x47	; 71
    19ac:	a6 39       	cpi	r26, 0x96	; 150
    19ae:	bb 35       	cpi	r27, 0x5B	; 91
    19b0:	46 52       	subi	r20, 0x26	; 38
    19b2:	97 06       	cpc	r9, r23
    19b4:	92 b6       	in	r9, 0x32	; 50
    19b6:	d2 7b       	andi	r29, 0xB2	; 178
    19b8:	30 85       	ldd	r19, Z+8	; 0x08
    19ba:	14 5e       	subi	r17, 0xE4	; 228
    19bc:	54 6f       	ori	r21, 0xF4	; 244
    19be:	95 9c       	mul	r9, r5
    19c0:	1d 9a       	sbi	0x03, 5	; 3
    19c2:	c9 68       	ori	r28, 0x89	; 137
    19c4:	fb 6c       	ori	r31, 0xCB	; 203
    19c6:	e9 ef       	ldi	r30, 0xF9	; 249
    19c8:	a3 4e       	sbci	r26, 0xE3	; 227
    19ca:	f0 72       	andi	r31, 0x20	; 32
    19cc:	12 f8       	bld	r1, 2
    19ce:	83 5f       	subi	r24, 0xF3	; 243
    19d0:	75 10       	cpse	r7, r5
    19d2:	f1 98       	cbi	0x1e, 1	; 30
    19d4:	8c 27       	eor	r24, r28
    19d6:	8a 40       	sbci	r24, 0x0A	; 10
    19d8:	8f b9       	out	0x0f, r24	; 15
    19da:	aa 20       	and	r10, r10
    19dc:	f9 03       	fmulsu	r23, r17
    19de:	b8 cd       	rjmp	.-1168   	; 0x1550 <aes_sbox0+0x550>
    19e0:	79 82       	std	Y+1, r7	; 0x01
    19e2:	1f 15       	cp	r17, r15
    19e4:	50 71       	andi	r21, 0x10	; 16
    19e6:	b3 5c       	subi	r27, 0xC3	; 195
    19e8:	e3 2c       	mov	r14, r3
    19ea:	f2 00       	.word	0x00f2	; ????
    19ec:	9b 56       	subi	r25, 0x6B	; 107
    19ee:	31 3e       	cpi	r19, 0xE1	; 225
    19f0:	a1 dc       	rcall	.-1726   	; 0x1334 <aes_sbox0+0x334>
    19f2:	e6 5a       	subi	r30, 0xA6	; 166
    19f4:	3c 0b       	sbc	r19, r28
    19f6:	f3 9f       	mul	r31, r19
    19f8:	09 58       	subi	r16, 0x89	; 137
    19fa:	73 4c       	sbci	r23, 0xC3	; 195
    19fc:	90 26       	eor	r9, r16
    19fe:	e0 ee       	ldi	r30, 0xE0	; 224
    1a00:	a6 96       	adiw	r28, 0x26	; 38
    1a02:	9e 4c       	sbci	r25, 0xCE	; 206
    1a04:	f0 88       	ldd	r15, Z+16	; 0x10
    1a06:	aa e5       	ldi	r26, 0x5A	; 90
    1a08:	ce 00       	.word	0x00ce	; ????
    1a0a:	7f 6e       	ori	r23, 0xEF	; 239
    1a0c:	d5 48       	sbci	r29, 0x85	; 133
    1a0e:	39 3d       	cpi	r19, 0xD9	; 217
    1a10:	c1 9b       	sbis	0x18, 1	; 24
    1a12:	64 4b       	sbci	r22, 0xB4	; 180
    1a14:	05 e2       	ldi	r16, 0x25	; 37
    1a16:	79 21       	and	r23, r9
    1a18:	46 58       	subi	r20, 0x86	; 134
    1a1a:	fa c0       	rjmp	.+500    	; 0x1c10 <aes_sbox0+0xc10>
    1a1c:	a4 02       	muls	r26, r20
    1a1e:	d6 c9       	rjmp	.-3156   	; 0xdcc <gf256mul+0xb0>
    1a20:	40 bf       	out	0x30, r20	; 48
    1a22:	a0 61       	ori	r26, 0x10	; 16
    1a24:	bb e8       	ldi	r27, 0x8B	; 139
    1a26:	3b f3       	brvs	.-50     	; 0x19f6 <aes_sbox0+0x9f6>
    1a28:	91 d2       	rcall	.+1314   	; 0x1f4c <aes_sbox0+0xf4c>
    1a2a:	0b 68       	ori	r16, 0x8B	; 139
    1a2c:	df b5       	in	r29, 0x2f	; 47
    1a2e:	f1 c8       	rjmp	.-3614   	; 0xc12 <recbytet0+0xc>
    1a30:	70 e3       	ldi	r23, 0x30	; 48
    1a32:	2d cc       	rjmp	.-1958   	; 0x128e <aes_sbox0+0x28e>
    1a34:	24 3c       	cpi	r18, 0xC4	; 196
    1a36:	86 8e       	std	Z+30, r8	; 0x1e
    1a38:	b8 14       	cp	r11, r8
    1a3a:	42 ea       	ldi	r20, 0xA2	; 162
    1a3c:	77 a7       	std	Z+47, r23	; 0x2f
    1a3e:	f2 72       	andi	r31, 0x22	; 34
    1a40:	bd 34       	cpi	r27, 0x4D	; 77
    1a42:	54 4d       	sbci	r21, 0xD4	; 212
    1a44:	38 22       	and	r3, r24
    1a46:	75 c5       	rjmp	.+2794   	; 0x2532 <m+0x332>
    1a48:	45 2b       	or	r20, r21
    1a4a:	b2 37       	cpi	r27, 0x72	; 114
    1a4c:	73 84       	ldd	r7, Z+11	; 0x0b
    1a4e:	f9 62       	ori	r31, 0x29	; 41
    1a50:	a1 25       	eor	r26, r1
    1a52:	0d 20       	and	r0, r13
    1a54:	c4 ee       	ldi	r28, 0xE4	; 228
    1a56:	4a 13       	cpse	r20, r26
    1a58:	a3 81       	ldd	r26, Z+3	; 0x03
    1a5a:	35 ed       	ldi	r19, 0xD5	; 213
    1a5c:	ba 17       	cp	r27, r26
    1a5e:	f8 1c       	adc	r15, r8
    1a60:	82 89       	ldd	r24, Z+18	; 0x12
    1a62:	d4 16       	cp	r13, r20
    1a64:	6a 18       	sub	r6, r10
    1a66:	0a b0       	in	r0, 0x0a	; 10
    1a68:	b3 d8       	rcall	.-3738   	; 0xbd0 <log_add+0x8a>
    1a6a:	71 44       	sbci	r23, 0x41	; 65
    1a6c:	26 27       	eor	r18, r22
    1a6e:	11 e7       	ldi	r17, 0x71	; 113
    1a70:	ca 19       	sub	r28, r10
    1a72:	92 dc       	rcall	.-1756   	; 0x1398 <aes_sbox0+0x398>
    1a74:	a2 5a       	subi	r26, 0xA2	; 162
    1a76:	af e4       	ldi	r26, 0x4F	; 79
    1a78:	15 fb       	bst	r17, 5
    1a7a:	99 cd       	rjmp	.-1230   	; 0x15ae <aes_sbox0+0x5ae>
    1a7c:	32 b1       	in	r19, 0x02	; 2
    1a7e:	6d 2a       	or	r6, r29
    1a80:	8a 3f       	cpi	r24, 0xFA	; 250
    1a82:	51 1b       	sub	r21, r17
    1a84:	60 5b       	subi	r22, 0xB0	; 176
    1a86:	93 9a       	sbi	0x12, 3	; 18
    1a88:	5d 49       	sbci	r21, 0x9D	; 157
    1a8a:	09 98       	cbi	0x01, 1	; 1
    1a8c:	b9 9d       	mul	r27, r9
    1a8e:	74 dd       	rcall	.-1304   	; 0x1578 <aes_sbox0+0x578>
    1a90:	6f 8f       	std	Y+31, r22	; 0x1f
    1a92:	6b a8       	ldd	r6, Y+51	; 0x33
    1a94:	36 a9       	ldd	r19, Z+54	; 0x36
    1a96:	3a b4       	in	r3, 0x2a	; 42
    1a98:	4e 2c       	mov	r4, r14
    1a9a:	be ab       	std	Y+54, r27	; 0x36
    1a9c:	d9 1e       	adc	r13, r25
    1a9e:	8b 47       	sbci	r24, 0x7B	; 123
    1aa0:	d7 db       	rcall	.-2130   	; 0x1250 <aes_sbox0+0x250>
    1aa2:	d0 cf       	rjmp	.-96     	; 0x1a44 <aes_sbox0+0xa44>
    1aa4:	69 c3       	rjmp	.+1746   	; 0x2178 <pok+0x178>
    1aa6:	c7 5e       	subi	r28, 0xE7	; 231
    1aa8:	87 cb       	rjmp	.-2290   	; 0x11b8 <aes_sbox0+0x1b8>
    1aaa:	ad 9c       	mul	r10, r13
    1aac:	da 07       	cpc	r29, r26
    1aae:	7b 52       	subi	r23, 0x2B	; 43
    1ab0:	d1 65       	ori	r29, 0x51	; 81
    1ab2:	2e 66       	ori	r18, 0x6E	; 110
    1ab4:	5c eb       	ldi	r21, 0xBC	; 188
    1ab6:	f5 56       	subi	r31, 0x65	; 101
    1ab8:	03 0e       	add	r0, r19
    1aba:	78 01       	movw	r14, r16
    1abc:	6c de       	rcall	.-808    	; 0x1796 <aes_sbox0+0x796>
    1abe:	08 30       	cpi	r16, 0x08	; 8
    1ac0:	57 06       	cpc	r5, r23
    1ac2:	43 7c       	andi	r20, 0xC3	; 195
    1ac4:	29 9f       	mul	r18, r25
    1ac6:	e1 ef       	ldi	r30, 0xF1	; 241
    1ac8:	d3 ae       	std	Z+59, r13	; 0x3b
    1aca:	55 e9       	ldi	r21, 0x95	; 149
    1acc:	04 33       	cpi	r16, 0x34	; 52
    1ace:	90 fc       	sbrc	r9, 0
    1ad0:	23 ec       	ldi	r18, 0xC3	; 195
    1ad2:	0f fd       	.word	0xfd0f	; ????
    1ad4:	59 94       	.word	0x9459	; ????
    1ad6:	31 3e       	cpi	r19, 0xE1	; 225
    1ad8:	8d 76       	andi	r24, 0x6D	; 109
    1ada:	1a 10       	cpse	r1, r10
    1adc:	7e 5f       	subi	r23, 0xFE	; 254
    1ade:	53 bc       	out	0x23, r5	; 35
    1ae0:	b6 80       	ldd	r11, Z+6	; 0x06
    1ae2:	2f a5       	ldd	r18, Y+47	; 0x2f
    1ae4:	0c f6       	brge	.-126    	; 0x1a68 <aes_sbox0+0xa68>
    1ae6:	c2 b7       	in	r28, 0x32	; 50
    1ae8:	1f 7a       	andi	r17, 0xAF	; 175
    1aea:	97 fe       	sbrs	r9, 7
    1aec:	28 83       	st	Y, r18
    1aee:	4f 85       	ldd	r20, Y+15	; 0x0f
    1af0:	41 ac       	ldd	r4, Z+57	; 0x39
    1af2:	7d ff       	.word	0xff7d	; ????
    1af4:	f7 1d       	adc	r31, r7
    1af6:	50 8c       	ldd	r5, Z+24	; 0x18
    1af8:	95 12       	cpse	r9, r21
    1afa:	67 c6       	rjmp	.+3278   	; 0x27ca <m+0x5ca>
    1afc:	63 f4       	brvc	.+24     	; 0x1b16 <aes_sbox0+0xb16>
    1afe:	e0 e6       	ldi	r30, 0x60	; 96
    1b00:	57 53       	subi	r21, 0x37	; 55
    1b02:	22 bf       	out	0x32, r18	; 50
    1b04:	04 15       	cp	r16, r4
    1b06:	6a a4       	ldd	r6, Y+42	; 0x2a
    1b08:	8f c0       	rjmp	.+286    	; 0x1c28 <aes_sbox0+0xc28>
    1b0a:	e2 9a       	sbi	0x1c, 2	; 28
    1b0c:	26 f4       	brtc	.+8      	; 0x1b16 <aes_sbox0+0xb16>
    1b0e:	fc cc       	rjmp	.-1544   	; 0x1508 <aes_sbox0+0x508>
    1b10:	a3 bc       	out	0x23, r10	; 35
    1b12:	68 ce       	rjmp	.-816    	; 0x17e4 <aes_sbox0+0x7e4>
    1b14:	aa 90       	ld	r10, -Y
    1b16:	32 2c       	mov	r3, r2
    1b18:	4b 13       	cpse	r20, r27
    1b1a:	88 6f       	ori	r24, 0xF8	; 248
    1b1c:	21 0e       	add	r2, r17
    1b1e:	f1 ab       	std	Z+49, r31	; 0x31
    1b20:	a2 9b       	sbis	0x14, 2	; 20
    1b22:	df b5       	in	r29, 0x2f	; 47
    1b24:	02 61       	ori	r16, 0x12	; 18
    1b26:	b8 fb       	.word	0xfbb8	; ????
    1b28:	99 51       	subi	r25, 0x19	; 25
    1b2a:	82 d1       	rcall	.+772    	; 0x1e30 <aes_sbox0+0xe30>
    1b2c:	0b ca       	rjmp	.-3050   	; 0xf44 <gf256mul+0x228>
    1b2e:	d5 2a       	or	r13, r21
    1b30:	18 98       	cbi	0x03, 0	; 3
    1b32:	cd 1d       	adc	r28, r13
    1b34:	80 28       	or	r8, r0
    1b36:	7e d2       	rcall	.+1276   	; 0x2034 <pok+0x34>
    1b38:	e4 ec       	ldi	r30, 0xC4	; 196
    1b3a:	56 4e       	sbci	r21, 0xE6	; 230
    1b3c:	a6 47       	sbci	r26, 0x76	; 118
    1b3e:	89 1a       	sub	r8, r25
    1b40:	08 93       	.word	0x9308	; ????
    1b42:	ee 19       	sub	r30, r14
    1b44:	5d d8       	rcall	.-3910   	; 0xc00 <delay+0x4>
    1b46:	41 2f       	mov	r20, r17
    1b48:	af 1f       	adc	r26, r31
    1b4a:	48 52       	subi	r20, 0x28	; 40
    1b4c:	27 3e       	cpi	r18, 0xE7	; 231
    1b4e:	5e d7       	rcall	.+3772   	; 0x2a0c <m+0x80c>
    1b50:	76 92       	.word	0x9276	; ????
    1b52:	7d d0       	rcall	.+250    	; 0x1c4e <aes_sbox0+0xc4e>
    1b54:	87 5f       	subi	r24, 0xF7	; 247
    1b56:	eb c9       	rjmp	.-3114   	; 0xf2e <gf256mul+0x212>
    1b58:	79 20       	and	r7, r9
    1b5a:	84 ae       	std	Z+60, r8	; 0x3c
    1b5c:	4a 67       	ori	r20, 0x7A	; 122
    1b5e:	4f cb       	rjmp	.-2402   	; 0x11fe <aes_sbox0+0x1fe>
    1b60:	8d 7b       	andi	r24, 0xBD	; 189
    1b62:	4d 4c       	sbci	r20, 0xCD	; 205
    1b64:	2e 1b       	sub	r18, r30
    1b66:	b2 d9       	rcall	.-3228   	; 0xecc <gf256mul+0x1b0>
    1b68:	da 60       	ori	r29, 0x0A	; 10
    1b6a:	72 00       	.word	0x0072	; ????
    1b6c:	7c be       	out	0x3c, r7	; 60
    1b6e:	e3 e8       	ldi	r30, 0x83	; 131
    1b70:	40 07       	cpc	r20, r16
    1b72:	db 58       	subi	r29, 0x8B	; 139
    1b74:	a7 f3       	brie	.-24     	; 0x1b5e <aes_sbox0+0xb5e>
    1b76:	91 7f       	andi	r25, 0xF1	; 241
    1b78:	8e c5       	rjmp	.+2844   	; 0x2696 <m+0x496>
    1b7a:	30 c8       	rjmp	.-4000   	; 0xbdc <log_add+0x96>
    1b7c:	b6 f8       	bld	r11, 6
    1b7e:	73 a0       	ldd	r7, Z+35	; 0x23
    1b80:	b7 1e       	adc	r11, r23
    1b82:	f7 d3       	rcall	.+2030   	; 0x2372 <m+0x172>
    1b84:	f2 63       	ori	r31, 0x32	; 50
    1b86:	23 37       	cpi	r18, 0x73	; 115
    1b88:	f0 f9       	bld	r31, 0
    1b8a:	31 0a       	sbc	r3, r17
    1b8c:	71 3b       	cpi	r23, 0xB1	; 177
    1b8e:	55 e0       	ldi	r21, 0x05	; 5
    1b90:	2d e1       	ldi	r18, 0x1D	; 29
    1b92:	74 b3       	in	r23, 0x14	; 20
    1b94:	c1 d4       	rcall	.+2434   	; 0x2518 <m+0x318>
    1b96:	46 24       	eor	r4, r6
    1b98:	de 50       	subi	r29, 0x0E	; 14
    1b9a:	c3 5c       	subi	r28, 0xC3	; 195
    1b9c:	c2 01       	movw	r24, r4
    1b9e:	e5 05       	cpc	r30, r5
    1ba0:	38 11       	cpse	r19, r8
    1ba2:	6d b0       	in	r6, 0x0d	; 13
    1ba4:	f6 c7       	rjmp	.+4076   	; 0x2b92 <m+0x992>
    1ba6:	a1 ed       	ldi	r26, 0xD1	; 209
    1ba8:	34 ad       	ldd	r19, Z+60	; 0x3c
    1baa:	a9 03       	fmulsu	r18, r17
    1bac:	a5 ba       	out	0x15, r10	; 21
    1bae:	b1 bd       	out	0x21, r27	; 33
    1bb0:	5a 62       	ori	r21, 0x2A	; 42
    1bb2:	b4 06       	cpc	r11, r20
    1bb4:	6b 12       	cpse	r6, r27
    1bb6:	64 69       	ori	r22, 0x94	; 148
    1bb8:	3c 9f       	mul	r19, r28
    1bba:	81 36       	cpi	r24, 0x61	; 97
    1bbc:	0c 44       	sbci	r16, 0x4C	; 76
    1bbe:	0f bb       	out	0x1f, r16	; 31
    1bc0:	96 fa       	bst	r9, 6
    1bc2:	59 6e       	ori	r21, 0xE9	; 233
    1bc4:	83 3f       	cpi	r24, 0xF3	; 243
    1bc6:	c4 b9       	out	0x04, r28	; 4
    1bc8:	85 8b       	std	Z+21, r24	; 0x15
    1bca:	f5 43       	sbci	r31, 0x35	; 53
    1bcc:	16 29       	or	r17, r6
    1bce:	6c 3d       	cpi	r22, 0xDC	; 220
    1bd0:	d6 39       	cpi	r29, 0x96	; 150
    1bd2:	35 14       	cp	r3, r5
    1bd4:	7a 70       	andi	r23, 0x0A	; 10
    1bd6:	1c e7       	ldi	r17, 0x7C	; 124
    1bd8:	54 5b       	subi	r21, 0xB4	; 180
    1bda:	fe 33       	cpi	r31, 0x3E	; 62
    1bdc:	97 65       	ori	r25, 0x57	; 87
    1bde:	86 49       	sbci	r24, 0x96	; 150
    1be0:	ef 25       	eor	r30, r15
    1be2:	e9 42       	sbci	r30, 0x29	; 41
    1be4:	94 fd       	sbrc	r25, 4
    1be6:	10 75       	andi	r17, 0x50	; 80
    1be8:	dd a8       	ldd	r13, Y+53	; 0x35
    1bea:	9c 66       	ori	r25, 0x6C	; 108
    1bec:	cf 45       	sbci	r28, 0x5F	; 95
    1bee:	ea dc       	rcall	.-1580   	; 0x15c4 <aes_sbox0+0x5c4>
    1bf0:	8c 8a       	std	Y+20, r8	; 0x14
    1bf2:	9e 09       	sbc	r25, r14
    1bf4:	ac 0d       	add	r26, r12
    1bf6:	78 ff       	.word	0xff78	; ????
    1bf8:	e6 3a       	cpi	r30, 0xA6	; 166
    1bfa:	77 9d       	mul	r23, r7
    1bfc:	95 17       	cp	r25, r21
    1bfe:	c6 2b       	or	r28, r22
    1c00:	7d 0f       	add	r23, r29
    1c02:	d5 6f       	ori	r29, 0xF5	; 245
    1c04:	ec e7       	ldi	r30, 0x7C	; 124
    1c06:	73 b1       	in	r23, 0x03	; 3
    1c08:	42 43       	sbci	r20, 0x32	; 50
    1c0a:	82 74       	andi	r24, 0x42	; 66
    1c0c:	bd d6       	rcall	.+3450   	; 0x2988 <m+0x788>
    1c0e:	21 14       	cp	r2, r1
    1c10:	3f c7       	rjmp	.+3710   	; 0x2a90 <m+0x890>
    1c12:	81 ca       	rjmp	.-2814   	; 0x1116 <aes_sbox0+0x116>
    1c14:	7c af       	std	Y+60, r23	; 0x3c
    1c16:	b9 f7       	brne	.-18     	; 0x1c06 <aes_sbox0+0xc06>
    1c18:	d4 57       	subi	r29, 0x74	; 116
    1c1a:	4f 08       	sbc	r4, r15
    1c1c:	9e 70       	andi	r25, 0x0E	; 14
    1c1e:	a8 fc       	.word	0xfca8	; ????
    1c20:	47 5d       	subi	r20, 0xD7	; 215
    1c22:	a0 10       	cpse	r10, r0
    1c24:	51 d8       	rcall	.-3934   	; 0xcc8 <bitset+0x8>
    1c26:	28 31       	cpi	r18, 0x18	; 24
    1c28:	e1 16       	cp	r14, r17
    1c2a:	07 9c       	mul	r0, r7
    1c2c:	4e 20       	and	r4, r14
    1c2e:	52 d7       	rcall	.+3748   	; 0x2ad4 <m+0x8d4>
    1c30:	8b a1       	ldd	r24, Y+35	; 0x23
    1c32:	76 2f       	mov	r23, r22
    1c34:	40 c4       	rjmp	.+2176   	; 0x24b6 <m+0x2b6>
    1c36:	45 68       	ori	r20, 0x85	; 133
    1c38:	72 df       	rcall	.-284    	; 0x1b1e <aes_sbox0+0xb1e>
    1c3a:	79 9d       	mul	r23, r9
    1c3c:	e4 c6       	rjmp	.+3528   	; 0x2a06 <m+0x806>
    1c3e:	88 50       	subi	r24, 0x08	; 8
    1c40:	8d de       	rcall	.-742    	; 0x195c <aes_sbox0+0x95c>
    1c42:	96 5e       	subi	r25, 0xE6	; 230
    1c44:	da 25       	eor	r29, r10
    1c46:	04 c5       	rjmp	.+2568   	; 0x2650 <m+0x450>
    1c48:	d0 ba       	out	0x10, r13	; 16
    1c4a:	ad 94 b7 f4 	jmp	0x2be96e	; 0x2be96e <__data_load_end+0x2bb788>
    1c4e:	0d 6e       	ori	r16, 0xED	; 237
    1c50:	59 41       	sbci	r21, 0x19	; 25
    1c52:	eb e3       	ldi	r30, 0x3B	; 59
    1c54:	86 15       	cp	r24, r6
    1c56:	a9 48       	sbci	r26, 0x89	; 137
    1c58:	c2 12       	cpse	r12, r18
    1c5a:	17 97       	sbiw	r26, 0x07	; 7
    1c5c:	71 dd       	rcall	.-1310   	; 0x1740 <aes_sbox0+0x740>
    1c5e:	8f 27       	eor	r24, r31
    1c60:	ed 95 80 cf 	jmp	0x7b9f00	; 0x7b9f00 <__data_load_end+0x7b6d1a>
    1c64:	f3 c3       	rjmp	.+2022   	; 0x244c <m+0x24c>
    1c66:	29 fb       	.word	0xfb29	; ????
    1c68:	2d b0       	in	r2, 0x0d	; 13
    1c6a:	58 5c       	subi	r21, 0xC8	; 200
    1c6c:	65 ab       	std	Z+53, r22	; 0x35
    1c6e:	0b 1a       	sub	r0, r27
    1c70:	87 60       	ori	r24, 0x07	; 7
    1c72:	44 1c       	adc	r4, r4
    1c74:	fe a4       	ldd	r15, Y+46	; 0x2e
    1c76:	2e 01       	movw	r4, r28
    1c78:	67 c1       	rjmp	.+718    	; 0x1f48 <aes_sbox0+0xf48>
    1c7a:	ac b3       	in	r26, 0x1c	; 28
    1c7c:	3d 23       	and	r19, r29
    1c7e:	a5 9f       	mul	r26, r21
    1c80:	93 69       	ori	r25, 0x93	; 147
    1c82:	d2 a7       	std	Z+42, r29	; 0x2a
    1c84:	e5 d3       	rcall	.+1994   	; 0x2450 <m+0x250>
    1c86:	c0 4a       	sbci	r28, 0xA0	; 160
    1c88:	e6 4d       	sbci	r30, 0xD6	; 214
    1c8a:	e0 2a       	or	r14, r16
    1c8c:	1f 7a       	andi	r17, 0xAF	; 175
    1c8e:	9b f2       	brvs	.-90     	; 0x1c36 <aes_sbox0+0xc36>
    1c90:	78 92       	.word	0x9278	; ????
    1c92:	e9 35       	cpi	r30, 0x59	; 89
    1c94:	c9 24       	eor	r12, r9
    1c96:	9a 18       	sub	r9, r10
    1c98:	91 06       	cpc	r9, r17
    1c9a:	83 85       	ldd	r24, Z+11	; 0x0b
    1c9c:	77 f0       	brie	.+28     	; 0x1cba <aes_sbox0+0xcba>
    1c9e:	a3 02       	muls	r26, r19
    1ca0:	fa 4c       	sbci	r31, 0xCA	; 202
    1ca2:	8a 84       	ldd	r8, Y+10	; 0x0a
    1ca4:	63 32       	cpi	r22, 0x23	; 35
    1ca6:	19 26       	eor	r1, r25
    1ca8:	56 61       	ori	r21, 0x16	; 22
    1caa:	99 f5       	brne	.+102    	; 0x1d12 <aes_sbox0+0xd12>
    1cac:	cb b6       	in	r12, 0x3b	; 59
    1cae:	8c 30       	cpi	r24, 0x0C	; 12
    1cb0:	f1 3c       	cpi	r31, 0xC1	; 193
    1cb2:	5b 54       	subi	r21, 0x4B	; 75
    1cb4:	89 46       	sbci	r24, 0x69	; 105
    1cb6:	98 6a       	ori	r25, 0xA8	; 168
    1cb8:	3a 1b       	sub	r19, r26
    1cba:	d9 36       	cpi	r29, 0x69	; 105
    1cbc:	13 e8       	ldi	r17, 0x83	; 131
    1cbe:	75 7f       	andi	r23, 0xF5	; 245
    1cc0:	a6 0c       	add	r10, r6
    1cc2:	3b a2       	std	Y+35, r3	; 0x23
    1cc4:	be b2       	in	r11, 0x1e	; 30
    1cc6:	aa b5       	in	r26, 0x2a	; 42
    1cc8:	62 bf       	out	0x32, r22	; 50
    1cca:	37 1e       	adc	r3, r23
    1ccc:	ae e2       	ldi	r26, 0x2E	; 46
    1cce:	f9 c8       	rjmp	.-3598   	; 0xec2 <gf256mul+0x1a6>
    1cd0:	8e 39       	cpi	r24, 0x9E	; 158
    1cd2:	33 90       	.word	0x9033	; ????
    1cd4:	00 b4       	in	r0, 0x20	; 32
    1cd6:	03 4b       	sbci	r16, 0xB3	; 179
    1cd8:	bb 09       	sbc	r27, r11
    1cda:	55 6d       	ori	r21, 0xD5	; 213
    1cdc:	6b 66       	ori	r22, 0x6B	; 107
    1cde:	64 1d       	adc	r22, r4
    1ce0:	3e 05       	cpc	r19, r14
    1ce2:	ff f6       	brid	.-66     	; 0x1ca2 <aes_sbox0+0xca2>
    1ce4:	5a ef       	ldi	r21, 0xFA	; 250
    1ce6:	7e 34       	cpi	r23, 0x4E	; 78
    1ce8:	f8 dc       	rcall	.-1552   	; 0x16da <aes_sbox0+0x6da>
    1cea:	b8 11       	cpse	r27, r8
    1cec:	2c 38       	cpi	r18, 0x8C	; 140
    1cee:	fd 6c       	ori	r31, 0xCD	; 205
    1cf0:	cc 53       	subi	r28, 0x3C	; 60
    1cf2:	d1 5f       	subi	r29, 0xF1	; 241
    1cf4:	ea 0a       	sbc	r14, r26
    1cf6:	cd 0e       	add	r12, r29
    1cf8:	7b bc       	out	0x2b, r7	; 43
    1cfa:	22 ee       	ldi	r18, 0xE2	; 226
    1cfc:	49 2b       	or	r20, r25
    1cfe:	ce db       	rcall	.-2148   	; 0x149c <aes_sbox0+0x49c>
    1d00:	2d 18       	sub	r2, r13
    1d02:	ef 84       	ldd	r14, Y+15	; 0x0f
    1d04:	4d bb       	out	0x1d, r20	; 29
    1d06:	7a 7b       	andi	r23, 0xBA	; 186
    1d08:	88 4a       	sbci	r24, 0xA8	; 168
    1d0a:	de d5       	rcall	.+3004   	; 0x28c8 <m+0x6c8>
    1d0c:	56 ec       	ldi	r21, 0xC6	; 198
    1d0e:	36 44       	sbci	r19, 0x46	; 70
    1d10:	c5 91       	lpm	r28, Z+
    1d12:	49 a7       	std	Y+41, r20	; 0x29
    1d14:	31 76       	andi	r19, 0x61	; 97
    1d16:	6e ed       	ldi	r22, 0xDE	; 222
    1d18:	ce 80       	ldd	r12, Y+6	; 0x06
    1d1a:	96 45       	sbci	r25, 0x56	; 86
    1d1c:	f3 b8       	out	0x03, r15	; 3
    1d1e:	fe 06       	cpc	r15, r30
    1d20:	ee 6b       	ori	r30, 0xBE	; 190
    1d22:	19 77       	andi	r17, 0x79	; 121
    1d24:	a5 3e       	cpi	r26, 0xE5	; 229
    1d26:	2f d8       	rcall	.-4002   	; 0xd86 <gf256mul+0x6a>
    1d28:	08 11       	cpse	r16, r8
    1d2a:	e1 68       	ori	r30, 0x81	; 129
    1d2c:	29 99       	sbic	0x05, 1	; 5
    1d2e:	64 7e       	andi	r22, 0xE4	; 228
    1d30:	69 b1       	in	r22, 0x09	; 9
    1d32:	ff dd       	rcall	.-1026   	; 0x1932 <aes_sbox0+0x932>
    1d34:	a4 40       	sbci	r26, 0x04	; 4
    1d36:	e6 4b       	sbci	r30, 0xB6	; 182
    1d38:	51 7c       	andi	r21, 0xC1	; 193
    1d3a:	fd 79       	andi	r31, 0x9D	; 157
    1d3c:	16 4f       	sbci	r17, 0xF6	; 246
    1d3e:	98 b2       	in	r9, 0x18	; 24
    1d40:	57 34       	cpi	r21, 0x47	; 71
    1d42:	cd 8e       	std	Y+29, r12	; 0x1d
    1d44:	ad 94 83 e9 	jmp	0x2bd306	; 0x2bd306 <__data_load_end+0x2ba120>
    1d48:	fc 3d       	cpi	r31, 0xDC	; 220
    1d4a:	1c e3       	ldi	r17, 0x3C	; 60
    1d4c:	67 af       	std	Z+63, r22	; 0x3f
    1d4e:	e7 b4       	in	r14, 0x27	; 39
    1d50:	1e b6       	in	r1, 0x3e	; 62
    1d52:	e4 48       	sbci	r30, 0x84	; 132
    1d54:	ae 2e       	mov	r10, r30
    1d56:	2b fb       	.word	0xfb2b	; ????
    1d58:	71 90       	ld	r7, Z+
    1d5a:	2c bf       	out	0x3c, r18	; 60
    1d5c:	da d2       	rcall	.+1460   	; 0x2312 <m+0x112>
    1d5e:	78 60       	ori	r23, 0x08	; 8
    1d60:	23 32       	cpi	r18, 0x23	; 35
    1d62:	92 5c       	subi	r25, 0xC2	; 194
    1d64:	65 61       	ori	r22, 0x15	; 21
    1d66:	89 14       	cp	r8, r9
    1d68:	c2 10       	cpse	r12, r2
    1d6a:	fa ca       	rjmp	.-2572   	; 0x1360 <aes_sbox0+0x360>
    1d6c:	f6 b9       	out	0x06, r31	; 6
    1d6e:	ac d4       	rcall	.+2392   	; 0x26c8 <m+0x4c8>
    1d70:	a6 9c       	mul	r10, r6
    1d72:	1a 04       	cpc	r1, r10
    1d74:	8a 95       	dec	r24
    1d76:	f8 5e       	subi	r31, 0xE8	; 232
    1d78:	38 17       	cp	r19, r24
    1d7a:	9d c7       	rjmp	.+3898   	; 0x2cb6 <m+0xab6>
    1d7c:	25 7d       	andi	r18, 0xD5	; 213
    1d7e:	59 be       	out	0x39, r5	; 57
    1d80:	cb a2       	std	Y+35, r12	; 0x23
    1d82:	43 26       	eor	r4, r19
    1d84:	13 d9       	rcall	.-3546   	; 0xfac <gf256mul+0x290>
    1d86:	74 df       	rcall	.-280    	; 0x1c70 <aes_sbox0+0xc70>
    1d88:	73 f9       	bld	r23, 3
    1d8a:	ea dc       	rcall	.-1580   	; 0x1760 <aes_sbox0+0x760>
    1d8c:	9e eb       	ldi	r25, 0xBE	; 190
    1d8e:	50 aa       	std	Z+48, r5	; 0x30
    1d90:	3b 9a       	sbi	0x07, 3	; 7
    1d92:	c9 4e       	sbci	r28, 0xE9	; 233
    1d94:	bc ba       	out	0x1c, r11	; 28
    1d96:	3f a8       	ldd	r3, Y+55	; 0x37
    1d98:	21 a3       	std	Z+33, r18	; 0x21
    1d9a:	1d f0       	brhs	.+6      	; 0x1da2 <aes_sbox0+0xda2>
    1d9c:	0c d0       	rcall	.+24     	; 0x1db6 <aes_sbox0+0xdb6>
    1d9e:	ab 41       	sbci	r26, 0x1B	; 27
    1da0:	09 b5       	in	r16, 0x29	; 41
    1da2:	8f f2       	brie	.-94     	; 0x1d46 <aes_sbox0+0xd46>
    1da4:	cc a0       	ldd	r12, Y+36	; 0x24
    1da6:	58 6f       	ori	r21, 0xF8	; 248
    1da8:	1f 20       	and	r1, r15
    1daa:	0b 5a       	subi	r16, 0xAB	; 171
    1dac:	bd b3       	in	r27, 0x1d	; 29
    1dae:	75 c3       	rjmp	.+1770   	; 0x249a <m+0x29a>
    1db0:	46 4c       	sbci	r20, 0xC6	; 198
    1db2:	d1 2a       	or	r13, r17
    1db4:	0f e0       	ldi	r16, 0x0F	; 15
    1db6:	22 03       	mulsu	r18, r18
    1db8:	53 a1       	ldd	r21, Z+35	; 0x23
    1dba:	7f b0       	in	r7, 0x0f	; 15
    1dbc:	6d 62       	ori	r22, 0x2D	; 45
    1dbe:	05 c8       	rjmp	.-4086   	; 0xdca <gf256mul+0xae>
    1dc0:	f1 c0       	rjmp	.+482    	; 0x1fa4 <aes_sbox0+0xfa4>
    1dc2:	db 97       	sbiw	r26, 0x3b	; 59
    1dc4:	27 0e       	add	r2, r23
    1dc6:	86 5b       	subi	r24, 0xB6	; 182
    1dc8:	8c 93       	st	X, r24
    1dca:	8b 87       	std	Y+11, r24	; 0x0b
    1dcc:	9b 02       	muls	r25, r27
    1dce:	35 9f       	mul	r19, r21
    1dd0:	24 5d       	subi	r18, 0xD4	; 212
    1dd2:	5f 52       	subi	r21, 0x2F	; 47
    1dd4:	54 6c       	ori	r21, 0xC4	; 196
    1dd6:	30 82       	st	Z, r3
    1dd8:	72 3a       	cpi	r23, 0xA2	; 162
    1dda:	8d 39       	cpi	r24, 0x9D	; 157
    1ddc:	a9 0a       	sbc	r10, r25
    1dde:	00 b7       	in	r16, 0x30	; 48
    1de0:	55 c4       	rjmp	.+2218   	; 0x268c <m+0x48c>
    1de2:	01 15       	cp	r16, r1
    1de4:	28 81       	ld	r18, Y
    1de6:	e5 c1       	rjmp	.+970    	; 0x21b2 <pok+0x1b2>
    1de8:	0d 47       	sbci	r16, 0x7D	; 125
    1dea:	d6 63       	ori	r29, 0x36	; 54
    1dec:	cf c6       	rjmp	.+3486   	; 0x2b8c <m+0x98c>
    1dee:	3c 07       	cpc	r19, r28
    1df0:	e2 f7       	brpl	.-8      	; 0x1dea <aes_sbox0+0xdea>
    1df2:	12 70       	andi	r17, 0x02	; 2
    1df4:	d7 1b       	sub	r29, r23
    1df6:	85 42       	sbci	r24, 0x25	; 37
    1df8:	37 f4       	brid	.+12     	; 0x1e06 <aes_sbox0+0xe06>
    1dfa:	33 d3       	rcall	.+1638   	; 0x2462 <m+0x262>
    1dfc:	66 e8       	ldi	r22, 0x86	; 134
    1dfe:	6a f5       	brpl	.+90     	; 0x1e5a <aes_sbox0+0xe5a>
    1e00:	73 5e       	subi	r23, 0xE3	; 227
    1e02:	76 f2       	brts	.-100    	; 0x1da0 <aes_sbox0+0xda0>
    1e04:	40 19       	sub	r20, r0
    1e06:	bd 97       	sbiw	r30, 0x2d	; 45
    1e08:	be 66       	ori	r27, 0x6E	; 110
    1e0a:	d2 f0       	brmi	.+52     	; 0x1e40 <aes_sbox0+0xe40>
    1e0c:	4f ab       	std	Y+55, r20	; 0x37
    1e0e:	44 e9       	ldi	r20, 0x94	; 148
    1e10:	1e 07       	cpc	r17, r30
    1e12:	67 ee       	ldi	r22, 0xE7	; 231
    1e14:	96 26       	eor	r9, r22
    1e16:	71 6b       	ori	r23, 0xB1	; 177
    1e18:	64 e1       	ldi	r22, 0x14	; 20
    1e1a:	78 16       	cp	r7, r24
    1e1c:	31 aa       	std	Z+49, r3	; 0x31
    1e1e:	d7 20       	and	r13, r7
    1e20:	8f c1       	rjmp	.+798    	; 0x2140 <pok+0x140>
    1e22:	4a 99       	sbic	0x09, 2	; 9
    1e24:	b7 fc       	sbrc	r11, 7
    1e26:	09 f1       	breq	.+66     	; 0x1e6a <aes_sbox0+0xe6a>
    1e28:	9e ca       	rjmp	.-2756   	; 0x1366 <aes_sbox0+0x366>
    1e2a:	a8 46       	sbci	r26, 0x68	; 104
    1e2c:	79 3e       	cpi	r23, 0xE9	; 233
    1e2e:	e2 61       	ori	r30, 0x12	; 18
    1e30:	45 87       	std	Z+13, r20	; 0x0d
    1e32:	da d1       	rcall	.+948    	; 0x21e8 <pok+0x1e8>
    1e34:	e3 59       	subi	r30, 0x93	; 147
    1e36:	4b 39       	cpi	r20, 0x9B	; 155
    1e38:	17 22       	and	r1, r23
    1e3a:	8b e0       	ldi	r24, 0x0B	; 11
    1e3c:	b4 42       	sbci	r27, 0x24	; 36
    1e3e:	74 75       	andi	r23, 0x54	; 84
    1e40:	18 37       	cpi	r17, 0x78	; 120
    1e42:	c8 92       	.word	0x92c8	; ????
    1e44:	72 2a       	or	r7, r18
    1e46:	b1 56       	subi	r27, 0x61	; 97
    1e48:	93 a9       	ldd	r25, Z+51	; 0x33
    1e4a:	0b 15       	cp	r16, r11
    1e4c:	9a 85       	ldd	r25, Y+10	; 0x0a
    1e4e:	51 f7       	brne	.-44     	; 0x1e24 <aes_sbox0+0xe24>
    1e50:	1f cd       	rjmp	.-1474   	; 0x1890 <aes_sbox0+0x890>
    1e52:	c5 f5       	brhc	.+112    	; 0x1ec4 <aes_sbox0+0xec4>
    1e54:	b6 f9       	bld	r27, 6
    1e56:	db a3       	std	Y+35, r29	; 0x23
    1e58:	3d 2c       	mov	r3, r13
    1e5a:	53 9d       	mul	r21, r3
    1e5c:	6e 6a       	ori	r22, 0xAE	; 174
    1e5e:	1b 86       	std	Y+11, r1	; 0x0b
    1e60:	9f 7e       	andi	r25, 0xEF	; 239
    1e62:	b0 23       	and	r27, r16
    1e64:	dd d5       	rcall	.+3002   	; 0x2a20 <m+0x820>
    1e66:	6f 77       	andi	r22, 0x7F	; 127
    1e68:	b9 11       	cpse	r27, r9
    1e6a:	47 eb       	ldi	r20, 0xB7	; 183
    1e6c:	21 a1       	ldd	r18, Z+33	; 0x21
    1e6e:	f4 24       	eor	r15, r4
    1e70:	32 f3       	brmi	.-52     	; 0x1e3e <aes_sbox0+0xe3e>
    1e72:	ec 13       	cpse	r30, r28
    1e74:	a0 68       	ori	r26, 0x80	; 128
    1e76:	bb e8       	ldi	r27, 0x8B	; 139
    1e78:	3b 58       	subi	r19, 0x8B	; 139
    1e7a:	81 c2       	rjmp	.+1282   	; 0x237e <m+0x17e>
    1e7c:	9b a2       	std	Y+35, r9	; 0x23
    1e7e:	e6 8c       	ldd	r14, Z+30	; 0x1e
    1e80:	ae 5c       	subi	r26, 0xCE	; 206
    1e82:	bf 70       	andi	r27, 0x0F	; 15
    1e84:	6d 62       	ori	r22, 0x2D	; 45
    1e86:	c7 0a       	sbc	r12, r23
    1e88:	43 49       	sbci	r20, 0x93	; 147
    1e8a:	25 de       	rcall	.-950    	; 0x1ad6 <aes_sbox0+0xad6>
    1e8c:	ef 00       	.word	0x00ef	; ????
    1e8e:	0c 2d       	mov	r16, r12
    1e90:	2f 10       	cpse	r2, r15
    1e92:	55 04       	cpc	r5, r5
    1e94:	bc b2       	in	r11, 0x1c	; 28
    1e96:	cc 7a       	andi	r28, 0xAC	; 172
    1e98:	ba 06       	cpc	r11, r26
    1e9a:	fd 80       	ldd	r15, Y+5	; 0x05
    1e9c:	af c3       	rjmp	.+1886   	; 0x25fc <m+0x3fc>
    1e9e:	60 57       	subi	r22, 0x70	; 112
    1ea0:	ac 2e       	mov	r10, r28
    1ea2:	ff 12       	cpse	r15, r31
    1ea4:	df 03       	fmulsu	r21, r23
    1ea6:	4e a4       	ldd	r4, Y+46	; 0x2e
    1ea8:	95 34       	cpi	r25, 0x45	; 69
    1eaa:	41 c6       	rjmp	.+3202   	; 0x2b2e <m+0x92e>
    1eac:	b5 b3       	in	r27, 0x15	; 21
    1eae:	a7 30       	cpi	r26, 0x07	; 7
    1eb0:	f6 7c       	andi	r31, 0xC6	; 198
    1eb2:	d3 e5       	ldi	r29, 0x53	; 83
    1eb4:	e4 91       	lpm	r30, Z+
    1eb6:	a5 5f       	subi	r26, 0xF5	; 245
    1eb8:	ad c4       	rjmp	.+2394   	; 0x2814 <m+0x614>
    1eba:	29 4c       	sbci	r18, 0xC9	; 201
    1ebc:	d6 1c       	adc	r13, r6
    1ebe:	d0 7b       	andi	r29, 0xB0	; 176
    1ec0:	fb 38       	cpi	r31, 0x8B	; 139
    1ec2:	dc 3c       	cpi	r29, 0xCC	; 204
    1ec4:	e7 69       	ori	r30, 0x97	; 151
    1ec6:	fa 65       	ori	r31, 0x5A	; 90
    1ec8:	f8 ed       	ldi	r31, 0xD8	; 216
    1eca:	7f 1d       	adc	r23, r15
    1ecc:	14 d8       	rcall	.-4056   	; 0xef6 <gf256mul+0x1da>
    1ece:	4d 8a       	std	Y+21, r4	; 0x15
    1ed0:	48 02       	muls	r20, r24
    1ed2:	6c d9       	rcall	.-3368   	; 0x11ac <aes_sbox0+0x1ac>
    1ed4:	c9 c0       	rjmp	.+402    	; 0x2068 <pok+0x68>
    1ed6:	08 33       	cpi	r16, 0x38	; 56
    1ed8:	cb 5a       	subi	r28, 0xAB	; 171
    1eda:	1a 0e       	add	r1, r26
    1edc:	8e 27       	eor	r24, r30
    1ede:	ce ea       	ldi	r28, 0xAE	; 174
    1ee0:	35 7d       	andi	r19, 0xD5	; 213
    1ee2:	36 82       	std	Z+6, r3	; 0x06
    1ee4:	05 a6       	std	Z+45, r0	; 0x2d
    1ee6:	b8 0f       	add	r27, r24
    1ee8:	52 2b       	or	r21, r18
    1eea:	5d 50       	subi	r21, 0x0D	; 13
    1eec:	63 5b       	subi	r22, 0xB3	; 179
    1eee:	8d 3f       	cpi	r24, 0xFD	; 253
    1ef0:	9c 83       	std	Y+4, r25	; 0x04
    1ef2:	88 84       	ldd	r8, Y+8	; 0x08
    1ef4:	0d 94 90 3a 	jmp	0x27520	; 0x27520 <__data_load_end+0x2433a>
    1ef8:	cf fe       	.word	0xfecf	; ????
    1efa:	98 d4       	rcall	.+2352   	; 0x282c <m+0x62c>
    1efc:	01 28       	or	r0, r1
    1efe:	54 89       	ldd	r21, Z+20	; 0x14
    1f00:	16 bb       	out	0x16, r17	; 22
    1f02:	54 b0       	in	r5, 0x04	; 4
    1f04:	0f 2d       	mov	r16, r15
    1f06:	99 41       	sbci	r25, 0x19	; 25
    1f08:	68 42       	sbci	r22, 0x28	; 40
    1f0a:	e6 bf       	out	0x36, r30	; 54
    1f0c:	0d 89       	ldd	r16, Y+21	; 0x15
    1f0e:	a1 8c       	ldd	r10, Z+25	; 0x19
    1f10:	df 28       	or	r13, r15
    1f12:	55 ce       	rjmp	.-854    	; 0x1bbe <aes_sbox0+0xbbe>
    1f14:	e9 87       	std	Y+9, r30	; 0x09
    1f16:	1e 9b       	sbis	0x03, 6	; 3
    1f18:	94 8e       	std	Z+28, r9	; 0x1c
    1f1a:	d9 69       	ori	r29, 0x99	; 153
    1f1c:	11 98       	cbi	0x02, 1	; 2
    1f1e:	f8 e1       	ldi	r31, 0x18	; 24
    1f20:	9e 1d       	adc	r25, r14
    1f22:	c1 86       	std	Z+9, r12	; 0x09
    1f24:	b9 57       	subi	r27, 0x79	; 121
    1f26:	35 61       	ori	r19, 0x15	; 21
    1f28:	0e f6       	brtc	.-126    	; 0x1eac <aes_sbox0+0xeac>
    1f2a:	03 48       	sbci	r16, 0x83	; 131
    1f2c:	66 b5       	in	r22, 0x26	; 38
    1f2e:	3e 70       	andi	r19, 0x0E	; 14
    1f30:	8a 8b       	std	Y+18, r24	; 0x12
    1f32:	bd 4b       	sbci	r27, 0xBD	; 189
    1f34:	1f 74       	andi	r17, 0x4F	; 79
    1f36:	dd e8       	ldi	r29, 0x8D	; 141
    1f38:	c6 b4       	in	r12, 0x26	; 38
    1f3a:	a6 1c       	adc	r10, r6
    1f3c:	2e 25       	eor	r18, r14
    1f3e:	78 ba       	out	0x18, r7	; 24
    1f40:	08 ae       	std	Y+56, r0	; 0x38
    1f42:	7a 65       	ori	r23, 0x5A	; 90
    1f44:	ea f4       	brpl	.+58     	; 0x1f80 <aes_sbox0+0xf80>
    1f46:	56 6c       	ori	r21, 0xC6	; 198
    1f48:	a9 4e       	sbci	r26, 0xE9	; 233
    1f4a:	d5 8d       	ldd	r29, Z+29	; 0x1d
    1f4c:	6d 37       	cpi	r22, 0x7D	; 125
    1f4e:	c8 e7       	ldi	r28, 0x78	; 120
    1f50:	79 e4       	ldi	r23, 0x49	; 73
    1f52:	95 91       	lpm	r25, Z+
    1f54:	62 ac       	ldd	r6, Z+58	; 0x3a
    1f56:	d3 c2       	rjmp	.+1446   	; 0x24fe <m+0x2fe>
    1f58:	5c 24       	eor	r5, r12
    1f5a:	06 49       	sbci	r16, 0x96	; 150
    1f5c:	0a 3a       	cpi	r16, 0xAA	; 170
    1f5e:	32 e0       	ldi	r19, 0x02	; 2
    1f60:	db 0b       	sbc	r29, r27
    1f62:	5e de       	rcall	.-836    	; 0x1c20 <aes_sbox0+0xc20>
    1f64:	14 b8       	out	0x04, r1	; 4
    1f66:	ee 46       	sbci	r30, 0x6E	; 110
    1f68:	88 90       	.word	0x9088	; ????
    1f6a:	2a 22       	and	r2, r26
    1f6c:	dc 4f       	sbci	r29, 0xFC	; 252
    1f6e:	81 60       	ori	r24, 0x01	; 1
    1f70:	73 19       	sub	r23, r3
    1f72:	5d 64       	ori	r21, 0x4D	; 77
    1f74:	3d 7e       	andi	r19, 0xED	; 237
    1f76:	a7 c4       	rjmp	.+2382   	; 0x28c6 <m+0x6c6>
    1f78:	17 44       	sbci	r17, 0x47	; 71
    1f7a:	97 5f       	subi	r25, 0xF7	; 247
    1f7c:	ec 13       	cpse	r30, r28
    1f7e:	0c cd       	rjmp	.-1512   	; 0x1998 <aes_sbox0+0x998>
    1f80:	d2 f3       	brmi	.-12     	; 0x1f76 <aes_sbox0+0xf76>
    1f82:	ff 10       	cpse	r15, r15
    1f84:	21 da       	rcall	.-3006   	; 0x13c8 <aes_sbox0+0x3c8>
    1f86:	b6 bc       	out	0x26, r11	; 38
    1f88:	f5 38       	cpi	r31, 0x85	; 133
    1f8a:	9d 92       	st	X+, r9
    1f8c:	8f 40       	sbci	r24, 0x0F	; 15
    1f8e:	a3 51       	subi	r26, 0x13	; 19
    1f90:	a8 9f       	mul	r26, r24
    1f92:	3c 50       	subi	r19, 0x0C	; 12
    1f94:	7f 02       	muls	r23, r31
    1f96:	f9 45       	sbci	r31, 0x59	; 89
    1f98:	85 33       	cpi	r24, 0x35	; 53
    1f9a:	4d 43       	sbci	r20, 0x3D	; 61
    1f9c:	fb aa       	std	Y+51, r15	; 0x33
    1f9e:	ef d0       	rcall	.+478    	; 0x217e <pok+0x17e>
    1fa0:	cf 58       	subi	r28, 0x8F	; 143
    1fa2:	4c 4a       	sbci	r20, 0xAC	; 172
    1fa4:	39 be       	out	0x39, r3	; 57
    1fa6:	cb 6a       	ori	r28, 0xAB	; 171
    1fa8:	5b b1       	in	r21, 0x0b	; 11
    1faa:	fc 20       	and	r15, r12
    1fac:	ed 00       	.word	0x00ed	; ????
    1fae:	d1 53       	subi	r29, 0x31	; 49
    1fb0:	84 2f       	mov	r24, r20
    1fb2:	e3 29       	or	r30, r3
    1fb4:	b3 d6       	rcall	.+3430   	; 0x2d1c <m+0xb1c>
    1fb6:	3b 52       	subi	r19, 0x2B	; 43
    1fb8:	a0 5a       	subi	r26, 0xA0	; 160
    1fba:	6e 1b       	sub	r22, r30
    1fbc:	1a 2c       	mov	r1, r10
    1fbe:	83 09       	sbc	r24, r3
    1fc0:	75 b2       	in	r7, 0x15	; 21
    1fc2:	27 eb       	ldi	r18, 0xB7	; 183
    1fc4:	e2 80       	ldd	r14, Z+2	; 0x02
    1fc6:	12 07       	cpc	r17, r18
    1fc8:	9a 05       	cpc	r25, r10
    1fca:	96 18       	sub	r9, r6
    1fcc:	c3 23       	and	r28, r19
    1fce:	c7 04       	cpc	r12, r7
    1fd0:	15 31       	cpi	r17, 0x15	; 21
    1fd2:	d8 71       	andi	r29, 0x18	; 24
    1fd4:	f1 e5       	ldi	r31, 0x51	; 81
    1fd6:	a5 34       	cpi	r26, 0x45	; 69
    1fd8:	cc f7       	brge	.-14     	; 0x1fcc <aes_sbox0+0xfcc>
    1fda:	3f 36       	cpi	r19, 0x6F	; 111
    1fdc:	26 93       	.word	0x9326	; ????
    1fde:	fd b7       	in	r31, 0x3d	; 61
    1fe0:	c0 72       	andi	r28, 0x20	; 32
    1fe2:	a4 9c       	mul	r10, r4
    1fe4:	af a2       	std	Y+39, r10	; 0x27
    1fe6:	d4 ad       	ldd	r29, Z+60	; 0x3c
    1fe8:	f0 47       	sbci	r31, 0x70	; 112
    1fea:	59 fa       	.word	0xfa59	; ????
    1fec:	7d c9       	rjmp	.-3334   	; 0x12e8 <aes_sbox0+0x2e8>
    1fee:	82 ca       	rjmp	.-2812   	; 0x14f4 <aes_sbox0+0x4f4>
    1ff0:	76 ab       	std	Z+54, r23	; 0x36
    1ff2:	d7 fe       	sbrs	r13, 7
    1ff4:	2b 67       	ori	r18, 0x7B	; 123
    1ff6:	01 30       	cpi	r16, 0x01	; 1
    1ff8:	c5 6f       	ori	r28, 0xF5	; 245
    1ffa:	6b f2       	brvs	.-102    	; 0x1f96 <aes_sbox0+0xf96>
    1ffc:	7b 77       	andi	r23, 0x7B	; 123
    1ffe:	7c 63       	ori	r23, 0x3C	; 60

00002000 <pok>:
    2000:	b8 b6       	in	r11, 0x38	; 56
    2002:	2d 23       	and	r18, r29
    2004:	89 12       	cpse	r8, r25
    2006:	1c 87       	std	Y+12, r17	; 0x0c
    2008:	b8 b6       	in	r11, 0x38	; 56
    200a:	2d 23       	and	r18, r29
    200c:	89 12       	cpse	r8, r25
    200e:	1c 87       	std	Y+12, r17	; 0x0c
    2010:	12 1c       	adc	r1, r2
    2012:	10 8b       	std	Z+16, r17	; 0x10
    2014:	b6 2d       	mov	r27, r6
    2016:	85 8b       	std	Z+21, r24	; 0x15
    2018:	12 1c       	adc	r1, r2
    201a:	10 8b       	std	Z+16, r17	; 0x10
    201c:	b6 2d       	mov	r27, r6
    201e:	85 8b       	std	Z+21, r24	; 0x15
    2020:	2d 85       	ldd	r18, Y+13	; 0x0d
    2022:	89 b4       	in	r8, 0x29	; 41
    2024:	1c 10       	cpse	r1, r12
    2026:	b8 21       	and	r27, r8
    2028:	2d 85       	ldd	r18, Y+13	; 0x0d
    202a:	89 b4       	in	r8, 0x29	; 41
    202c:	1c 10       	cpse	r1, r12
    202e:	b8 21       	and	r27, r8
    2030:	10 2d       	mov	r17, r0
    2032:	23 1e       	adc	r2, r19
    2034:	85 1c       	adc	r8, r5
    2036:	87 1e       	adc	r8, r23
    2038:	10 2d       	mov	r17, r0
    203a:	23 1e       	adc	r2, r19
    203c:	85 1c       	adc	r8, r5
    203e:	87 1e       	adc	r8, r23
    2040:	89 12       	cpse	r8, r25
    2042:	1c 87       	std	Y+12, r17	; 0x0c
    2044:	b8 b6       	in	r11, 0x38	; 56
    2046:	2d 23       	and	r18, r29
    2048:	89 12       	cpse	r8, r25
    204a:	1c 87       	std	Y+12, r17	; 0x0c
    204c:	b8 b6       	in	r11, 0x38	; 56
    204e:	2d 23       	and	r18, r29
    2050:	b6 2d       	mov	r27, r6
    2052:	85 8b       	std	Z+21, r24	; 0x15
    2054:	12 1c       	adc	r1, r2
    2056:	10 8b       	std	Z+16, r17	; 0x10
    2058:	b6 2d       	mov	r27, r6
    205a:	85 8b       	std	Z+21, r24	; 0x15
    205c:	12 1c       	adc	r1, r2
    205e:	10 8b       	std	Z+16, r17	; 0x10
    2060:	1c 10       	cpse	r1, r12
    2062:	b8 21       	and	r27, r8
    2064:	2d 85       	ldd	r18, Y+13	; 0x0d
    2066:	89 b4       	in	r8, 0x29	; 41
    2068:	1c 10       	cpse	r1, r12
    206a:	b8 21       	and	r27, r8
    206c:	2d 85       	ldd	r18, Y+13	; 0x0d
    206e:	89 b4       	in	r8, 0x29	; 41
    2070:	85 1c       	adc	r8, r5
    2072:	87 1e       	adc	r8, r23
    2074:	10 2d       	mov	r17, r0
    2076:	23 1e       	adc	r2, r19
    2078:	85 1c       	adc	r8, r5
    207a:	87 1e       	adc	r8, r23
    207c:	10 2d       	mov	r17, r0
    207e:	23 1e       	adc	r2, r19
    2080:	b8 b6       	in	r11, 0x38	; 56
    2082:	2d 23       	and	r18, r29
    2084:	89 12       	cpse	r8, r25
    2086:	1c 87       	std	Y+12, r17	; 0x0c
    2088:	b8 b6       	in	r11, 0x38	; 56
    208a:	2d 23       	and	r18, r29
    208c:	89 12       	cpse	r8, r25
    208e:	1c 87       	std	Y+12, r17	; 0x0c
    2090:	12 1c       	adc	r1, r2
    2092:	10 8b       	std	Z+16, r17	; 0x10
    2094:	b6 2d       	mov	r27, r6
    2096:	85 8b       	std	Z+21, r24	; 0x15
    2098:	12 1c       	adc	r1, r2
    209a:	10 8b       	std	Z+16, r17	; 0x10
    209c:	b6 2d       	mov	r27, r6
    209e:	85 8b       	std	Z+21, r24	; 0x15
    20a0:	2d 85       	ldd	r18, Y+13	; 0x0d
    20a2:	89 b4       	in	r8, 0x29	; 41
    20a4:	1c 10       	cpse	r1, r12
    20a6:	b8 21       	and	r27, r8
    20a8:	2d 85       	ldd	r18, Y+13	; 0x0d
    20aa:	89 b4       	in	r8, 0x29	; 41
    20ac:	1c 10       	cpse	r1, r12
    20ae:	b8 21       	and	r27, r8
    20b0:	10 2d       	mov	r17, r0
    20b2:	23 1e       	adc	r2, r19
    20b4:	85 1c       	adc	r8, r5
    20b6:	87 1e       	adc	r8, r23
    20b8:	10 2d       	mov	r17, r0
    20ba:	23 1e       	adc	r2, r19
    20bc:	85 1c       	adc	r8, r5
    20be:	87 1e       	adc	r8, r23
    20c0:	89 12       	cpse	r8, r25
    20c2:	1c 87       	std	Y+12, r17	; 0x0c
    20c4:	b8 b6       	in	r11, 0x38	; 56
    20c6:	2d 23       	and	r18, r29
    20c8:	89 12       	cpse	r8, r25
    20ca:	1c 87       	std	Y+12, r17	; 0x0c
    20cc:	b8 b6       	in	r11, 0x38	; 56
    20ce:	2d 23       	and	r18, r29
    20d0:	b6 2d       	mov	r27, r6
    20d2:	85 8b       	std	Z+21, r24	; 0x15
    20d4:	12 1c       	adc	r1, r2
    20d6:	10 8b       	std	Z+16, r17	; 0x10
    20d8:	b6 2d       	mov	r27, r6
    20da:	85 8b       	std	Z+21, r24	; 0x15
    20dc:	12 1c       	adc	r1, r2
    20de:	10 8b       	std	Z+16, r17	; 0x10
    20e0:	1c 10       	cpse	r1, r12
    20e2:	b8 21       	and	r27, r8
    20e4:	2d 85       	ldd	r18, Y+13	; 0x0d
    20e6:	89 b4       	in	r8, 0x29	; 41
    20e8:	1c 10       	cpse	r1, r12
    20ea:	b8 21       	and	r27, r8
    20ec:	2d 85       	ldd	r18, Y+13	; 0x0d
    20ee:	89 b4       	in	r8, 0x29	; 41
    20f0:	85 1c       	adc	r8, r5
    20f2:	87 1e       	adc	r8, r23
    20f4:	10 2d       	mov	r17, r0
    20f6:	23 1e       	adc	r2, r19
    20f8:	85 1c       	adc	r8, r5
    20fa:	87 1e       	adc	r8, r23
    20fc:	10 2d       	mov	r17, r0
    20fe:	23 1e       	adc	r2, r19
    2100:	00 5c       	subi	r16, 0xC0	; 192
    2102:	a3 ff       	sbrs	r26, 3
    2104:	53 9a       	sbi	0x0a, 3	; 10
    2106:	f0 39       	cpi	r31, 0x90	; 144
    2108:	95 c9       	rjmp	.-3286   	; 0x1434 <aes_sbox0+0x434>
    210a:	36 6a       	ori	r19, 0xA6	; 166
    210c:	c6 0f       	add	r28, r22
    210e:	65 ac       	ldd	r6, Z+61	; 0x3d
    2110:	0f 65       	ori	r16, 0x5F	; 95
    2112:	ac 00       	.word	0x00ac	; ????
    2114:	5c a3       	std	Y+36, r21	; 0x24
    2116:	ff 53       	subi	r31, 0x3F	; 63
    2118:	9a f0       	brmi	.+38     	; 0x2140 <pok+0x140>
    211a:	39 95       	.word	0x9539	; ????
    211c:	c9 36       	cpi	r28, 0x69	; 105
    211e:	6a c6       	rjmp	.+3284   	; 0x2df4 <m+0xbf4>
    2120:	36 6a       	ori	r19, 0xA6	; 166
    2122:	c6 0f       	add	r28, r22
    2124:	65 ac       	ldd	r6, Z+61	; 0x3d
    2126:	00 5c       	subi	r16, 0xC0	; 192
    2128:	a3 ff       	sbrs	r26, 3
    212a:	53 9a       	sbi	0x0a, 3	; 10
    212c:	f0 39       	cpi	r31, 0x90	; 144
    212e:	95 c9       	rjmp	.-3286   	; 0x145a <aes_sbox0+0x45a>
    2130:	39 95       	.word	0x9539	; ????
    2132:	c9 36       	cpi	r28, 0x69	; 105
    2134:	6a c6       	rjmp	.+3284   	; 0x2e0a <m+0xc0a>
    2136:	0f 65       	ori	r16, 0x5F	; 95
    2138:	ac 00       	.word	0x00ac	; ????
    213a:	5c a3       	std	Y+36, r21	; 0x24
    213c:	ff 53       	subi	r31, 0x3F	; 63
    213e:	9a f0       	brmi	.+38     	; 0x2166 <pok+0x166>
    2140:	53 9a       	sbi	0x0a, 3	; 10
    2142:	f0 39       	cpi	r31, 0x90	; 144
    2144:	95 c9       	rjmp	.-3286   	; 0x1470 <aes_sbox0+0x470>
    2146:	36 6a       	ori	r19, 0xA6	; 166
    2148:	c6 0f       	add	r28, r22
    214a:	65 ac       	ldd	r6, Z+61	; 0x3d
    214c:	00 5c       	subi	r16, 0xC0	; 192
    214e:	a3 ff       	sbrs	r26, 3
    2150:	5c a3       	std	Y+36, r21	; 0x24
    2152:	ff 53       	subi	r31, 0x3F	; 63
    2154:	9a f0       	brmi	.+38     	; 0x217c <pok+0x17c>
    2156:	39 95       	.word	0x9539	; ????
    2158:	c9 36       	cpi	r28, 0x69	; 105
    215a:	6a c6       	rjmp	.+3284   	; 0x2e30 <m+0xc30>
    215c:	0f 65       	ori	r16, 0x5F	; 95
    215e:	ac 00       	.word	0x00ac	; ????
    2160:	65 ac       	ldd	r6, Z+61	; 0x3d
    2162:	00 5c       	subi	r16, 0xC0	; 192
    2164:	a3 ff       	sbrs	r26, 3
    2166:	53 9a       	sbi	0x0a, 3	; 10
    2168:	f0 39       	cpi	r31, 0x90	; 144
    216a:	95 c9       	rjmp	.-3286   	; 0x1496 <aes_sbox0+0x496>
    216c:	36 6a       	ori	r19, 0xA6	; 166
    216e:	c6 0f       	add	r28, r22
    2170:	6a c6       	rjmp	.+3284   	; 0x2e46 <m+0xc46>
    2172:	0f 65       	ori	r16, 0x5F	; 95
    2174:	ac 00       	.word	0x00ac	; ????
    2176:	5c a3       	std	Y+36, r21	; 0x24
    2178:	ff 53       	subi	r31, 0x3F	; 63
    217a:	9a f0       	brmi	.+38     	; 0x21a2 <pok+0x1a2>
    217c:	39 95       	.word	0x9539	; ????
    217e:	c9 36       	cpi	r28, 0x69	; 105
    2180:	95 c9       	rjmp	.-3286   	; 0x14ac <aes_sbox0+0x4ac>
    2182:	36 6a       	ori	r19, 0xA6	; 166
    2184:	c6 0f       	add	r28, r22
    2186:	65 ac       	ldd	r6, Z+61	; 0x3d
    2188:	00 5c       	subi	r16, 0xC0	; 192
    218a:	a3 ff       	sbrs	r26, 3
    218c:	53 9a       	sbi	0x0a, 3	; 10
    218e:	f0 39       	cpi	r31, 0x90	; 144
    2190:	9a f0       	brmi	.+38     	; 0x21b8 <pok+0x1b8>
    2192:	39 95       	.word	0x9539	; ????
    2194:	c9 36       	cpi	r28, 0x69	; 105
    2196:	6a c6       	rjmp	.+3284   	; 0x2e6c <m+0xc6c>
    2198:	0f 65       	ori	r16, 0x5F	; 95
    219a:	ac 00       	.word	0x00ac	; ????
    219c:	5c a3       	std	Y+36, r21	; 0x24
    219e:	ff 53       	subi	r31, 0x3F	; 63
    21a0:	a3 ff       	sbrs	r26, 3
    21a2:	53 9a       	sbi	0x0a, 3	; 10
    21a4:	f0 39       	cpi	r31, 0x90	; 144
    21a6:	95 c9       	rjmp	.-3286   	; 0x14d2 <aes_sbox0+0x4d2>
    21a8:	36 6a       	ori	r19, 0xA6	; 166
    21aa:	c6 0f       	add	r28, r22
    21ac:	65 ac       	ldd	r6, Z+61	; 0x3d
    21ae:	00 5c       	subi	r16, 0xC0	; 192
    21b0:	ac 00       	.word	0x00ac	; ????
    21b2:	5c a3       	std	Y+36, r21	; 0x24
    21b4:	ff 53       	subi	r31, 0x3F	; 63
    21b6:	9a f0       	brmi	.+38     	; 0x21de <pok+0x1de>
    21b8:	39 95       	.word	0x9539	; ????
    21ba:	c9 36       	cpi	r28, 0x69	; 105
    21bc:	6a c6       	rjmp	.+3284   	; 0x2e92 <m+0xc92>
    21be:	0f 65       	ori	r16, 0x5F	; 95
    21c0:	c6 0f       	add	r28, r22
    21c2:	65 ac       	ldd	r6, Z+61	; 0x3d
    21c4:	00 5c       	subi	r16, 0xC0	; 192
    21c6:	a3 ff       	sbrs	r26, 3
    21c8:	53 9a       	sbi	0x0a, 3	; 10
    21ca:	f0 39       	cpi	r31, 0x90	; 144
    21cc:	95 c9       	rjmp	.-3286   	; 0x14f8 <aes_sbox0+0x4f8>
    21ce:	36 6a       	ori	r19, 0xA6	; 166
    21d0:	c9 36       	cpi	r28, 0x69	; 105
    21d2:	6a c6       	rjmp	.+3284   	; 0x2ea8 <m+0xca8>
    21d4:	0f 65       	ori	r16, 0x5F	; 95
    21d6:	ac 00       	.word	0x00ac	; ????
    21d8:	5c a3       	std	Y+36, r21	; 0x24
    21da:	ff 53       	subi	r31, 0x3F	; 63
    21dc:	9a f0       	brmi	.+38     	; 0x2204 <m+0x4>
    21de:	39 95       	.word	0x9539	; ????
    21e0:	f0 39       	cpi	r31, 0x90	; 144
    21e2:	95 c9       	rjmp	.-3286   	; 0x150e <aes_sbox0+0x50e>
    21e4:	36 6a       	ori	r19, 0xA6	; 166
    21e6:	c6 0f       	add	r28, r22
    21e8:	65 ac       	ldd	r6, Z+61	; 0x3d
    21ea:	00 5c       	subi	r16, 0xC0	; 192
    21ec:	a3 ff       	sbrs	r26, 3
    21ee:	53 9a       	sbi	0x0a, 3	; 10
    21f0:	ff 53       	subi	r31, 0x3F	; 63
    21f2:	9a f0       	brmi	.+38     	; 0x221a <m+0x1a>
    21f4:	39 95       	.word	0x9539	; ????
    21f6:	c9 36       	cpi	r28, 0x69	; 105
    21f8:	6a c6       	rjmp	.+3284   	; 0x2ece <m+0xcce>
    21fa:	0f 65       	ori	r16, 0x5F	; 95
    21fc:	ac 00       	.word	0x00ac	; ????
    21fe:	5c a3       	std	Y+36, r21	; 0x24

00002200 <m>:
    2200:	00 0f       	add	r16, r16
    2202:	36 39       	cpi	r19, 0x96	; 150
    2204:	53 5c       	subi	r21, 0xC3	; 195
    2206:	65 6a       	ori	r22, 0xA5	; 165
    2208:	95 9a       	sbi	0x12, 5	; 18
    220a:	a3 ac       	ldd	r10, Z+59	; 0x3b
    220c:	c6 c9       	rjmp	.-3188   	; 0x159a <aes_sbox0+0x59a>
    220e:	f0 ff       	sbrs	r31, 0
	...

00003000 <__prologue_saves__>:
    3000:	2f 92       	push	r2
    3002:	3f 92       	push	r3
    3004:	4f 92       	push	r4
    3006:	5f 92       	push	r5
    3008:	6f 92       	push	r6
    300a:	7f 92       	push	r7
    300c:	8f 92       	push	r8
    300e:	9f 92       	push	r9
    3010:	af 92       	push	r10
    3012:	bf 92       	push	r11
    3014:	cf 92       	push	r12
    3016:	df 92       	push	r13
    3018:	ef 92       	push	r14
    301a:	ff 92       	push	r15
    301c:	0f 93       	push	r16
    301e:	1f 93       	push	r17
    3020:	cf 93       	push	r28
    3022:	df 93       	push	r29
    3024:	cd b7       	in	r28, 0x3d	; 61
    3026:	de b7       	in	r29, 0x3e	; 62
    3028:	ca 1b       	sub	r28, r26
    302a:	db 0b       	sbc	r29, r27
    302c:	0f b6       	in	r0, 0x3f	; 63
    302e:	f8 94       	cli
    3030:	de bf       	out	0x3e, r29	; 62
    3032:	0f be       	out	0x3f, r0	; 63
    3034:	cd bf       	out	0x3d, r28	; 61
    3036:	09 94       	ijmp

00003038 <__epilogue_restores__>:
    3038:	2a 88       	ldd	r2, Y+18	; 0x12
    303a:	39 88       	ldd	r3, Y+17	; 0x11
    303c:	48 88       	ldd	r4, Y+16	; 0x10
    303e:	5f 84       	ldd	r5, Y+15	; 0x0f
    3040:	6e 84       	ldd	r6, Y+14	; 0x0e
    3042:	7d 84       	ldd	r7, Y+13	; 0x0d
    3044:	8c 84       	ldd	r8, Y+12	; 0x0c
    3046:	9b 84       	ldd	r9, Y+11	; 0x0b
    3048:	aa 84       	ldd	r10, Y+10	; 0x0a
    304a:	b9 84       	ldd	r11, Y+9	; 0x09
    304c:	c8 84       	ldd	r12, Y+8	; 0x08
    304e:	df 80       	ldd	r13, Y+7	; 0x07
    3050:	ee 80       	ldd	r14, Y+6	; 0x06
    3052:	fd 80       	ldd	r15, Y+5	; 0x05
    3054:	0c 81       	ldd	r16, Y+4	; 0x04
    3056:	1b 81       	ldd	r17, Y+3	; 0x03
    3058:	aa 81       	ldd	r26, Y+2	; 0x02
    305a:	b9 81       	ldd	r27, Y+1	; 0x01
    305c:	ce 0f       	add	r28, r30
    305e:	d1 1d       	adc	r29, r1
    3060:	0f b6       	in	r0, 0x3f	; 63
    3062:	f8 94       	cli
    3064:	de bf       	out	0x3e, r29	; 62
    3066:	0f be       	out	0x3f, r0	; 63
    3068:	cd bf       	out	0x3d, r28	; 61
    306a:	ed 01       	movw	r28, r26
    306c:	08 95       	ret

0000306e <memcpy>:
    306e:	fb 01       	movw	r30, r22
    3070:	dc 01       	movw	r26, r24
    3072:	02 c0       	rjmp	.+4      	; 0x3078 <memcpy+0xa>
    3074:	01 90       	ld	r0, Z+
    3076:	0d 92       	st	X+, r0
    3078:	41 50       	subi	r20, 0x01	; 1
    307a:	50 40       	sbci	r21, 0x00	; 0
    307c:	d8 f7       	brcc	.-10     	; 0x3074 <memcpy+0x6>
    307e:	08 95       	ret

00003080 <__eerd_byte_m163>:
    3080:	e1 99       	sbic	0x1c, 1	; 28
    3082:	fe cf       	rjmp	.-4      	; 0x3080 <__eerd_byte_m163>
    3084:	9f bb       	out	0x1f, r25	; 31
    3086:	8e bb       	out	0x1e, r24	; 30
    3088:	e0 9a       	sbi	0x1c, 0	; 28
    308a:	99 27       	eor	r25, r25
    308c:	8d b3       	in	r24, 0x1d	; 29
    308e:	08 95       	ret

00003090 <__eewr_byte_m163>:
    3090:	26 2f       	mov	r18, r22

00003092 <__eewr_r18_m163>:
    3092:	e1 99       	sbic	0x1c, 1	; 28
    3094:	fe cf       	rjmp	.-4      	; 0x3092 <__eewr_r18_m163>
    3096:	9f bb       	out	0x1f, r25	; 31
    3098:	8e bb       	out	0x1e, r24	; 30
    309a:	2d bb       	out	0x1d, r18	; 29
    309c:	0f b6       	in	r0, 0x3f	; 63
    309e:	f8 94       	cli
    30a0:	e2 9a       	sbi	0x1c, 2	; 28
    30a2:	e1 9a       	sbi	0x1c, 1	; 28
    30a4:	0f be       	out	0x3f, r0	; 63
    30a6:	01 96       	adiw	r24, 0x01	; 1
    30a8:	08 95       	ret

000030aa <_exit>:
    30aa:	f8 94       	cli

000030ac <__stop_program>:
    30ac:	ff cf       	rjmp	.-2      	; 0x30ac <__stop_program>

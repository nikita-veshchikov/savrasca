/* gf256mul.S */

#include <avr/io.h>
#define OPTIMIZE_SMALL_A

/*
 * param a: r24
 * param b: r22
 * param reducer: r20
 */
A = 23
B = 22
P = 24
.global gf256mul

#ifdef OPTIMIZE_SMALL_A
gf256mul:
	mov A, r24
	clr r24
1:	
	lsr A
	breq 4f
	brcc 2f
	eor P, B
2:
	lsl B
	brcc 3f
	eor B, r20	
3:
	rjmp 1b
4:
	brcc 2f
	eor P, B
2:
	ret

#else

gf256mul:
	mov r21, r24
	clr r24
	ldi r25, 8
1:	
	lsr A
	brcc 2f
	eor P, B
2:
	lsl B
	brcc 3f
	eor B, r20	
3:
	dec r25
	brne 1b
	ret

#endif

// modified from examples/atmega128_timer/main.c!
#include <avr/interrupt.h>

volatile int timer2_ticks;

/* Every ~ms */
ISR(TIMER2_COMP_vect) {
   timer2_ticks++;
}

int main(void) {
  volatile int tmp;

  /* Set up our timers and enable interrupts */
  TCNT2 = 0;   /* Timer 2 by CLK/64 */
  OCR2 = 124;  /* ~2ms on 4MHz */
  TCCR2 = 0x0b;
  TIMSK = _BV(OCIE2);
  DDRA = 0x01;
  PORTA = 0;

  sei();

  tmp = timer2_ticks;
  while(1) {
    if(tmp != timer2_ticks) { // toggle about every 2ms
      tmp = timer2_ticks;
      if((PINA & 0x01) == 0x01) {
        PORTA &= 0xfe;
      } else {
        PORTA |= 0x01;
      }
    } 
  }

  return 0;
}

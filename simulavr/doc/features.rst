Features
========

What features are new:

* Run multiple AVR devices in one simulation. (only with interpreter
  interfaces or special application linked against simulavr library) Multiple
  cores can run where each has a different clock frequency.
* Connect multiple AVR core pins to other devices like LCD, LED and
  others. (environment)
* Connect multiple AVR cores to multiple avr-gdb instances. (each on its
  own socket/port number, but see first point for running multiple avr cores)
* Write simulation scripts in Tcl/Tk or Python, other languages could be
  added by simply adding swig scripts!
* Tracing the execution of the program, these traces support all debugging
  information directly from the ELF-file.
* The traces run step by step for each device so you see all actions
  in the multiple devices in time-correct order.
* Every interrupt call is visible.
* Interrupt statistics with latency, longest and shortest execution
  time and some more.
* There is a simple text based UI interface to add LCD, switches,
  LEDs or other components and can modify it during simulation, so there
  is no longer a need to enter a pin value during execution. (Tcl/Tk based)
* Execution timing should be nearly accurate, different access
  times for internal RAM / external RAM / EEPROM and other hardware
  components are simulated.
* A pseudo core hardware component is introduced to do "printf"
  debugging. This "device" is connected to a normal named UNIX socket so
  you do not have to waste a UART or other hardware in your test environment. (How?)
* ELF-file loading is supported, no objcopy needed anymore.
* Execution speed is tuned a lot, most hardware simulations are now
  only done if needed.
* External IO pins which are not ports are also available. (E.g. ADC7 and
  ADC8 on ATmega8 in TQFP package.)
* External I/O and some internal states of hardware units (link prescaler
  counter and interrupt states) can be dumped ot into a VCD trace to analyse I/O
  behaviour and timing. Or you can use it for tests.


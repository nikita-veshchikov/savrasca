ARCH=atmega16

CC=avr-gcc -g -mmcu=$(ARCH)
AS=avr-gcc -g -c -mmcu=$(ARCH) -x assembler-with-cpp -lm
OBJCOPY=avr-objcopy
SIZE=avr-size

CFLAGS=-Wall -I. -O2 -mcall-prologues
ASFLAGS=-Wall -I. -O2 

#CFLAGS=-Wall -I. -O0 -mcall-prologues
#ASFLAGS=-Wall -I. -O0 

CSRC= \
	main.c \
	aes_enc.c \
	aes_keyschedule.c \
	aes256_enc.c


SSRC= \
	gf256mul.S \
	aes_sbox-asm.S \

OBJ=$(CSRC:.c=.o) $(SSRC:.S=.o)

SLOCFILES = io.S main.c main.h \
	aes.c aes.h \
	aes_enc.c aes_enc.h \
	aes_keyschedule.c aes_keyschedule.h aes_sbox.h \
	aes256_enc.c aes256_enc.h \
	types.h iomacros.h\
	usr/lib/avr/include/avr/delay.h\

CALLTREEFILES = main.c \
	aes.c \
	aes_enc.c \
	aes_keyschedule.c \
	aes256_enc.c 


all: dpa4

dpa4: $(OBJ)
	$(CC) $(CFLAGS) -lc -lm -Wl,-Map,dpa4.map -o dpa4 $(OBJ) -lm
	$(SIZE) dpa4
	avr-gcc -g -mmcu=atmega163 -o dpa4.elf main.o aes_enc.o aes_keyschedule.o aes256_enc.o gf256mul.o aes_sbox-asm.o 
	#avr-gcc -fverbose-asm -mmcu=atmega163 -o aes_enc.S -S aes_enc.c 
	$(OBJCOPY) -O binary dpa4 dpa4.bin
	$(OBJCOPY) -O ihex dpa4 dpa4.hex

sloc:
	@echo
	@echo Lines of code
	@sloccount $(SLOCFILES) | grep -A 1000 "SLOC-by-Language" | grep -v "^$$"

calltree:
	@echo
	@echo Calltree
	@/opt/schily/bin/calltree -m -I. -I/opt/avrgcc/avr/include/ -I/usr/lib/avr/include/ -D__AVR_ATmega163__ $(CALLTREEFILES)

calldepth:
	@echo
	@echo Calldepth
	@/opt/schily/bin/calltree -m -I. -I/opt/avrgcc/avr/include/ -I/usr/lib/avr/include/ -D__AVR_ATmega163__ $(CALLTREEFILES) | sed -e "s/[^ ].*$$//" -e "s/    /#/g" -e "s/#/1/" -e "s/#/2/" -e "s/#/3/" -e "s/#/4/" -e "s/#/5/" -e "s/#/6/" -e "s/#/7/" -e "s/#/8/" -e "s/#/9/" -e "s/#/0/" | sort | tail -1

uncalled:
	@echo
	@echo Uncalled
	@/opt/schily/bin/calltree -u -I. -I/opt/avrgcc/avr/include/ -I/usr/lib/avr/include/ -D__AVR_ATmega163__ $(CALLTREEFILES)

statistics: sloc calldepth uncalled

clean: clean-dpa4
	rm -rf core

clean-dpa4:
	rm -rf $(OBJ) dpa4 dpa4.bin dpa4.hex dpa4.map


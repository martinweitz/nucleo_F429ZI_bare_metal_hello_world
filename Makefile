CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -g -c -mcpu=$(MACH) -mthumb -mfloat-abi=soft -std=gnu11 -Wall -O0
LDFLAGS= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=nano.specs -T stm32_ls.ld -Wl,-Map=final.map
LDFLAGS_SH= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=rdimon.specs -T stm32_ls.ld -Wl,-Map=final_sh.map

all:main.o stm32_startup.o syscalls.o final.elf

semi:main.o stm32_startup.o final_sh.elf

main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^

stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^

syscalls.o:syscalls.c
	$(CC) $(CFLAGS) -o $@ $^

final.elf: main.o stm32_startup.O syscalls.o
	$(CC) $(LDFLAGS) -o $@ $^

final_sh.elf: main.o stm32_startup.O
	$(CC) $(LDFLAGS_SH) -o $@ $^

clean:
	rm -rf *.o *.elf *.map

load:
	openocd -f board/st_nucleo_f4.cfg

flash: all
	openocd -f board/st_nucleo_f4.cfg -c "program final.elf verify reset exit"

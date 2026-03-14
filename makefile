CC=arm-none-eabi-gcc
CFLAGS=-mcpu=cortex-m33 -mthumb
CPPFLAGS=-DSTM32L552xx \
	 -Iinclude/STM \
	 -Iinclude/CMSIS

LINKER_FILE=STM32L552xE_FLASH_ns.ld
LDFLAGS=-T $(LINKER_FILE) -specs=nosys.specs
PROGRAMMER=openocd
PROGRAMMER_FLAGS=-f interface/stlink.cfg -f target/stm32l5x.cfg

all: blink.elf

blink.elf: main.o startup.o system_stm32l5xx.o
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $^ -o executable.elf

main.o: main.c
	$(CC) $(CFLAGS) $(CPPFLAGS) main.c -c -g

startup.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c startup_stm32l552xx.s -o startup.o

system_stm32l5xx.o: system_stm32l5xx.c
	$(CC) $(CFLAGS) $(CPPFLAGS) system_stm32l5xx.c -c -g

.PHONY: clean
clean:
	rm -f *.o *.elf *.bin

flash: blink.elf
	$(PROGRAMMER) $(PROGRAMMER_FLAGS) -c "program executable.elf verify reset exit"

flash_dfu: executable.bin
	-dfu-util -a 0 -i 0 -s 0x08000000:leave -D executable.bin -w

executable.bin:
	arm-none-eabi-objcopy -O binary executable.elf executable.bin

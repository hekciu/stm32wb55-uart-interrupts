main.o: main.c
	arm-none-eabi-gcc -mcpu=cortex-m4 main.c -c -o main.o

firmware.elf: main.o
	arm-none-eabi-gcc -T link.ld -nostdlib main.o -o firmware.elf

firmware.bin: firmware.elf
	arm-none-eabi-objcopy -O binary firmware.elf firmware.bin

firmware.s: main.c
	arm-none-eabi-gcc -mcpu=cortex-m4 main.c -S -o firmware.s

.PHONY: build flash clean assembly

build: firmware.bin

assembly: firmware.s

flash:
	st-flash --reset write firmware.bin 0x8000000

clean:
	rm -f -- main.o firmware.elf firmware.bin firmware.s

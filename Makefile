SRCS = $(shell find -name '*.c')
OBJS = $(addsuffix .o,$(basename $(SRCS)))

CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld

CFLAGS = -nostdlib
LDFLAGS = -Tlinker_script.ld

firmware: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

.PHONY: clean
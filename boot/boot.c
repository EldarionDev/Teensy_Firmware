#include <stdint.h>

extern unsigned long _startup_function;
extern unsigned long _image_size;

uint32_t boot_data[3] __attribute__((section(".boot_data")))= {
    0x60000000,
    &_image_size,
    0
};

uint32_t ivt[8] __attribute__((section(".ivt")))= {
    0x432000D1,
    &_startup_function,
    0,
    0,
    (uint32_t)&boot_data,
    (uint32_t)ivt,
    0,
    0
};  
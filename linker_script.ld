MEMORY {
    FLASH(rx): ORIGIN = 0x60000000, LENGTH = 8M
    OCRAM(rwx): ORIGIN = 0x20200000, LENGTH = 512K
}

ENTRY(start)

SECTIONS 
{
    .data :
    {
        . = ORIGIN(FLASH) + 4K;
        *(.ivt)
        . = ALIGN(4);
        KEEP(*(.ivt));
        *(.boot_data)
        KEEP(*(.boot_data));
        *(.data)
    } > FLASH

    .text :
    {
        . = ALIGN(4);
        _startup_function = .;
        *(.startup)
        KEEP(*(.startup));
        *(.text)
    } > OCRAM AT> FLASH

    .bss :
    {
        __bss_start__ = .;
        *(.bss)
        __bss_end__ = .;
    } > OCRAM

    _image_size = SIZEOF(.data) + SIZEOF(.text);
} 
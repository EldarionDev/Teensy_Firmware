Entry(start)

MEMORY 
{
    FLASH(rx): ORIGIN = 0x0, LENGTH = 8M
    OCRAM2(rwx): ORIGIN = 0x20200000, LENGTH = 512K
}

SECTIONS 
{
    .ivt: 
    {
        . = 0x0
        *(.ivt)
    } > FLASH

    .flashconfig:
    {
        . = 0x400
        *(.flashconfig)
    } > FLASH

    .data:
    {
        .= 0x658
        *(.data)
    }

    .text: 
    {
        *(.bootdata)
        *(.text)
        *(.rodata)
    } > OCRAM2 > AT > FLASH

    .bss:
    {
        *(.bss)
    } > OCRAM2 > AT > FLASH
}
#include "UART.h"

void UartInit(void)
{
    TR1 = 0;
    TMOD = 0x20;
    SCON = 0x50;
    TH1 = 0xFD;
    TL1 = TH1;
    PCON = 0x00;
    EA = 1;
    ES = 1;
    TR1 = 1;
}
char putchar(char c)
{
    UartInit();
    ES = 0;
    SBUF = c;
    while (TI == 0)
        ;
    TI = 0;
    ES = 1;
    return 0;
}

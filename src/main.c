#include <REG52.h>
#include "UART.h"
bit flag = 1;
sbit LED = P0 ^ 1;
void main()
{
    UartInit();
    while (1)
    {
        if (flag)
        {
            printf("Hello World!");
            LED = ~LED;
            flag = ~flag;
        }
    }
}

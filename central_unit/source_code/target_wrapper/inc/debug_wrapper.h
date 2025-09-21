#ifndef DEBUG_WRAPPER_H_
#define DEBUG_WRAPPER_H_

#include "uart.h"

#define DEBUG_PRINT_LEN (100u)
#define DEBUG_LEVEL_0   (0u)
#define DEBUG_LEVEL_1   (1u)
#define DEBUG_LEVEL_2   (2u)
#define DEBUG_LEVEL_3   (3u)
#define DEBUG_LEVEL_4   (4u)
#define DEBUG_LEVEL_5   (5u)
#define DEBUG_LEVEL_MAX DEBUG_LEVEL_5

#ifndef NDEBUG
    #define DEBUG_LEVEL (DEBUG_LEVEL_MAX + 1)
#else
    #define DEBUG_LEVEL     DEBUG_LEVEL_0
#endif

#if (DEBUG_LEVEL > DEBUG_LEVEL_MAX)
    #error "DEBUG_LEVEL is beyond DEBUG_LEVEL_MAX"
#endif

#define UART_SEND(...) do{    \
    char buff[DEBUG_PRINT_LEN];             \
    int len;                                \
    len = sprintf(buff, __VA_ARGS__);       \ 
    if(len)  uart_send(buff, strlen(buff)); \
}while(0)

#define DEBUG_PRINT(DEBUG_LEVEL_IN,...) ((DEBUG_LEVEL_IN <= DEBUG_LEVEL)) ? UART_SEND( __VA_ARGS__):;


#endif
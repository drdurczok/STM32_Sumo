#ifndef STM32_STARTUP_H
#define STM32_STARTUP_H

#include "stm32f4xx_hal.h"

void init_STM();

void SystemClock_Config(void);

void Error_Handler(void);


#endif /* STM32_STARTUP_H */

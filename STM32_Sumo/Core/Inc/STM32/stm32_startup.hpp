/*
 * STM32_Startup.h
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#ifndef INC_STM32_STARTUP_HPP_
#define INC_STM32_STARTUP_HPP_

extern "C"{
	#include <Pixels.h>
}

#include "stm32f4xx_hal.h"

#include <stm32_config.hpp>
#include <stm32_handlers.hpp>

#include "SensorModule.h"

void STM32_init();

void SystemClock_Config(void);
void MX_GPIO_Init(void);

void MX_USART1_UART_Init(void);
void MX_USART2_UART_Init(void);
void MX_USART6_UART_Init(void);

void Sensors_init(void);
void WS2812B_init(void);

void Sensors_run(void);

#endif /* INC_STM32_STARTUP_HPP_ */

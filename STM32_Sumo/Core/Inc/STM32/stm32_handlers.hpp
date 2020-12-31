/*
 * stm32_handlers.hpp
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#ifndef INC_STM32_STM32_HANDLERS_HPP_
#define INC_STM32_STM32_HANDLERS_HPP_

#include <stm32_config.hpp>

void STM32_run();

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *);

void Error_Handler(void);

#endif

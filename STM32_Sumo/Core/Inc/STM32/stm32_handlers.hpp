/*
 * stm32_handlers.hpp
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#ifndef INC_STM32_STM32_HANDLERS_HPP_
#define INC_STM32_STM32_HANDLERS_HPP_

#include <stm32_config.hpp>


extern "C" {
	#include <ws2812b.h>
}


void STM32_run();

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *);

void ws2812b_handle();
void DMA_TransferCompleteHandler(DMA_HandleTypeDef *DmaHandle);
void DMA_TransferHalfHandler(DMA_HandleTypeDef *DmaHandle);
void DMA_TransferError(DMA_HandleTypeDef *DmaHandle);

void Error_Handler(void);

#endif

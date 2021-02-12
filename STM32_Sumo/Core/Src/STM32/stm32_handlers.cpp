/*
 * stm32_handlers.cpp
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#include <stm32_handlers.hpp>

extern UART_HandleTypeDef huart2;				// TX - PA2  RX - PA3
extern UART_HandleTypeDef huart6;				// TX - PC6  RX - PC7
extern UART_HandleTypeDef huart1;				// TX - PA9  RX - PA10

uint8_t UART1_Message;
uint8_t UART2_Message;
uint8_t UART6_Message;

void STM32_run(){
	HAL_UART_Receive_IT(&huart2, &UART2_Message, 1);			// Start UART interrupt - feedback from ESC.
	HAL_UART_Receive_IT(&huart6, &UART6_Message, 1);			// Start UART interrupt - feedback from ESC.
	HAL_UART_Receive_IT(&huart1, &UART1_Message, 1);
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart){
	if (huart->Instance == USART2){
		HAL_UART_Receive_IT(&huart2, &UART2_Message, 1);
	}
	else if (huart->Instance == USART6){
		HAL_UART_Receive_IT(&huart6, &UART6_Message, 1);
	}
	else if (huart->Instance == USART1){
		HAL_UART_Receive_IT(&huart1, &UART1_Message, 1);
	}
}


void Error_Handler(void){
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1){

	}
}

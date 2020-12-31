#include "main.h"

#include "stm32_startup.hpp"

extern UART_HandleTypeDef huart2;

int main(void) {
	STM32_init();
	STM32_run();

	uint8_t UART = '0';
	while(1){
		HAL_UART_Transmit(&huart2, &UART, 1, 1000);
		HAL_Delay(500);
	}
}



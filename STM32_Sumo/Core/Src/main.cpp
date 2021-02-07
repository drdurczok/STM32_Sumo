#include "main.h"

#include "stm32_startup.hpp"

extern UART_HandleTypeDef huart2;
extern uint8_t UART2_Message;

/*________NEO___________*/


void pixels_startup(){
	/*
	blinkHandle(0,127,0);
	HAL_Delay(1000);
	blinkHandle(127,0,0);
	HAL_Delay(1000);
	blinkHandle(0,0,127);
	HAL_Delay(1000);
	*/

	for (uint8_t k = 0; k < 5; k++){
		for(uint8_t i = 0; i < 8; i++){
			HAL_Delay(75);
			wheelHandle(127,100,100);
		}
	}

	HAL_Delay(75);
	clearHandle();

	for(uint8_t i = 0; i < 8; i++){
		HAL_Delay(75);
		loadHandle(50,100,127);
	}
	HAL_Delay(1000);
	for(uint8_t i = 0; i < 8; i++){
		HAL_Delay(75);
		loadHandle(0,0,0);
	}
	HAL_Delay(75);

}

/*______________________*/


int main(void) {
	STM32_init();
	STM32_run();

	pixels_startup();

	uint8_t UART = '0';
	while(1){
		HAL_UART_Transmit(&huart2, &UART, 1, 1000);
		HAL_Delay(75);

	}
}



#include "main.h"
#include "STM32_Startup.cpp"

int main(void) {
	STM32_init();

	static unsigned short pin_state = 0;
	while (1){
		pin_state = !pin_state;
		HAL_GPIO_WritePin(LED_GPIO_Port, LED_Pin, pin_state);
		HAL_Delay(500);
	}
}



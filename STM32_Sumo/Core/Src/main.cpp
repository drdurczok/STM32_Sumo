#include "main.h"

#include "stm32_startup.hpp"

extern UART_HandleTypeDef huart1;

void run();

int main(void) {
	STM32_init();
	STM32_run();

	pixels_startup();

	HAL_Delay(10000);
	while(1){
		run();
	}
}


// SUMO Robot Main Loop
#include <string>

#include "OpponentDetection.h"
OpponentDetection opp = OpponentDetection();

void run(){
	opp.calculateOpponentPosition();

	uint16_t timestamp = 10;
	uint16_t oppDist   = opp.getOpponentDistance();
	int16_t  oppAngle  = opp.getOpponentAngle();
	std::string message = "ST" + std::to_string(timestamp)
					   + "OD" + std::to_string(oppDist)
					   + "OA" + std::to_string(oppAngle) + "E";

	//message.append("\n");
	uint8_t buffer_size = message.size();
	const uint8_t* buffer = reinterpret_cast<const uint8_t*>(message.c_str());
	HAL_UART_Transmit_IT(&huart1, (uint8_t*)buffer, buffer_size);

	HAL_Delay(2000);
}



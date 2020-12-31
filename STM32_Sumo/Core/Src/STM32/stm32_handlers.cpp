/*
 * stm32_handlers.cpp
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#include "stm32_handlers.hpp"

void Error_Handler(void){
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1){
	}
}

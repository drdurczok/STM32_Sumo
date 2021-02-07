/*
 * Config.h
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#ifndef INC_STM32_CONFIG_HPP_
#define INC_STM32_CONFIG_HPP_

#include "stm32f4xx_hal.h"

#define LED_Pin GPIO_PIN_5
#define LED_GPIO_Port GPIOA






/*-----------------------------------------------------------------------*/
/*---------------------------Pixel Configuration-------------------------*/
/*-----------------------------------------------------------------------*/
#define WS2812B_Pin GPIO_PIN_0
#define WS2812B_Port GPIOC

// How many LEDs are in the series - only valid multiples by two
#define WS2812B_NUMBER_OF_LEDS 8


/*-----------------------------------------------------------------------*/
/*---------------------------Pixel Configuration End---------------------*/
/*-----------------------------------------------------------------------*/


#endif /* INC_STM32_CONFIG_HPP_ */

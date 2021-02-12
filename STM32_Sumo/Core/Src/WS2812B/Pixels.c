#include "stm32f4xx_hal.h"
#include <stdlib.h>


#include <ws2812b.h>

extern WS2812_Struct ws2812b;

// RGB Frame buffers
uint8_t frameBuffer[3*WS2812B_NUMBER_OF_LEDS];

uint8_t prev_pixel = WS2812B_NUMBER_OF_LEDS;
uint8_t current_pixel = 0;
uint8_t next_pixel = 1;

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

void clear_pixels(){
	for (uint8_t i = 0; i < WS2812B_NUMBER_OF_LEDS; i++){
		frameBuffer[i*3 + 0] = 0;
		frameBuffer[i*3 + 1] = 0;
		frameBuffer[i*3 + 2] = 0;
	}
}

void blinkHandle(uint8_t r, uint8_t g, uint8_t b){
	if(ws2812b.transferComplete){
		for (uint8_t i = 0; i < WS2812B_NUMBER_OF_LEDS; i++){
			frameBuffer[i*3 + 0] = r;
			frameBuffer[i*3 + 1] = g;
			frameBuffer[i*3 + 2] = b;
		}

		ws2812b.startTransfer = 1;
		ws2812b_handle();
	}
}

void wheelHandle(uint8_t r, uint8_t g, uint8_t b){
	if(ws2812b.transferComplete){
		clear_pixels();

		frameBuffer[prev_pixel*3 + 0] = r/3;
		frameBuffer[prev_pixel*3 + 1] = g/3;
		frameBuffer[prev_pixel*3 + 2] = b/3;

		frameBuffer[current_pixel*3 + 0] = r;
		frameBuffer[current_pixel*3 + 1] = g;
		frameBuffer[current_pixel*3 + 2] = b;

		frameBuffer[next_pixel*3 + 0] = r/3;
		frameBuffer[next_pixel*3 + 1] = g/3;
		frameBuffer[next_pixel*3 + 2] = b/3;

		prev_pixel++;
		current_pixel++;
		next_pixel++;

		if (prev_pixel >= WS2812B_NUMBER_OF_LEDS){
			prev_pixel = 0;
		}
		if (current_pixel >= WS2812B_NUMBER_OF_LEDS){
			current_pixel = 0;
		}
		if (next_pixel >= WS2812B_NUMBER_OF_LEDS){
			next_pixel = 0;
		}

		// Signal that buffer is changed and transfer new data
		ws2812b.startTransfer = 1;
		ws2812b_handle();
	}
}

void loadHandle(uint8_t r, uint8_t g, uint8_t b){
	if(ws2812b.transferComplete){
		frameBuffer[current_pixel*3 + 0] = r;
		frameBuffer[current_pixel*3 + 1] = g;
		frameBuffer[current_pixel*3 + 2] = b;

		current_pixel++;

		if (current_pixel >= WS2812B_NUMBER_OF_LEDS){
			current_pixel = 0;
		}

		// Signal that buffer is changed and transfer new data
		ws2812b.startTransfer = 1;
		ws2812b_handle();
	}
}

void PixelsInit(){
	ws2812b.item.channel = 0;

	// Your RGB frame buffer
	ws2812b.item.frameBufferPointer = frameBuffer;
	// RAW size of frame buffer
	ws2812b.item.frameBufferSize = sizeof(frameBuffer);

	ws2812b_init();

	clear_pixels();
}


void clearHandle(){
	if(ws2812b.transferComplete){
		clear_pixels();
		// Signal that buffer is changed and transfer new data
		ws2812b.startTransfer = 1;
		ws2812b_handle();
	}
}



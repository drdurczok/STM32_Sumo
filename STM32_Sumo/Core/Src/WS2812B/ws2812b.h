#ifndef WS2812B_H_
#define WS2812B_H_
#include "ws2812b.h"

// LED output port
#define WS2812B_PORT GPIOC
// LED output pins
#define WS2812B_PIN GPIO_PIN_0
// How many LEDs are in the series - only valid multiples by two
#define WS2812B_NUMBER_OF_LEDS 8



void ws2812b_init();
void ws2812b_handle();

// This value sets number of periods to generate 50uS Treset signal
#define WS2812_RESET_PERIOD 50

typedef struct WS2812_BufferItem {
	uint8_t* frameBufferPointer;
	uint32_t frameBufferSize;
	uint32_t frameBufferCounter;
	uint8_t channel;	// digital output pin/channel
} WS2812_BufferItem;



typedef struct WS2812_Struct
{
	WS2812_BufferItem item;
	uint8_t transferComplete;
	uint8_t startTransfer;
	uint32_t timerPeriodCounter;
	uint32_t repeatCounter;
} WS2812_Struct;

// Bit band stuff
#define RAM_BASE 0x20000000
#define RAM_BB_BASE 0x22000000
#define BITBAND_SRAM(address, bit) ( (uint32_t *) (RAM_BB_BASE + (((uint32_t)address) - RAM_BASE) * 32 + (bit) * 4))

static void ws2812b_set_pixel(uint8_t row, uint16_t column, uint8_t red, uint8_t green, uint8_t blue);
void DMA_TransferCompleteHandler(DMA_HandleTypeDef *DmaHandle);
void DMA_TransferHalfHandler(DMA_HandleTypeDef *DmaHandle);
void DMA_TransferError(DMA_HandleTypeDef *DmaHandle);

#endif /* WS2812B_H_ */

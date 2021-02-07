#include <string.h>

#include "stm32f4xx_hal.h"
#include "ws2812b.h"

WS2812_Struct ws2812b;

// Define source arrays for DMA
uint32_t WS2812_IO_High[] =  { WS2812B_PIN };
uint32_t WS2812_IO_Low[] = {WS2812B_PIN << 16};

// WS2812 frame buffer - buffer for 2 LEDs - two times 24 bits
uint16_t ws2812bDmaBitBuffer[24 * 2];

// Gamma correction table
const uint8_t gammaTable[] = {
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,
    2,  3,  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  5,  5,  5,
    5,  6,  6,  6,  6,  7,  7,  7,  7,  8,  8,  8,  9,  9,  9, 10,
   10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 16,
   17, 17, 18, 18, 19, 19, 20, 20, 21, 21, 22, 22, 23, 24, 24, 25,
   25, 26, 27, 27, 28, 29, 29, 30, 31, 32, 32, 33, 34, 35, 35, 36,
   37, 38, 39, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 50,
   51, 52, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68,
   69, 70, 72, 73, 74, 75, 77, 78, 79, 81, 82, 83, 85, 86, 87, 89,
   90, 92, 93, 95, 96, 98, 99,101,102,104,105,107,109,110,112,114,
  115,117,119,120,122,124,126,127,129,131,133,135,137,138,140,142,
  144,146,148,150,152,154,156,158,160,162,164,167,169,171,173,175,
  177,180,182,184,186,189,191,193,196,198,200,203,205,208,210,213,
  215,218,220,223,225,228,231,233,236,239,241,244,247,249,252,255 };

TIM_HandleTypeDef    TIM1_handle;
TIM_OC_InitTypeDef tim2OC1;
TIM_OC_InitTypeDef tim2OC2;

uint32_t tim_period;
uint32_t timer_reset_pulse_period;


DMA_HandleTypeDef     dmaUpdate;
DMA_HandleTypeDef     dmaCC1;
DMA_HandleTypeDef     dmaCC2;
#define BUFFER_SIZE		(sizeof(ws2812bDmaBitBuffer)/sizeof(uint16_t))



static void loadNextFramebufferData(WS2812_BufferItem *bItem, uint32_t row){

	uint32_t r = bItem->frameBufferPointer[bItem->frameBufferCounter++];
	uint32_t g = bItem->frameBufferPointer[bItem->frameBufferCounter++];
	uint32_t b = bItem->frameBufferPointer[bItem->frameBufferCounter++];

	if(bItem->frameBufferCounter == bItem->frameBufferSize)
		bItem->frameBufferCounter = 0;

	ws2812b_set_pixel(bItem->channel, row, r, g, b);
}


// Transmit the framebuffer
static void WS2812_sendbuf(){
	// transmission complete flag
	ws2812b.transferComplete = 0;

	ws2812b.item.frameBufferCounter = 0;

	loadNextFramebufferData(&ws2812b.item, 0); // ROW 0
	loadNextFramebufferData(&ws2812b.item, 1); // ROW 1


	// clear all DMA flags
	__HAL_DMA_CLEAR_FLAG(&dmaUpdate, DMA_FLAG_TCIF1_5 | DMA_FLAG_HTIF1_5 | DMA_FLAG_TEIF1_5);
	__HAL_DMA_CLEAR_FLAG(&dmaCC1, DMA_FLAG_TCIF1_5 | DMA_FLAG_HTIF1_5 | DMA_FLAG_TEIF1_5);
	__HAL_DMA_CLEAR_FLAG(&dmaCC2, DMA_FLAG_TCIF2_6 | DMA_FLAG_HTIF2_6 | DMA_FLAG_TEIF2_6);



	// configure the number of bytes to be transferred by the DMA controller
	dmaUpdate.Instance->NDTR = BUFFER_SIZE;
	dmaCC1.Instance->NDTR = BUFFER_SIZE;
	dmaCC2.Instance->NDTR = BUFFER_SIZE;

	// clear all TIM2 flags
	__HAL_TIM_CLEAR_FLAG(&TIM1_handle, TIM_FLAG_UPDATE | TIM_FLAG_CC1 | TIM_FLAG_CC2 | TIM_FLAG_CC3 | TIM_FLAG_CC4);

	// enable DMA channels
	__HAL_DMA_ENABLE(&dmaUpdate);
	__HAL_DMA_ENABLE(&dmaCC1);
	__HAL_DMA_ENABLE(&dmaCC2);

	// IMPORTANT: enable the TIM2 DMA requests AFTER enabling the DMA channels!
	__HAL_TIM_ENABLE_DMA(&TIM1_handle, TIM_DMA_UPDATE);
	__HAL_TIM_ENABLE_DMA(&TIM1_handle, TIM_DMA_CC1);
	__HAL_TIM_ENABLE_DMA(&TIM1_handle, TIM_DMA_CC2);

	TIM1->CNT = tim_period-1;

	// start TIM2
	__HAL_TIM_ENABLE(&TIM1_handle);
}


void DMA_TransferError(DMA_HandleTypeDef *DmaHandle){
	volatile int i = 0;
	i++;
}


void DMA_TransferHalfHandler(DMA_HandleTypeDef *DmaHandle){
	// Is this the last LED?
	if(ws2812b.repeatCounter == WS2812B_NUMBER_OF_LEDS)
	 {

		// If this is the last pixel, set the next pixel value to zeros, because
		// the DMA would not stop exactly at the last bit.
		ws2812b_set_pixel(0, 0, 0, 0, 0);

	} else {
		loadNextFramebufferData(&ws2812b.item, 0);

		ws2812b.repeatCounter++;
	}

}

void DMA_TransferCompleteHandler(DMA_HandleTypeDef *DmaHandle){
	if(ws2812b.repeatCounter == WS2812B_NUMBER_OF_LEDS){
		// Transfer of all LEDs is done, disable DMA but enable tiemr update IRQ to stop the 50us pulse
		ws2812b.repeatCounter = 0;

		// Stop timer
		TIM1->CR1 &= ~TIM_CR1_CEN;

		// Disable DMA
		__HAL_DMA_DISABLE(&dmaUpdate);
		__HAL_DMA_DISABLE(&dmaCC1);
		__HAL_DMA_DISABLE(&dmaCC2);

		// Disable the DMA requests
		__HAL_TIM_DISABLE_DMA(&TIM1_handle, TIM_DMA_UPDATE);
		__HAL_TIM_DISABLE_DMA(&TIM1_handle, TIM_DMA_CC1);
		__HAL_TIM_DISABLE_DMA(&TIM1_handle, TIM_DMA_CC2);

		// Set 50us period for Treset pulse
		//TIM2->PSC = 1000; // For this long period we need prescaler 1000
		TIM1->ARR = timer_reset_pulse_period;
		// Reset the timer
		TIM1->CNT = 0;

		// Generate an update event to reload the prescaler value immediately
		TIM1->EGR = TIM_EGR_UG;
		__HAL_TIM_CLEAR_FLAG(&TIM1_handle, TIM_FLAG_UPDATE);

		// Enable TIM2 Update interrupt for 50us Treset signal
		__HAL_TIM_ENABLE_IT(&TIM1_handle, TIM_IT_UPDATE);
		// Enable timer
		TIM1->CR1 |= TIM_CR1_CEN;

		// Manually set outputs to low to generate 50us reset impulse
		WS2812B_PORT->BSRR = WS2812_IO_Low[0];
	}
	else {
		// Load bitbuffer with next RGB LED values
		loadNextFramebufferData(&ws2812b.item, 1);
		ws2812b.repeatCounter++;
	}
}

void DMA2_Stream2_IRQHandler(void){
	// Check the interrupt and clear flag
	  HAL_DMA_IRQHandler(&dmaCC2);
}

void TIM1_UP_TIM10_IRQHandler(void){
	HAL_TIM_IRQHandler(&TIM1_handle);
}

// TIM2 Interrupt Handler gets executed on every TIM2 Update if enabled
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim){

    ws2812b.timerPeriodCounter = 0;
    TIM1->CR1 = 0; // disable timer

    // disable the TIM2 Update IRQ
    __HAL_TIM_DISABLE_IT(&TIM1_handle, TIM_IT_UPDATE);

    // Set back 1,25us period
    TIM1->ARR = tim_period;

    // Generate an update event to reload the Prescaler value immediatly
    TIM1->EGR = TIM_EGR_UG;
    __HAL_TIM_CLEAR_FLAG(&TIM1_handle, TIM_FLAG_UPDATE);

    // set transfer_complete flag
    ws2812b.transferComplete = 1;

}



static void ws2812b_set_pixel(uint8_t row, uint16_t column, uint8_t red, uint8_t green, uint8_t blue){
	// Apply gamma
	red = gammaTable[red];
	green = gammaTable[green];
	blue = gammaTable[blue];


	uint32_t calcCol = (column*24);
	uint32_t invRed = ~red;
	uint32_t invGreen = ~green;
	uint32_t invBlue = ~blue;

	// Bitband optimizations with pure increments, 5us interrupts
	uint32_t *bitBand = BITBAND_SRAM(&ws2812bDmaBitBuffer[(calcCol)], row);

	*bitBand =  (invGreen >> 7);
	bitBand+=16;

	*bitBand = (invGreen >> 6);
	bitBand+=16;

	*bitBand = (invGreen >> 5);
	bitBand+=16;

	*bitBand = (invGreen >> 4);
	bitBand+=16;

	*bitBand = (invGreen >> 3);
	bitBand+=16;

	*bitBand = (invGreen >> 2);
	bitBand+=16;

	*bitBand = (invGreen >> 1);
	bitBand+=16;

	*bitBand = (invGreen >> 0);
	bitBand+=16;

	// RED
	*bitBand =  (invRed >> 7);
	bitBand+=16;

	*bitBand = (invRed >> 6);
	bitBand+=16;

	*bitBand = (invRed >> 5);
	bitBand+=16;

	*bitBand = (invRed >> 4);
	bitBand+=16;

	*bitBand = (invRed >> 3);
	bitBand+=16;

	*bitBand = (invRed >> 2);
	bitBand+=16;

	*bitBand = (invRed >> 1);
	bitBand+=16;

	*bitBand = (invRed >> 0);
	bitBand+=16;

	// BLUE
	*bitBand =  (invBlue >> 7);
	bitBand+=16;

	*bitBand = (invBlue >> 6);
	bitBand+=16;

	*bitBand = (invBlue >> 5);
	bitBand+=16;

	*bitBand = (invBlue >> 4);
	bitBand+=16;

	*bitBand = (invBlue >> 3);
	bitBand+=16;

	*bitBand = (invBlue >> 2);
	bitBand+=16;

	*bitBand = (invBlue >> 1);
	bitBand+=16;

	*bitBand = (invBlue >> 0);
	bitBand+=16;

}

void ws2812b_init(){
	// Need to start the first transfer
	ws2812b.transferComplete = 1;
}


void ws2812b_handle()
{
	if(ws2812b.startTransfer) {
		ws2812b.startTransfer = 0;
		WS2812_sendbuf();
	}

}

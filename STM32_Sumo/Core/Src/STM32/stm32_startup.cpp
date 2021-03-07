/*
 * STM32_Startup.cpp
 *
 *  Created on: Dec 31, 2020
 *      Author: Damian
 */

#include <stm32_startup.hpp>

TIM_HandleTypeDef htim4;				// Timer 4 handle.

UART_HandleTypeDef huart2;				// TX - PA2  RX - PA3
UART_HandleTypeDef huart6;				// TX - PC6  RX - PC7
UART_HandleTypeDef huart1;				// TX - PA9  RX - PA10


void STM32_init(){
	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	SystemClock_Config();

	MX_GPIO_Init();

	MX_USART1_UART_Init();
	MX_USART2_UART_Init();
	MX_USART6_UART_Init();

	Sensors_init();
	WS2812B_init();
}

void SystemClock_Config(void){
	RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
	RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };

	// Configure the main internal regulator output voltage
	__HAL_RCC_PWR_CLK_ENABLE();
	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	// Initializes the RCC Oscillators according to the specified parameters
	// in the RCC_OscInitTypeDef structure.
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	//SYSCLK = 84MHz, APB1 = 42MHz, APB2 = 84MHz
	RCC_OscInitStruct.PLL.PLLM = 16;
	RCC_OscInitStruct.PLL.PLLN = 336;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
	RCC_OscInitStruct.PLL.PLLQ = 4;

	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK){
		Error_Handler();
	}

	// Initializes the CPU, AHB and APB buses clocks
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
							  |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1; //1
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4; //1
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2; //1

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK){
		Error_Handler();
	}
}

void MX_GPIO_Init(void){
	//GPIO_InitTypeDef GPIO_InitStruct = {0};

	/* GPIO Ports Clock Enable */
	//__HAL_RCC_GPIOA_CLK_ENABLE();
	//__HAL_RCC_GPIOB_CLK_ENABLE();
	//__HAL_RCC_GPIOC_CLK_ENABLE();

}

void MX_USART1_UART_Init(void){
	huart1.Instance = USART1;
	huart1.Init.BaudRate = 38400*16/84;
	huart1.Init.WordLength = UART_WORDLENGTH_8B;
	huart1.Init.StopBits = UART_STOPBITS_1;
	huart1.Init.Parity = UART_PARITY_NONE;
	huart1.Init.Mode = UART_MODE_TX_RX;
	huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart1.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart1) != HAL_OK){
		Error_Handler();
	}
}

void MX_USART2_UART_Init(void){
	huart2.Instance = USART2;
	huart2.Init.BaudRate = 115200*16/48;
	huart2.Init.WordLength = UART_WORDLENGTH_8B;
	huart2.Init.StopBits = UART_STOPBITS_1;
	huart2.Init.Parity = UART_PARITY_NONE;
	huart2.Init.Mode = UART_MODE_TX_RX;
	huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart2.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart2) != HAL_OK){
		Error_Handler();
	}
}

void MX_USART6_UART_Init(void){
	huart6.Instance = USART6;
	huart6.Init.BaudRate = 115200*16/48;
	huart6.Init.WordLength = UART_WORDLENGTH_8B;
	huart6.Init.StopBits = UART_STOPBITS_1;
	huart6.Init.Parity = UART_PARITY_NONE;
	huart6.Init.Mode = UART_MODE_TX_RX;
	huart6.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart6.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart6) != HAL_OK){
		Error_Handler();
	}
}

/*-----------------------------------------------------------------------*/
/*---------------------------Sensors Startup-----------------------------*/
/*-----------------------------------------------------------------------*/

ADC_HandleTypeDef hadc1;				// ADC for CNY70 sensor.
DMA_HandleTypeDef hdma_adc1;			// DMA for ADC.

CNY70 FR = CNY70(0, 2000);					// ADC CHANNEL 7
CNY70 FL = CNY70(1, 2000);					// ADC CHANNEL 13
CNY70 RR = CNY70(2, 2000);					// ADC CHANNEL 9
CNY70 RL = CNY70(3, 2000);					// ADC CHANNEL 12

SHARP1080  FR_Sharp = SHARP1080(4);			// ADC CHANNEL 14
SHARP20150 FM_Sharp = SHARP20150(5);		// ADC CHANNEL 9
SHARP1080  FL_Sharp = SHARP1080(6);			// ADC CHANNEL 8

const uint8_t NUMBER_OF_USED_DMA_SENSORS = 8;				// Number of used sensors with DMA handling.
uint16_t sensors_values[NUMBER_OF_USED_DMA_SENSORS];		// Array with all ADC sensors  CNY70 [3,4,5,6] SHARP 20150 [1] SHARP1080 [0,2]

void Sensors_GPIO_Init(void);
void Sensors_ADC1_Init(void);
void Sensors_DMA2_Init(void);

void Sensors_init(){
	Sensors_GPIO_Init();
	Sensors_ADC1_Init();
	Sensors_DMA2_Init();
}

void Sensors_run(){
	HAL_ADC_Start_DMA(&hadc1, (uint32_t*) sensors_values, NUMBER_OF_USED_DMA_SENSORS);		// Start ADC with DMA support.
}

void Sensors_GPIO_Init(){
	 GPIO_InitTypeDef GPIO_InitStruct = {0};

	/* Peripheral clock enable */
	__HAL_RCC_ADC1_CLK_ENABLE();

	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();


	GPIO_InitStruct.Pin = GPIO_PIN_7;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);
}

void Sensors_ADC1_Init(void){
	ADC_ChannelConfTypeDef sConfig = { 0 };

	/**Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion)
	 */
	hadc1.Instance = ADC1;
	hadc1.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV8;
	hadc1.Init.Resolution = ADC_RESOLUTION_12B;
	hadc1.Init.ScanConvMode = ENABLE;
	hadc1.Init.ContinuousConvMode = ENABLE;
	hadc1.Init.DiscontinuousConvMode = DISABLE;
	hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
	hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
	hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
	hadc1.Init.NbrOfConversion = 8;
	hadc1.Init.DMAContinuousRequests = ENABLE;
	hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
	if (HAL_ADC_Init(&hadc1) != HAL_OK) {
		Error_Handler();
	}


//*****************  SHARP FRONT LEFT      -  PB0 - Pin 26 - ADC1_8  ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_8;
	sConfig.Rank = 5;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
//*****************  SHARP FRONT RIGHT     -  PC4 - Pin 24 - ADC1_14 ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_14;
	sConfig.Rank = 6;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
//*****************  SHARP FRONT MIDDLE    -  PC5 - Pin 27 - ADC1_15	 ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_15;
	sConfig.Rank = 7;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
//*****************  SHARP REAR MIDDLE     -  PA6 - Pin 22 - ADC1_6  ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_6;
	sConfig.Rank = 8;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}


//*****************  CNY70 FRONT RIGHT FR  -  PA7 - Pin 23 - ADC1_7  ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_7;
	sConfig.Rank = 1;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
//*****************  CNY70 FRONT LEFT  FL  -  PC3 - Pin 11 - ADC1_13 ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_13;
	sConfig.Rank = 2;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}

//*****************  CNY70 REAR RIGHT  RR  -  PB1 - Pin 27 - ADC1_9  ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_9;
	sConfig.Rank = 3;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
//*****************  CNY70 REAR LEFT   RL  -  PC2 - Pin 10 - ADC1_12 ******************************************************************************
	sConfig.Channel = ADC_CHANNEL_12;
	sConfig.Rank = 4;
	sConfig.SamplingTime = ADC_SAMPLETIME_480CYCLES;
	if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
		Error_Handler();
	}
}

void Sensors_DMA2_Init(void){
	/* DMA controller clock enable */
	__HAL_RCC_DMA2_CLK_ENABLE();

	/* ADC1 DMA Init */
	hdma_adc1.Instance = DMA2_Stream0;
	hdma_adc1.Init.Channel = DMA_CHANNEL_0;
	hdma_adc1.Init.Direction = DMA_PERIPH_TO_MEMORY;
	hdma_adc1.Init.PeriphInc = DMA_PINC_DISABLE;
	hdma_adc1.Init.MemInc = DMA_MINC_ENABLE;
	hdma_adc1.Init.PeriphDataAlignment = DMA_PDATAALIGN_HALFWORD;
	hdma_adc1.Init.MemDataAlignment = DMA_MDATAALIGN_HALFWORD;
	hdma_adc1.Init.Mode = DMA_CIRCULAR;
	hdma_adc1.Init.Priority = DMA_PRIORITY_LOW;
	hdma_adc1.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	if (HAL_DMA_Init(&hdma_adc1) != HAL_OK){
	  //Error_Handler();
	}

	__HAL_LINKDMA(&hadc1,DMA_Handle,hdma_adc1);

	/* DMA2_Stream0_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);
}


/*-----------------------------------------------------------------------*/
/*---------------------------Sensors End---------------------------------*/
/*-----------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/*---------------------------Pixel Startup-------------------------------*/
/*-----------------------------------------------------------------------*/
extern uint32_t tim_period;
extern uint32_t timer_reset_pulse_period;
extern uint32_t WS2812_IO_High[];
extern uint32_t WS2812_IO_Low[];
extern uint16_t ws2812bDmaBitBuffer[24 * 2];
#define BUFFER_SIZE	  (sizeof(ws2812bDmaBitBuffer)/sizeof(uint16_t))

void Pixel_GPIO_Init(void);
static void TIM1_init(void);
static void DMA2_init(void);

void WS2812B_init(){
	Pixel_GPIO_Init();

	DMA2_init();
	TIM1_init();

	PixelsInit();
}

void Pixel_GPIO_Init(void){
	GPIO_InitTypeDef GPIO_InitStruct = {0};

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOC_CLK_ENABLE();

	/* WS2812B output */
	GPIO_InitStruct.Pin       = WS2812B_Pin;
	GPIO_InitStruct.Mode      = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull      = GPIO_NOPULL;
	GPIO_InitStruct.Speed     = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(WS2812B_Port, &GPIO_InitStruct);
}

TIM_HandleTypeDef  TIM1_handle;
TIM_OC_InitTypeDef tim2OC1;
TIM_OC_InitTypeDef tim2OC2;


static void TIM1_init(void){
	// TIM2 Peripheral clock enable
	__HAL_RCC_TIM1_CLK_ENABLE();

	tim_period =  SystemCoreClock / 800000; // 0,125us period (10 times lower the 1,25us period to have fixed math below)
	timer_reset_pulse_period = (SystemCoreClock / (320 * 60)); // 60us just to be sure

	uint32_t cc1 = (10 * tim_period) / 36;
	uint32_t cc2 = (10 * tim_period) / 15;

	TIM1_handle.Instance = TIM1;

	TIM1_handle.Init.Period            = tim_period;
	TIM1_handle.Init.RepetitionCounter = 0;
	TIM1_handle.Init.Prescaler         = 0;
	TIM1_handle.Init.ClockDivision     = TIM_CLOCKDIVISION_DIV1;
	TIM1_handle.Init.CounterMode       = TIM_COUNTERMODE_UP;
	HAL_TIM_PWM_Init(&TIM1_handle);

	HAL_NVIC_SetPriority(TIM1_UP_TIM10_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(TIM1_UP_TIM10_IRQn);

	tim2OC1.OCMode       = TIM_OCMODE_PWM1;
	tim2OC1.OCPolarity   = TIM_OCPOLARITY_HIGH;
	tim2OC1.Pulse        = cc1;
	tim2OC1.OCNPolarity  = TIM_OCNPOLARITY_HIGH;
	tim2OC1.OCFastMode   = TIM_OCFAST_DISABLE;
	HAL_TIM_PWM_ConfigChannel(&TIM1_handle, &tim2OC1, TIM_CHANNEL_1);

	tim2OC2.OCMode       = TIM_OCMODE_PWM1;
	tim2OC2.OCPolarity   = TIM_OCPOLARITY_HIGH;
	tim2OC2.Pulse        = cc2;
	tim2OC2.OCNPolarity  = TIM_OCNPOLARITY_HIGH;
	tim2OC2.OCFastMode   = TIM_OCFAST_DISABLE;
	tim2OC2.OCIdleState  = TIM_OCIDLESTATE_RESET;
	tim2OC2.OCNIdleState = TIM_OCNIDLESTATE_RESET;
	HAL_TIM_PWM_ConfigChannel(&TIM1_handle, &tim2OC2, TIM_CHANNEL_2);


	HAL_TIM_Base_Start(&TIM1_handle);
	HAL_TIM_PWM_Start(&TIM1_handle, TIM_CHANNEL_1);

	__HAL_TIM_DISABLE(&TIM1_handle);
}


DMA_HandleTypeDef     dmaUpdate;
DMA_HandleTypeDef     dmaCC1;
DMA_HandleTypeDef     dmaCC2;

static void DMA2_init(void){
	// TIM2 Update event
	__HAL_RCC_DMA2_CLK_ENABLE();

	dmaUpdate.Init.Direction = DMA_MEMORY_TO_PERIPH;
	dmaUpdate.Init.PeriphInc = DMA_PINC_DISABLE;
	dmaUpdate.Init.MemInc = DMA_MINC_DISABLE;
	dmaUpdate.Init.PeriphDataAlignment = DMA_PDATAALIGN_WORD;
	dmaUpdate.Init.MemDataAlignment = DMA_MDATAALIGN_WORD;
	dmaUpdate.Init.Mode = DMA_CIRCULAR;
	dmaUpdate.Init.Priority = DMA_PRIORITY_VERY_HIGH;
	dmaUpdate.Init.Channel = DMA_CHANNEL_6;

	dmaUpdate.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	dmaUpdate.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	dmaUpdate.Init.MemBurst = DMA_MBURST_SINGLE;
	dmaUpdate.Init.PeriphBurst = DMA_PBURST_SINGLE;

	dmaUpdate.Instance = DMA2_Stream5;

	HAL_DMA_DeInit(&dmaUpdate);
	HAL_DMA_Init(&dmaUpdate);
	HAL_DMA_Start(&dmaUpdate, (uint32_t)WS2812_IO_High, (uint32_t)(&WS2812B_Port->BSRR), BUFFER_SIZE);

	// TIM2 CC1 event
	dmaCC1.Init.Direction = DMA_MEMORY_TO_PERIPH;
	dmaCC1.Init.PeriphInc = DMA_PINC_DISABLE;
	dmaCC1.Init.MemInc = DMA_MINC_ENABLE;
	dmaCC1.Init.PeriphDataAlignment = DMA_PDATAALIGN_HALFWORD;
	dmaCC1.Init.MemDataAlignment = DMA_MDATAALIGN_HALFWORD;
	dmaCC1.Init.Mode = DMA_CIRCULAR;
	dmaCC1.Init.Priority = DMA_PRIORITY_VERY_HIGH;
	dmaCC1.Init.Channel = DMA_CHANNEL_6;

	dmaCC1.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	dmaCC1.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	dmaCC1.Init.MemBurst = DMA_MBURST_SINGLE;
	dmaCC1.Init.PeriphBurst = DMA_PBURST_SINGLE;

	dmaCC1.Instance = DMA2_Stream1;

	HAL_DMA_DeInit(&dmaCC1);
	HAL_DMA_Init(&dmaCC1);
	HAL_DMA_Start(&dmaCC1, (uint32_t)ws2812bDmaBitBuffer, (uint32_t)(&WS2812B_Port->BSRR) + 2, BUFFER_SIZE); //BRR


	// TIM2 CC2 event
	dmaCC2.Init.Direction = DMA_MEMORY_TO_PERIPH;
	dmaCC2.Init.PeriphInc = DMA_PINC_DISABLE;
	dmaCC2.Init.MemInc = DMA_MINC_DISABLE;
	dmaCC2.Init.PeriphDataAlignment = DMA_PDATAALIGN_WORD;
	dmaCC2.Init.MemDataAlignment = DMA_MDATAALIGN_WORD;
	dmaCC2.Init.Mode = DMA_CIRCULAR;
	dmaCC2.Init.Priority = DMA_PRIORITY_VERY_HIGH;
	dmaCC2.Init.Channel = DMA_CHANNEL_6;

	dmaCC2.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	dmaCC2.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	dmaCC2.Init.MemBurst = DMA_MBURST_SINGLE;
	dmaCC2.Init.PeriphBurst = DMA_PBURST_SINGLE;

	dmaCC2.Instance = DMA2_Stream2;

	HAL_DMA_DeInit(&dmaCC2);

	dmaCC2.XferCpltCallback  = DMA_TransferCompleteHandler;
	dmaCC2.XferHalfCpltCallback = DMA_TransferHalfHandler;
	dmaCC2.XferErrorCallback = DMA_TransferError;

	HAL_DMA_Init(&dmaCC2);
	HAL_NVIC_SetPriority(DMA2_Stream2_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(DMA2_Stream2_IRQn);
	HAL_DMA_Start_IT(&dmaCC2, (uint32_t)WS2812_IO_Low, (uint32_t)&WS2812B_Port->BSRR, BUFFER_SIZE);
}

/*-----------------------------------------------------------------------*/
/*---------------------------Pixel Startup End----------------------------*/
/*-----------------------------------------------------------------------*/


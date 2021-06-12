#ifndef OPPONENTDETECTION_H_
#define OPPONENTDETECTION_H_

#include "stm32f4xx_hal.h"
#include "SensorModule.h"

class OpponentDetection{
private:
	SHARP1080 FR_Sharp = SHARP1080(4);			// ADC CHANNEL 14
	SHARP20150 FM_Sharp = SHARP20150(5);		// ADC CHANNEL 9
	SHARP1080 FL_Sharp = SHARP1080(6);			// ADC CHANNEL 8

	uint16_t OpponentDistance;
	int16_t OpponentAngle;
public:
	OpponentDetection();

	void calculateOpponentPosition();

	uint16_t getOpponentDistance();
	int16_t getOpponentAngle();
};


#endif /* OPPONENTDETECTION_H_ */

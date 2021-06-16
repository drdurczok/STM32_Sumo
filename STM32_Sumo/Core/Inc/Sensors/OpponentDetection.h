#ifndef OPPONENTDETECTION_H_
#define OPPONENTDETECTION_H_

#include "stm32f4xx_hal.h"
#include "SensorModule.h"

class OpponentDetection{
private:
	SHARP1080 FR_Sharp = SHARP1080(5);			// ADC CHANNEL 14
	SHARP20150 FM_Sharp = SHARP20150(6);		// ADC CHANNEL 9
	SHARP1080 FL_Sharp = SHARP1080(4);			// ADC CHANNEL 8

	double OpponentDistance;
	double OpponentAngle;

	bool found_angle;
	bool found_dist;

	double getFMDistance();

public:
	OpponentDetection();

	void calculateOpponentPosition();

	double getOpponentDistance();
	double getOpponentAngle();
};


#endif /* OPPONENTDETECTION_H_ */

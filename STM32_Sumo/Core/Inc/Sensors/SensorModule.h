#ifndef SENSORMODULE_H_
#define SENSORMODULE_H_

#include "stm32f4xx_hal.h"

class Sensor{
private:

public:
	uint16_t *value;						// ADC DMA value
	uint8_t ivalueMax = 200;
	uint8_t  type; 							//	1 - returns true/false, 2 returns ADC value

	uint16_t GetValue();
	uint32_t AverageValue();

};

//______________________CNY70______________________
class CNY70 : public Sensor{
private:
	uint8_t sensorID;
	uint16_t lineDetectionLevel; 	// ADC line CNY70 detection level.
	uint32_t timeStamp;
	bool LineDetected;

public:
	CNY70(uint8_t ID, uint16_t lineDetectionLevel);
	void SetLineDetectionLevel(uint16_t lineDetectionLevel);
	uint16_t GetLineDetectionLevel();
	void SetTimeStamp(uint32_t timeStamp);
	uint32_t GetTimeStamp();
	bool GetDetectionState();
	void Read();
};

//______________________SHARP1080______________________
class SHARP1080 : public Sensor{
private:
	uint8_t sensorID;

public:
	SHARP1080(uint8_t ID);
	bool OpponentDetected();

};

//______________________SHARP20150______________________
class SHARP20150 : public Sensor{
private:
	uint8_t sensorID;

public:
	SHARP20150(uint8_t ID);
	bool OpponentDetected();

};


#endif /* SENSORMODULE_H_ */

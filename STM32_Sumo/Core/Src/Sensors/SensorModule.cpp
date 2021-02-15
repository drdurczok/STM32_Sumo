#include "SensorModule.h"

extern uint16_t sensors_values[7];

uint16_t Sensor::GetValue(){
	return *this->value;
}

//	Method to calculate average value from sensor.
uint32_t Sensor::AverageValue(){
	uint32_t temp = 0;
	for(uint8_t i = 0; i < ivalueMax; i++){
		temp += *this->value;
	}
	return temp/ivalueMax;
}

//______________________CNY70______________________
// Reflection sensor - line detecting.
// 4 sensors.
CNY70::CNY70(uint8_t ID, uint16_t lineDetectionLevel){
	this->sensorID = ID;
	this->value = &sensors_values[this->sensorID];
	this->lineDetectionLevel = lineDetectionLevel;
	this->timeStamp = 0;
	this->LineDetected = false;
}

void CNY70::SetLineDetectionLevel(uint16_t lineDetectionLevel){
	this->lineDetectionLevel = lineDetectionLevel;
}

uint16_t CNY70::GetLineDetectionLevel(){
	return this->lineDetectionLevel;
}

void CNY70::SetTimeStamp(uint32_t timeStamp)
{
	this->timeStamp = timeStamp;
}
uint32_t CNY70::GetTimeStamp()
{
	return this->timeStamp;
}
bool CNY70::GetDetectionState()
{
	return this->LineDetected;
}

void CNY70::Read(){

	if(AverageValue() < this->lineDetectionLevel )
	{
		if(this->LineDetected == false)
		{
			this->SetTimeStamp(HAL_GetTick());
			this->LineDetected = 1;
		}
	}
	else
	{
		//this->SetTimeStamp(HAL_GetTick());
		this->LineDetected = 0;
	}

}

//______________________SHARP1080______________________
SHARP1080::SHARP1080(uint8_t ID){
	this->sensorID = ID;
	this->value = &sensors_values[this->sensorID];
}

bool SHARP1080::OpponentDetected(){
	uint32_t avgValue = AverageValue();
	if ((avgValue < 4000) && (avgValue > 1000))
		return 1;
	else
		return 0;
}

//______________________SHARP20150______________________
SHARP20150::SHARP20150(uint8_t ID){
	this->sensorID = ID;
	this->value = &sensors_values[this->sensorID];
}

bool SHARP20150::OpponentDetected(){
	uint32_t avgValue = AverageValue();
	if ((avgValue < 4000) && (avgValue  > 1000))
		return 1;
	else
		return 0;
}

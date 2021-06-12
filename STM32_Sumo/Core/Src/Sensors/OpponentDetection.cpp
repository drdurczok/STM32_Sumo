#include "OpponentDetection.h"

OpponentDetection::OpponentDetection(){
	this->OpponentDistance = 0;
	this->OpponentAngle = 0;
}

void OpponentDetection::calculateOpponentPosition(){
	uint32_t FR_Val = FR_Sharp.AverageValue();
	uint32_t FM_Val = FM_Sharp.AverageValue();
	uint32_t FL_Val = FL_Sharp.AverageValue();

}

uint16_t OpponentDetection::getOpponentDistance(){
	return this->OpponentDistance;
}

int16_t OpponentDetection::getOpponentAngle(){
	return this->OpponentAngle;
}

#include "OpponentDetection.h"

OpponentDetection::OpponentDetection(){
	this->OpponentDistance = 0;
	this->OpponentAngle = 0;

	this->found_angle = false;
	this->found_dist = false;
}

void OpponentDetection::calculateOpponentPosition(){
	this->OpponentAngle = 0;
	this->OpponentDistance = getFMDistance();

	uint16_t FR_angle_deg = 30;
	uint16_t FL_angle_deg = 30;

	this->found_angle = false;
	this->found_dist = false;

	uint16_t detection_lower_limit = 600;
	if(FR_Sharp.AverageValue() > detection_lower_limit){
		this->OpponentAngle += FR_angle_deg;
		this->found_angle = true;
	}
	if(FL_Sharp.AverageValue() > detection_lower_limit){
		this->OpponentAngle -= FL_angle_deg;
		this->found_angle = true;
	}

	if(this->OpponentDistance > 14 && this->OpponentDistance < 90){
		this->found_dist = true;
	}
}

double OpponentDetection::getOpponentDistance(){
	if(this->found_dist){
		return this->OpponentDistance;
	}
	return -999;
}

double OpponentDetection::getOpponentAngle(){
	if(this->found_angle){
		return this->OpponentAngle;
	}
	return -999;
}

double OpponentDetection::getFMDistance(){
	double FM_Val = FM_Sharp.AverageValue();
	return 0.000045*FM_Val*FM_Val - 0.1588*FM_Val + 156.32;
}

#ifndef VISEFFECT_H_
#define VISEFFECT_H_

#include <stdint.h>

void PixelsInit();

void pixels_startup();

void blinkHandle(uint8_t, uint8_t, uint8_t);
void wheelHandle(uint8_t, uint8_t, uint8_t);
void loadHandle(uint8_t, uint8_t, uint8_t);
void clearHandle();


#endif /* VISEFFECT_H_ */

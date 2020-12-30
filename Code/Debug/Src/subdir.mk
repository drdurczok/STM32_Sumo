################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/MPU6050Driver.c \
../Src/stm32f4xx_hal_msp.c \
../Src/stm32f4xx_it.c \
../Src/syscalls.c \
../Src/system_stm32f4xx.c 

CPP_SRCS += \
../Src/AlgorithmModule.cpp \
../Src/Diagnostic.cpp \
../Src/DrivePID.cpp \
../Src/DriveQueue.cpp \
../Src/DriveSync.cpp \
../Src/EncoderModule.cpp \
../Src/MotorControl.cpp \
../Src/MotorDriver.cpp \
../Src/RobotControl.cpp \
../Src/SensorModule.cpp \
../Src/SteeringModule.cpp \
../Src/_Startup.cpp \
../Src/main.cpp 

OBJS += \
./Src/AlgorithmModule.o \
./Src/Diagnostic.o \
./Src/DrivePID.o \
./Src/DriveQueue.o \
./Src/DriveSync.o \
./Src/EncoderModule.o \
./Src/MPU6050Driver.o \
./Src/MotorControl.o \
./Src/MotorDriver.o \
./Src/RobotControl.o \
./Src/SensorModule.o \
./Src/SteeringModule.o \
./Src/_Startup.o \
./Src/main.o \
./Src/stm32f4xx_hal_msp.o \
./Src/stm32f4xx_it.o \
./Src/syscalls.o \
./Src/system_stm32f4xx.o 

C_DEPS += \
./Src/MPU6050Driver.d \
./Src/stm32f4xx_hal_msp.d \
./Src/stm32f4xx_it.d \
./Src/syscalls.d \
./Src/system_stm32f4xx.d 

CPP_DEPS += \
./Src/AlgorithmModule.d \
./Src/Diagnostic.d \
./Src/DrivePID.d \
./Src/DriveQueue.d \
./Src/DriveSync.d \
./Src/EncoderModule.d \
./Src/MotorControl.d \
./Src/MotorDriver.d \
./Src/RobotControl.d \
./Src/SensorModule.d \
./Src/SteeringModule.d \
./Src/_Startup.d \
./Src/main.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MCU G++ Compiler'
	@echo $(PWD)
	arm-none-eabi-g++ -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -I"../Inc" -I"../Drivers/STM32F4xx_HAL_Driver/Inc" -I"../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"../Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"../Drivers/CMSIS/Include"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fno-exceptions -fno-rtti -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -I"../Inc" -I"../Drivers/STM32F4xx_HAL_Driver/Inc" -I"../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"../Drivers/CMSIS/Device/ST/STM32F4xx/Include" -I"../Drivers/CMSIS/Include"  -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



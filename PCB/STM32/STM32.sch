EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Switch:SW_Push SW1
U 1 1 5E25EE26
P 10400 5850
F 0 "SW1" H 10400 6135 50  0000 C CNN
F 1 "SW_Push" H 10400 6044 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_CK_RS282G05A3" H 10400 6050 50  0001 C CNN
F 3 "~" H 10400 6050 50  0001 C CNN
	1    10400 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5E2607A7
P 10400 6100
F 0 "C1" V 10171 6100 50  0000 C CNN
F 1 "100nF" V 10262 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10400 6100 50  0001 C CNN
F 3 "~" H 10400 6100 50  0001 C CNN
	1    10400 6100
	0    1    1    0   
$EndComp
Text GLabel 10000 5950 0    50   Input ~ 0
RESET
Wire Wire Line
	10150 5950 10000 5950
Wire Wire Line
	10200 5850 10150 5850
Wire Wire Line
	10150 5850 10150 5950
Wire Wire Line
	10150 6100 10300 6100
Wire Wire Line
	10500 6100 10650 6100
Wire Wire Line
	10650 5850 10600 5850
$Comp
L power:GND #PWR0122
U 1 1 5E26EB94
P 10800 5950
F 0 "#PWR0122" H 10800 5700 50  0001 C CNN
F 1 "GND" V 10805 5822 50  0000 R CNN
F 2 "" H 10800 5950 50  0001 C CNN
F 3 "" H 10800 5950 50  0001 C CNN
	1    10800 5950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10650 5950 10800 5950
Wire Wire Line
	10650 5950 10650 5850
Text GLabel 8750 5700 0    50   Input ~ 0
SWD_CLK
Wire Wire Line
	8900 5700 8750 5700
Text Notes 8400 5550 0    50   ~ 0
St Link
$Comp
L power:GND #PWR0109
U 1 1 5E70CFAE
P 8800 5800
F 0 "#PWR0109" H 8800 5550 50  0001 C CNN
F 1 "GND" V 8805 5672 50  0000 R CNN
F 2 "" H 8800 5800 50  0001 C CNN
F 3 "" H 8800 5800 50  0001 C CNN
	1    8800 5800
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J18
U 1 1 5E6EB301
P 9100 5800
F 0 "J18" H 9180 5792 50  0000 L CNN
F 1 "St-Link" H 9180 5701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9100 5800 50  0001 C CNN
F 3 "~" H 9100 5800 50  0001 C CNN
	1    9100 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5800 8900 5800
Text GLabel 8750 5900 0    50   Input ~ 0
SWD_IO
Wire Wire Line
	8900 5900 8750 5900
$Comp
L MCU_ST_STM32F4:STM32F411RETx U3
U 1 1 5E9A699E
P 9450 3100
F 0 "U3" H 9778 1211 50  0000 L CNN
F 1 "STM32F411RETx" H 9778 1120 50  0000 L CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 8850 1400 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00115249.pdf" H 9450 3100 50  0001 C CNN
	1    9450 3100
	1    0    0    -1  
$EndComp
Text GLabel 10300 4500 2    50   Input ~ 0
PB13
Wire Wire Line
	10150 4500 10300 4500
Text GLabel 10300 4600 2    50   Input ~ 0
PB14
Wire Wire Line
	10150 4600 10300 4600
Text GLabel 10300 4700 2    50   Input ~ 0
PB15
Wire Wire Line
	10150 4700 10300 4700
Text GLabel 10300 3400 2    50   Input ~ 0
PB1
Wire Wire Line
	10150 3400 10300 3400
Text GLabel 8600 3800 0    50   Input ~ 0
PC6
Wire Wire Line
	8750 3800 8600 3800
Text Notes 8000 3650 0    50   ~ 0
Sharp FR
Text Notes 10550 4550 0    50   ~ 0
Encoder R
Text Notes 10550 4650 0    50   ~ 0
Encoder L
Text Notes 10550 4750 0    50   ~ 0
Encoder L
Text Notes 8400 3850 2    50   ~ 0
UART6_TX
$Comp
L power:GND #PWR0103
U 1 1 5EBA28B0
P 2650 1550
F 0 "#PWR0103" H 2650 1300 50  0001 C CNN
F 1 "GND" H 2655 1422 50  0000 C CNN
F 2 "" H 2650 1550 50  0001 C CNN
F 3 "" H 2650 1550 50  0001 C CNN
	1    2650 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 1500 2800 1550
Text GLabel 10300 1900 2    50   Input ~ 0
PA3
Wire Wire Line
	10150 1900 10300 1900
Text GLabel 10300 1800 2    50   Input ~ 0
PA2
Wire Wire Line
	10150 1800 10300 1800
Text GLabel 10300 2600 2    50   Input ~ 0
PA10
Wire Wire Line
	10150 2600 10300 2600
Text GLabel 10300 4300 2    50   Input ~ 0
PB10
Wire Wire Line
	10150 4300 10300 4300
Text GLabel 10300 2500 2    50   Input ~ 0
PA9
Wire Wire Line
	10150 2500 10300 2500
Text GLabel 8600 3900 0    50   Input ~ 0
PC7
Wire Wire Line
	8750 3900 8600 3900
Text GLabel 10300 2300 2    50   Input ~ 0
PA7
Wire Wire Line
	10150 2300 10300 2300
Text GLabel 10300 2200 2    50   Input ~ 0
PA6
Wire Wire Line
	10150 2200 10300 2200
Text Notes 10900 2250 2    50   ~ 0
Sharp BM
Text Notes 10950 4350 2    50   ~ 0
Encoder R
Text Notes 10900 1950 2    50   ~ 0
UART2_RX
Text Notes 10900 1850 2    50   ~ 0
UART2_TX
Text Notes 10950 2650 2    50   ~ 0
UART1_RX
Text Notes 10950 2550 2    50   ~ 0
UART1_TX
Text Notes 8000 3950 0    50   ~ 0
UART6_RX
Text GLabel 10300 4200 2    50   Input ~ 0
PB9
Wire Wire Line
	10150 4200 10300 4200
Text GLabel 10300 4100 2    50   Input ~ 0
PB8
Wire Wire Line
	10150 4100 10300 4100
Text Notes 10900 4150 2    50   ~ 0
MPU6050
Text Notes 10900 4250 2    50   ~ 0
MPU6050
Text GLabel 10300 3800 2    50   Input ~ 0
PB5
Wire Wire Line
	10150 3800 10300 3800
Text GLabel 10300 3700 2    50   Input ~ 0
PB4
Wire Wire Line
	10150 3700 10300 3700
Text GLabel 10300 3900 2    50   Input ~ 0
PB6
Wire Wire Line
	10150 3900 10300 3900
$Comp
L power:GND #PWR0105
U 1 1 5EBB303F
P 8150 1600
F 0 "#PWR0105" H 8150 1350 50  0001 C CNN
F 1 "GND" V 8155 1472 50  0000 R CNN
F 2 "" H 8150 1600 50  0001 C CNN
F 3 "" H 8150 1600 50  0001 C CNN
	1    8150 1600
	-1   0    0    1   
$EndComp
Text GLabel 8600 3300 0    50   Input ~ 0
PC1
Wire Wire Line
	8750 3300 8600 3300
Text GLabel 8600 3200 0    50   Input ~ 0
PC0
Wire Wire Line
	8750 3200 8600 3200
Text GLabel 10300 3300 2    50   Input ~ 0
PB0
Wire Wire Line
	10150 3300 10300 3300
Text GLabel 8650 1550 1    50   Input ~ 0
RESET
Text GLabel 10300 1700 2    50   Input ~ 0
PA1
Wire Wire Line
	10150 1700 10300 1700
Text Notes 10550 3350 0    50   ~ 0
Sharp FL
Text Notes 10550 1750 0    50   ~ 0
---
Text GLabel 10300 1600 2    50   Input ~ 0
PA0
Wire Wire Line
	10150 1600 10300 1600
Text Notes 10550 1650 0    50   ~ 0
---
Text GLabel 10300 2000 2    50   Input ~ 0
PA4
Wire Wire Line
	10150 2000 10300 2000
Text Notes 10550 2050 0    50   ~ 0
---
$Comp
L power:GND #PWR0143
U 1 1 5EBC64EE
P 9800 5250
F 0 "#PWR0143" H 9800 5000 50  0001 C CNN
F 1 "GND" V 9805 5122 50  0000 R CNN
F 2 "" H 9800 5250 50  0001 C CNN
F 3 "" H 9800 5250 50  0001 C CNN
	1    9800 5250
	0    -1   -1   0   
$EndComp
Text GLabel 8600 3400 0    50   Input ~ 0
PC2
Wire Wire Line
	8750 3400 8600 3400
Text GLabel 8600 3500 0    50   Input ~ 0
PC3
Wire Wire Line
	8750 3500 8600 3500
Text Notes 10550 3450 0    50   ~ 0
CNY70 BR
Text Notes 8000 3450 0    50   ~ 0
CNY70 BL
Text GLabel 10300 3000 2    50   Input ~ 0
SWD_CLK
Wire Wire Line
	10150 3000 10300 3000
Text Notes 10950 3000 2    50   ~ 0
St Link
Text GLabel 10300 2900 2    50   Input ~ 0
SWD_IO
Wire Wire Line
	10150 2900 10300 2900
Text Notes 10950 2900 2    50   ~ 0
St Link
Text GLabel 10300 4000 2    50   Input ~ 0
PB7
Wire Wire Line
	10150 4000 10300 4000
Text GLabel 8600 4500 0    50   Input ~ 0
PC13
Wire Wire Line
	8750 4500 8600 4500
Text GLabel 8600 4600 0    50   Input ~ 0
PC14
Wire Wire Line
	8750 4600 8600 4600
Text GLabel 8600 4700 0    50   Input ~ 0
PC15
Wire Wire Line
	8750 4700 8600 4700
Text Notes 10550 4050 0    50   ~ 0
LED
$Comp
L Device:C_Small C5
U 1 1 5EA3788A
P 1500 1400
F 0 "C5" H 1592 1446 50  0000 L CNN
F 1 "4.7uF" H 1592 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1500 1400 50  0001 C CNN
F 3 "~" H 1500 1400 50  0001 C CNN
	1    1500 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1_Small C4
U 1 1 5E9F3A92
P 1300 1400
F 0 "C4" H 1059 1446 50  0000 L CNN
F 1 "10uF" H 1059 1355 50  0000 L TNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 1300 1400 50  0001 C CNN
F 3 "~" H 1300 1400 50  0001 C CNN
	1    1300 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_Small_ALT D1
U 1 1 5EAA401F
P 1200 1200
F 0 "D1" H 1200 995 50  0000 C CNN
F 1 "Schottky" H 1200 1086 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 1200 1200 50  0001 C CNN
F 3 "~" V 1200 1200 50  0001 C CNN
	1    1200 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 1300 1300 1200
Wire Wire Line
	1500 1300 1500 1200
Wire Wire Line
	1500 1200 1600 1200
Wire Wire Line
	1300 1200 1500 1200
Connection ~ 1500 1200
Wire Wire Line
	1500 1500 1500 1550
Wire Wire Line
	1300 1500 1300 1550
Wire Wire Line
	1300 1550 1500 1550
Wire Wire Line
	3200 1500 3200 1550
Wire Wire Line
	3200 1550 2800 1550
Wire Wire Line
	3200 1300 3200 1200
Wire Wire Line
	3200 1200 3100 1200
Connection ~ 3200 1200
$Comp
L Device:LED_Small_ALT D2
U 1 1 5EB3AAF5
P 3550 1400
F 0 "D2" V 3596 1332 50  0000 R CNN
F 1 "Power_On" V 3505 1332 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" V 3550 1400 50  0001 C CNN
F 3 "~" V 3550 1400 50  0001 C CNN
	1    3550 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5EB3D27E
P 3400 1550
F 0 "R9" V 3204 1550 50  0000 C CNN
F 1 "RLed" V 3295 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3400 1550 50  0001 C CNN
F 3 "~" H 3400 1550 50  0001 C CNN
	1    3400 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 1200 3550 1300
Wire Wire Line
	3200 1200 3550 1200
Wire Wire Line
	3550 1500 3550 1550
Wire Wire Line
	3550 1550 3500 1550
Wire Wire Line
	3300 1550 3200 1550
Connection ~ 3200 1550
Text Notes 2100 850  0    50   ~ 0
Power Supply\n3.3V, 250mA
$Comp
L Device:C_Small C6
U 1 1 5EA221DE
P 3200 1400
F 0 "C6" H 2996 1446 50  0000 L CNN
F 1 "4.7uF" H 2996 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3200 1400 50  0001 C CNN
F 3 "~" H 3200 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
Wire Notes Line
	4000 650  4000 1700
$Comp
L Device:C_Small C7
U 1 1 5EC523BA
P 9050 5250
F 0 "C7" V 8821 5250 50  0000 C CNN
F 1 "100nF" V 8912 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9050 5250 50  0001 C CNN
F 3 "~" H 9050 5250 50  0001 C CNN
	1    9050 5250
	0    1    1    0   
$EndComp
$Comp
L power:VPP #PWR0101
U 1 1 5EC6BDC0
P 750 1350
F 0 "#PWR0101" H 750 1200 50  0001 C CNN
F 1 "VPP" V 765 1477 50  0000 L CNN
F 2 "" H 750 1350 50  0001 C CNN
F 3 "" H 750 1350 50  0001 C CNN
	1    750  1350
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5ED9DB29
P 8850 5150
F 0 "C8" V 8621 5150 50  0000 C CNN
F 1 "100nF" V 8712 5150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8850 5150 50  0001 C CNN
F 3 "~" H 8850 5150 50  0001 C CNN
	1    8850 5150
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5EDEE3F9
P 8450 4950
F 0 "C10" V 8221 4950 50  0000 C CNN
F 1 "100nF" V 8312 4950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8450 4950 50  0001 C CNN
F 3 "~" H 8450 4950 50  0001 C CNN
	1    8450 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5EDFAF19
P 8650 5050
F 0 "C12" V 8421 5050 50  0000 C CNN
F 1 "100nF" V 8512 5050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8650 5050 50  0001 C CNN
F 3 "~" H 8650 5050 50  0001 C CNN
	1    8650 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 5250 9550 5250
Connection ~ 9550 5250
Wire Wire Line
	9350 5250 9450 5250
Connection ~ 9450 5250
Wire Wire Line
	9250 5250 9350 5250
Connection ~ 9350 5250
Wire Wire Line
	9150 5250 9250 5250
Connection ~ 9250 5250
Wire Wire Line
	8950 5250 8750 5250
Wire Wire Line
	8550 5050 8550 5250
Connection ~ 8550 5250
Wire Wire Line
	8750 5150 8750 5250
Connection ~ 8750 5250
Wire Wire Line
	8750 5250 8550 5250
Wire Wire Line
	8950 5150 9350 5150
Wire Wire Line
	8750 5050 9450 5050
Wire Wire Line
	8250 5250 8350 5250
Wire Wire Line
	9350 4900 9350 5150
Wire Wire Line
	9450 4900 9450 5050
Wire Wire Line
	9450 5050 9450 5250
Connection ~ 9450 5050
Wire Wire Line
	9350 5150 9350 5250
Connection ~ 9350 5150
Wire Wire Line
	9550 4900 9550 4950
Wire Wire Line
	9250 4900 9250 5250
Wire Wire Line
	8550 4950 9550 4950
Connection ~ 9550 4950
Wire Wire Line
	9550 4950 9550 5250
Wire Wire Line
	8350 4950 8350 5250
Connection ~ 8350 5250
Wire Wire Line
	8350 5250 8550 5250
Wire Wire Line
	9550 1400 9550 1300
Wire Wire Line
	9550 1300 9650 1300
Wire Wire Line
	9650 1300 9650 1400
Wire Wire Line
	9450 1400 9450 1300
Wire Wire Line
	9450 1300 9550 1300
Connection ~ 9550 1300
Wire Wire Line
	9350 1400 9350 1300
Wire Wire Line
	9350 1300 9450 1300
Connection ~ 9450 1300
Connection ~ 9350 1300
$Comp
L Device:Crystal_Small Y1
U 1 1 5F24E5E4
P 8350 2650
F 0 "Y1" H 8350 2875 50  0000 C CNN
F 1 "16MHz" H 8350 2784 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_5032-2Pin_5.0x3.2mm_HandSoldering" H 8350 2650 50  0001 C CNN
F 3 "~" H 8350 2650 50  0001 C CNN
	1    8350 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5F27EE89
P 8150 2400
F 0 "C9" H 8242 2446 50  0000 L CNN
F 1 "20pF" H 8242 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8150 2400 50  0001 C CNN
F 3 "~" H 8150 2400 50  0001 C CNN
	1    8150 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8150 2300 8150 2100
Wire Wire Line
	8500 2300 8500 2100
Wire Wire Line
	8500 2100 8150 2100
Connection ~ 8150 2100
Wire Wire Line
	8150 2500 8150 2650
Wire Wire Line
	8150 2650 8250 2650
$Comp
L Device:C_Small C11
U 1 1 5F26F474
P 8500 2400
F 0 "C11" H 8408 2354 50  0000 R CNN
F 1 "20pF" H 8408 2445 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8500 2400 50  0001 C CNN
F 3 "~" H 8500 2400 50  0001 C CNN
	1    8500 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 2500 8500 2650
Wire Wire Line
	8500 2650 8450 2650
Wire Wire Line
	8750 2700 8500 2700
Wire Wire Line
	8500 2700 8500 2650
Connection ~ 8500 2650
Wire Wire Line
	8750 2800 8150 2800
Wire Wire Line
	8150 2800 8150 2650
Connection ~ 8150 2650
Wire Notes Line
	11150 500  11150 5400
Wire Notes Line
	11150 5400 7700 5400
Wire Notes Line
	7700 5400 7700 500 
Wire Notes Line
	7700 500  11150 500 
Wire Notes Line
	11150 5450 11150 6500
Wire Notes Line
	11150 6500 9550 6500
Wire Notes Line
	9550 6500 9550 5450
Wire Notes Line
	9550 5450 11150 5450
Text Notes 9600 5550 0    50   ~ 0
Reset Button
Text Notes 7750 600  0    50   ~ 0
STM32F411RET\n
$Comp
L Device:C_Small C15
U 1 1 5FA456C2
P 8650 2000
F 0 "C15" V 8879 2000 50  0000 C CNN
F 1 "2.2uF" V 8788 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8650 2000 50  0001 C CNN
F 3 "~" H 8650 2000 50  0001 C CNN
	1    8650 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8550 2000 8150 2000
Connection ~ 8150 2000
Wire Wire Line
	8150 2000 8150 2100
$Comp
L Device:Fuse F2
U 1 1 5FAC3FF3
P 950 1200
F 0 "F2" H 1010 1246 50  0000 L CNN
F 1 "Fuse" H 1010 1155 50  0000 L CNN
F 2 "Fuse:Fuse_0805_2012Metric" V 880 1200 50  0001 C CNN
F 3 "~" H 950 1200 50  0001 C CNN
	1    950  1200
	0    -1   -1   0   
$EndComp
Connection ~ 1300 1200
Wire Wire Line
	800  1200 750  1200
Wire Wire Line
	750  1200 750  1350
Wire Wire Line
	9650 4900 9650 5250
Wire Wire Line
	9550 5250 9650 5250
Wire Wire Line
	9650 5250 9800 5250
Connection ~ 9650 5250
Wire Wire Line
	9250 1300 9250 1400
Wire Wire Line
	10150 2400 10300 2400
Text GLabel 10300 2400 2    50   Input ~ 0
PA8
Wire Wire Line
	10150 2100 10300 2100
Text GLabel 10300 2100 2    50   Input ~ 0
PA5
Wire Wire Line
	10150 2700 10300 2700
Wire Wire Line
	10150 2800 10300 2800
Text GLabel 10300 2700 2    50   Input ~ 0
PA11
Text GLabel 10300 2800 2    50   Input ~ 0
PA12
Wire Wire Line
	8750 3600 8600 3600
Wire Wire Line
	8750 3700 8600 3700
Text GLabel 8600 3600 0    50   Input ~ 0
PC4
Text GLabel 8600 3700 0    50   Input ~ 0
PC5
Text Notes 8350 3550 2    50   ~ 0
CNY70 FL
Text Notes 10900 2350 2    50   ~ 0
CNY70 FR
Text GLabel 10300 3500 2    50   Input ~ 0
PB2
Wire Wire Line
	10150 3500 10300 3500
Text GLabel 10300 3600 2    50   Input ~ 0
PB3
Wire Wire Line
	10150 3600 10300 3600
Text Notes 10550 3650 0    50   ~ 0
St Link
Text Notes 10550 3550 0    50   ~ 0
Opto
$Comp
L Regulator_Linear:MCP1703A-3302_SOT23 U4
U 1 1 5FBE0384
P 2800 1200
F 0 "U4" H 2800 1442 50  0000 C CNN
F 1 "MCP1703A-3302_SOT23" H 2800 1351 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2800 1400 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 2800 1150 50  0001 C CNN
	1    2800 1200
	1    0    0    -1  
$EndComp
Text GLabel 6850 2800 2    50   Input ~ 0
PB13
Text GLabel 6850 2900 2    50   Input ~ 0
PB14
Text GLabel 6850 3000 2    50   Input ~ 0
PB15
Text GLabel 6850 2500 2    50   Input ~ 0
PB1
Text Notes 5750 2850 0    50   ~ 0
Sharp FR
Text Notes 7100 2850 0    50   ~ 0
Encoder R
Text Notes 7100 2950 0    50   ~ 0
Encoder L
Text Notes 7100 3050 0    50   ~ 0
Encoder L
Text GLabel 6350 2500 0    50   Input ~ 0
PA3
Text GLabel 6350 3100 0    50   Input ~ 0
PA2
Text GLabel 6850 2700 2    50   Input ~ 0
PB10
Text GLabel 6850 3500 2    50   Input ~ 0
PA9
Text GLabel 6350 2700 0    50   Input ~ 0
PA7
Text GLabel 6350 2600 0    50   Input ~ 0
PA6
Text Notes 5750 2950 0    50   ~ 0
Sharp FM
Text Notes 5750 2650 0    50   ~ 0
Sharp BM
Text Notes 7450 3550 2    50   ~ 0
UART1_TX
Text GLabel 6350 3600 0    50   Input ~ 0
PB9
Text GLabel 6350 3500 0    50   Input ~ 0
PB8
Text Notes 5750 3550 0    50   ~ 0
MPU6050
Text Notes 5750 3650 0    50   ~ 0
MPU6050
Text GLabel 6350 3000 0    50   Input ~ 0
PB0
Text Notes 6100 3050 2    50   ~ 0
Sharp FL
Text GLabel 6850 3100 2    50   Input ~ 0
PC6
Text GLabel 6850 3200 2    50   Input ~ 0
PC7
Text GLabel 6350 3400 0    50   Input ~ 0
PC2
Text GLabel 6350 3300 0    50   Input ~ 0
PC3
Text Notes 7050 2550 0    50   ~ 0
CNY70 BR
Text Notes 5750 3450 0    50   ~ 0
CNY70 BL
Text GLabel 6350 2800 0    50   Input ~ 0
PC4
Text GLabel 6350 2900 0    50   Input ~ 0
PC5
Text Notes 6100 3350 2    50   ~ 0
CNY70 FL
Text Notes 6100 2750 2    50   ~ 0
CNY70 FR
$Comp
L Connector_Generic:Conn_02x14_Odd_Even J2
U 1 1 5FEA5EA7
P 6650 3000
F 0 "J2" H 6672 3913 50  0000 L CNN
F 1 "St-Link" H 6593 3835 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x14_P1.27mm_Vertical_SMD" H 6650 3000 50  0001 C CNN
F 3 "~" H 6650 3000 50  0001 C CNN
	1    6650 3000
	-1   0    0    -1  
$EndComp
$Comp
L power:VPP #PWR0106
U 1 1 5FEE887A
P 6350 3700
F 0 "#PWR0106" H 6350 3550 50  0001 C CNN
F 1 "VPP" V 6365 3827 50  0000 L CNN
F 2 "" H 6350 3700 50  0001 C CNN
F 3 "" H 6350 3700 50  0001 C CNN
	1    6350 3700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5FEEF614
P 6850 2400
F 0 "#PWR0107" H 6850 2150 50  0001 C CNN
F 1 "GND" V 6855 2272 50  0000 R CNN
F 2 "" H 6850 2400 50  0001 C CNN
F 3 "" H 6850 2400 50  0001 C CNN
	1    6850 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 1300 9350 1300
Connection ~ 9250 1300
$Comp
L Device:R R11
U 1 1 5F9FF321
P 8400 1800
F 0 "R11" V 8548 1877 50  0000 L CNN
F 1 "100K" V 8470 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8330 1800 50  0001 C CNN
F 3 "~" H 8400 1800 50  0001 C CNN
	1    8400 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8550 1800 8750 1800
Wire Wire Line
	8250 1800 8150 1800
Wire Wire Line
	8150 1800 8150 2000
Wire Wire Line
	8650 1600 8750 1600
Wire Wire Line
	9250 1200 9250 1300
Wire Wire Line
	8150 1600 8150 1800
Connection ~ 8150 1800
Wire Wire Line
	8650 1550 8650 1600
$Comp
L Device:R_Small R2
U 1 1 5FF42E83
P 10450 6400
F 0 "R2" V 10254 6400 50  0000 C CNN
F 1 "100k" V 10345 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10450 6400 50  0001 C CNN
F 3 "~" H 10450 6400 50  0001 C CNN
	1    10450 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	10850 6400 10550 6400
Wire Wire Line
	10350 6400 10150 6400
Wire Wire Line
	10150 6400 10150 6100
Connection ~ 10150 6100
Wire Wire Line
	10650 5950 10650 6100
Connection ~ 10650 5950
Wire Wire Line
	10150 5950 10150 6100
Connection ~ 10150 5950
Text GLabel 8600 4200 0    50   Input ~ 0
PC10
Wire Wire Line
	8750 4200 8600 4200
Text GLabel 8600 4300 0    50   Input ~ 0
PC11
Wire Wire Line
	8750 4300 8600 4300
Text GLabel 8600 4400 0    50   Input ~ 0
PC12
Wire Wire Line
	8750 4400 8600 4400
Text GLabel 8600 4000 0    50   Input ~ 0
PC8
Wire Wire Line
	8750 4000 8600 4000
Text GLabel 8600 4100 0    50   Input ~ 0
PC9
Wire Wire Line
	8750 4100 8600 4100
Text Notes 900  5700 0    50   ~ 0
LED
$Comp
L power:GND #PWR0108
U 1 1 600BFC69
P 3900 6150
F 0 "#PWR0108" H 3900 5900 50  0001 C CNN
F 1 "GND" V 3905 6022 50  0000 R CNN
F 2 "" H 3900 6150 50  0001 C CNN
F 3 "" H 3900 6150 50  0001 C CNN
	1    3900 6150
	-1   0    0    1   
$EndComp
$Comp
L LED:WS2812B D3
U 1 1 600DAB9A
P 1400 6950
F 0 "D3" V 1744 6996 50  0000 L BNN
F 1 "WS2812B" V 1744 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 1450 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 1500 6575 50  0001 L TNN
	1    1400 6950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D4
U 1 1 6011ED7D
P 2100 6950
F 0 "D4" V 2444 6996 50  0000 L BNN
F 1 "WS2812B" V 2444 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2150 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2200 6575 50  0001 L TNN
	1    2100 6950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D5
U 1 1 6012DC8B
P 2850 6950
F 0 "D5" V 3194 6996 50  0000 L BNN
F 1 "WS2812B" V 3194 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2900 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2950 6575 50  0001 L TNN
	1    2850 6950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D6
U 1 1 6012DC91
P 3550 6950
F 0 "D6" V 3894 6996 50  0000 L BNN
F 1 "WS2812B" V 3894 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3600 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3650 6575 50  0001 L TNN
	1    3550 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6950 1800 6950
Wire Wire Line
	2400 6950 2550 6950
Wire Wire Line
	3150 6950 3250 6950
$Comp
L LED:WS2812B D7
U 1 1 60161812
P 4250 6950
F 0 "D7" V 4594 6996 50  0000 L BNN
F 1 "WS2812B" V 4594 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4300 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 4350 6575 50  0001 L TNN
	1    4250 6950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D8
U 1 1 60161818
P 4950 6950
F 0 "D8" V 5294 6996 50  0000 L BNN
F 1 "WS2812B" V 5294 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5000 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5050 6575 50  0001 L TNN
	1    4950 6950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D9
U 1 1 6016181E
P 5700 6950
F 0 "D9" V 6044 6996 50  0000 L BNN
F 1 "WS2812B" V 6044 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5750 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5800 6575 50  0001 L TNN
	1    5700 6950
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D10
U 1 1 60161824
P 6400 6950
F 0 "D10" V 6744 6996 50  0000 L BNN
F 1 "WS2812B" V 6744 6905 50  0000 L TNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6450 6650 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6500 6575 50  0001 L TNN
	1    6400 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6950 4650 6950
Wire Wire Line
	5250 6950 5400 6950
Wire Wire Line
	6000 6950 6100 6950
Wire Wire Line
	3950 6950 3850 6950
Wire Wire Line
	1400 6150 1400 6250
Connection ~ 4250 6150
Wire Wire Line
	4250 6150 3900 6150
Wire Wire Line
	2850 6250 2850 6150
Connection ~ 2850 6150
Wire Wire Line
	4250 6250 4250 6150
Wire Wire Line
	5700 6250 5700 6150
Wire Wire Line
	1400 6650 1400 6550
Wire Wire Line
	1400 6550 2100 6550
Wire Wire Line
	6400 6550 6400 6650
Wire Wire Line
	5700 6650 5700 6550
Connection ~ 5700 6550
Wire Wire Line
	5700 6550 6400 6550
Wire Wire Line
	4950 6650 4950 6550
Connection ~ 4950 6550
Wire Wire Line
	4950 6550 5700 6550
Wire Wire Line
	4250 6650 4250 6550
Connection ~ 4250 6550
Wire Wire Line
	4250 6550 4950 6550
Wire Wire Line
	3550 6650 3550 6550
Connection ~ 3550 6550
Wire Wire Line
	2850 6650 2850 6550
Connection ~ 2850 6550
Wire Wire Line
	2850 6550 3550 6550
Wire Wire Line
	2100 6650 2100 6550
Connection ~ 2100 6550
Wire Wire Line
	2100 6550 2850 6550
Connection ~ 3900 6150
$Comp
L power:+5V #PWR0110
U 1 1 60255668
P 6400 6550
F 0 "#PWR0110" H 6400 6400 50  0001 C CNN
F 1 "+5V" H 6415 6723 50  0000 C CNN
F 2 "" H 6400 6550 50  0001 C CNN
F 3 "" H 6400 6550 50  0001 C CNN
	1    6400 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6950 1100 6950
$Comp
L Device:C_Small C2
U 1 1 60293668
P 1400 6350
F 0 "C2" V 1171 6350 50  0000 C CNN
F 1 "100nF" V 1262 6350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1400 6350 50  0001 C CNN
F 3 "~" H 1400 6350 50  0001 C CNN
	1    1400 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 60300B6C
P 3900 7350
F 0 "#PWR0114" H 3900 7100 50  0001 C CNN
F 1 "GND" V 3905 7222 50  0000 R CNN
F 2 "" H 3900 7350 50  0001 C CNN
F 3 "" H 3900 7350 50  0001 C CNN
	1    3900 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 7250 1400 7350
Wire Wire Line
	1400 7350 2100 7350
Wire Wire Line
	6400 7350 6400 7250
Connection ~ 3550 7350
Wire Wire Line
	3550 7350 3900 7350
Wire Wire Line
	5700 7250 5700 7350
Connection ~ 5700 7350
Wire Wire Line
	5700 7350 6400 7350
Wire Wire Line
	4950 7250 4950 7350
Connection ~ 4950 7350
Wire Wire Line
	4950 7350 5700 7350
Wire Wire Line
	4250 7250 4250 7350
Connection ~ 4250 7350
Wire Wire Line
	4250 7350 4950 7350
Wire Wire Line
	3550 7250 3550 7350
Wire Wire Line
	2850 7250 2850 7350
Connection ~ 2850 7350
Wire Wire Line
	2850 7350 3550 7350
Wire Wire Line
	2100 7250 2100 7350
Connection ~ 2100 7350
Wire Wire Line
	2100 7350 2850 7350
Connection ~ 3900 7350
Wire Wire Line
	3900 7350 4250 7350
$Comp
L Device:C_Small C13
U 1 1 6031E2FB
P 2850 6350
F 0 "C13" V 2621 6350 50  0000 C CNN
F 1 "100nF" V 2712 6350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2850 6350 50  0001 C CNN
F 3 "~" H 2850 6350 50  0001 C CNN
	1    2850 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 6033B5C9
P 4250 6350
F 0 "C16" V 4021 6350 50  0000 C CNN
F 1 "100nF" V 4112 6350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4250 6350 50  0001 C CNN
F 3 "~" H 4250 6350 50  0001 C CNN
	1    4250 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 603584E3
P 5700 6350
F 0 "C18" V 5471 6350 50  0000 C CNN
F 1 "100nF" V 5562 6350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5700 6350 50  0001 C CNN
F 3 "~" H 5700 6350 50  0001 C CNN
	1    5700 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 6450 1400 6550
Wire Wire Line
	2850 6550 2850 6450
Wire Wire Line
	4250 6550 4250 6450
Wire Wire Line
	5700 6550 5700 6450
$Comp
L power:+5V #PWR0115
U 1 1 60254627
P 6850 3700
F 0 "#PWR0115" H 6850 3550 50  0001 C CNN
F 1 "+5V" H 6865 3873 50  0000 C CNN
F 2 "" H 6850 3700 50  0001 C CNN
F 3 "" H 6850 3700 50  0001 C CNN
	1    6850 3700
	0    1    1    0   
$EndComp
Text GLabel 6850 3300 2    50   Input ~ 0
PC8
Text GLabel 6850 3400 2    50   Input ~ 0
PC9
Text GLabel 6350 3200 0    50   Input ~ 0
PA1
Text Notes 6100 3250 2    50   ~ 0
---
Text Notes 7050 2650 0    50   ~ 0
Opto
Text GLabel 6850 2600 2    50   Input ~ 0
PB2
Text GLabel 6850 3600 2    50   Input ~ 0
PA10
Text Notes 7500 3650 2    50   ~ 0
UART1_RX
Text Notes 7100 2750 0    50   ~ 0
Encoder R
Wire Wire Line
	4250 6150 5700 6150
Wire Wire Line
	2850 6150 3900 6150
Wire Wire Line
	1400 6150 2850 6150
$Comp
L power:+5V #PWR0104
U 1 1 600A91BE
P 2250 5300
F 0 "#PWR0104" H 2250 5150 50  0001 C CNN
F 1 "+5V" H 2265 5473 50  0000 C CNN
F 2 "" H 2250 5300 50  0001 C CNN
F 3 "" H 2250 5300 50  0001 C CNN
	1    2250 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60107FAF
P 1550 5500
F 0 "R3" V 1354 5500 50  0000 C CNN
F 1 "10K" V 1445 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1550 5500 50  0001 C CNN
F 3 "~" H 1550 5500 50  0001 C CNN
	1    1550 5500
	1    0    0    -1  
$EndComp
Text GLabel 2550 5700 2    50   Input ~ 0
LED
Text GLabel 1000 6950 0    50   Input ~ 0
LED
$Comp
L Device:R_Small R4
U 1 1 6015A157
P 2250 5500
F 0 "R4" V 2054 5500 50  0000 C CNN
F 1 "10K" V 2145 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2250 5500 50  0001 C CNN
F 3 "~" H 2250 5500 50  0001 C CNN
	1    2250 5500
	-1   0    0    1   
$EndComp
Text GLabel 8750 6000 0    50   Input ~ 0
RESET
Wire Wire Line
	8900 6000 8750 6000
Wire Notes Line
	8350 5450 9500 5450
Wire Notes Line
	8350 6150 8350 5450
Wire Notes Line
	9500 6150 8350 6150
Wire Notes Line
	9500 5450 9500 6150
$Comp
L Regulator_Linear:MIC5205-5.0YM5 U2
U 1 1 5FF9ABCA
P 4950 1200
F 0 "U2" H 4950 1449 50  0000 C CNN
F 1 "MIC5205-5.0YM5" H 4950 1540 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4950 1525 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005785A.pdf" H 4950 1200 50  0001 C CNN
	1    4950 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5FFBA89D
P 5600 1350
F 0 "C14" H 5692 1396 50  0000 L CNN
F 1 "100nF" H 5692 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5600 1350 50  0001 C CNN
F 3 "~" H 5600 1350 50  0001 C CNN
	1    5600 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small_ALT D11
U 1 1 5FFC9D5F
P 6150 1300
F 0 "D11" V 6196 1232 50  0000 R CNN
F 1 "Power_On" V 6105 1232 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" V 6150 1300 50  0001 C CNN
F 3 "~" V 6150 1300 50  0001 C CNN
	1    6150 1300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5FFC9D65
P 6000 1550
F 0 "R5" V 5804 1550 50  0000 C CNN
F 1 "RLed" V 5895 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6000 1550 50  0001 C CNN
F 3 "~" H 6000 1550 50  0001 C CNN
	1    6000 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 1550 6100 1550
$Comp
L power:GND #PWR0102
U 1 1 60054FC3
P 1700 1550
F 0 "#PWR0102" H 1700 1300 50  0001 C CNN
F 1 "GND" H 1705 1422 50  0000 C CNN
F 2 "" H 1700 1550 50  0001 C CNN
F 3 "" H 1700 1550 50  0001 C CNN
	1    1700 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 1550 1500 1550
Connection ~ 1500 1550
Text GLabel 1600 1200 2    50   Input ~ 0
V_Stable
Text GLabel 2500 1200 0    50   Input ~ 0
V_Stable
Wire Notes Line
	3950 650  2050 650 
Wire Notes Line
	2050 650  2050 1700
Wire Notes Line
	2050 1700 4000 1700
Wire Notes Line
	2000 650  2000 1700
Wire Notes Line
	2000 1700 650  1700
Wire Notes Line
	650  1700 650  650 
Wire Notes Line
	650  650  2000 650 
Text Notes 700  850  0    50   ~ 0
Input Power Supply Filter\n<16V
Text GLabel 4200 1150 3    50   Input ~ 0
V_Stable
Wire Wire Line
	4650 1100 4600 1100
Wire Wire Line
	4650 1200 4600 1200
Wire Wire Line
	4600 1200 4600 1100
Connection ~ 4600 1100
Wire Wire Line
	4600 1100 4550 1100
Wire Wire Line
	5600 1550 5400 1550
Wire Wire Line
	2650 1550 2800 1550
Connection ~ 2800 1550
Connection ~ 5400 1550
$Comp
L power:GND #PWR0111
U 1 1 6025CBAA
P 4900 1550
F 0 "#PWR0111" H 4900 1300 50  0001 C CNN
F 1 "GND" H 4905 1422 50  0000 C CNN
F 2 "" H 4900 1550 50  0001 C CNN
F 3 "" H 4900 1550 50  0001 C CNN
	1    4900 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 1550 4950 1550
Wire Wire Line
	4950 1500 4950 1550
Connection ~ 4950 1550
Wire Wire Line
	4950 1550 5400 1550
Wire Wire Line
	5400 1450 5400 1550
Wire Wire Line
	5600 1450 5600 1550
Wire Wire Line
	5900 1550 5600 1550
Connection ~ 5600 1550
$Comp
L power:+3.3V #PWR0116
U 1 1 602F1495
P 3550 1100
F 0 "#PWR0116" H 3550 950 50  0001 C CNN
F 1 "+3.3V" H 3565 1273 50  0000 C CNN
F 2 "" H 3550 1100 50  0001 C CNN
F 3 "" H 3550 1100 50  0001 C CNN
	1    3550 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 602F1F58
P 6150 1000
F 0 "#PWR0117" H 6150 850 50  0001 C CNN
F 1 "+5V" H 6165 1173 50  0000 C CNN
F 2 "" H 6150 1000 50  0001 C CNN
F 3 "" H 6150 1000 50  0001 C CNN
	1    6150 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1100 3550 1200
Connection ~ 3550 1200
$Comp
L power:+3.3V #PWR0118
U 1 1 60366B59
P 9250 1200
F 0 "#PWR0118" H 9250 1050 50  0001 C CNN
F 1 "+3.3V" H 9265 1373 50  0000 C CNN
F 2 "" H 9250 1200 50  0001 C CNN
F 3 "" H 9250 1200 50  0001 C CNN
	1    9250 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0119
U 1 1 60387ADB
P 10850 6400
F 0 "#PWR0119" H 10850 6250 50  0001 C CNN
F 1 "+3.3V" H 10865 6573 50  0000 C CNN
F 2 "" H 10850 6400 50  0001 C CNN
F 3 "" H 10850 6400 50  0001 C CNN
	1    10850 6400
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0120
U 1 1 603A89BD
P 8250 5250
F 0 "#PWR0120" H 8250 5100 50  0001 C CNN
F 1 "+3.3V" H 8265 5423 50  0000 C CNN
F 2 "" H 8250 5250 50  0001 C CNN
F 3 "" H 8250 5250 50  0001 C CNN
	1    8250 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 1100 5400 1100
Wire Wire Line
	6150 1000 6150 1100
Wire Wire Line
	5600 1100 5600 1250
Connection ~ 5600 1100
Wire Wire Line
	5600 1100 6150 1100
Wire Wire Line
	5400 1100 5400 1250
Connection ~ 5400 1100
Wire Wire Line
	5400 1100 5600 1100
$Comp
L Device:CP1_Small C3
U 1 1 5FFAC280
P 5400 1350
F 0 "C3" H 5159 1396 50  0000 L CNN
F 1 "10uF" H 5159 1305 50  0000 L TNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 5400 1350 50  0001 C CNN
F 3 "~" H 5400 1350 50  0001 C CNN
	1    5400 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1200 6150 1100
Connection ~ 6150 1100
Wire Wire Line
	6150 1400 6150 1550
Text Notes 4100 850  0    50   ~ 0
Power Supply\n5V, 150mA
Wire Notes Line
	4050 650  6600 650 
Wire Notes Line
	6600 1700 4050 1700
Wire Notes Line
	6600 650  6600 1700
Wire Notes Line
	4050 650  4050 1700
$Comp
L power:+3.3V #PWR0121
U 1 1 6056CBFE
P 6350 2400
F 0 "#PWR0121" H 6350 2250 50  0001 C CNN
F 1 "+3.3V" H 6365 2573 50  0000 C CNN
F 2 "" H 6350 2400 50  0001 C CNN
F 3 "" H 6350 2400 50  0001 C CNN
	1    6350 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C19
U 1 1 605929BC
P 9950 1200
F 0 "C19" V 9721 1200 50  0000 C CNN
F 1 "100nF" V 9812 1200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9950 1200 50  0001 C CNN
F 3 "~" H 9950 1200 50  0001 C CNN
	1    9950 1200
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C17
U 1 1 605A34B4
P 9950 1050
F 0 "C17" V 9721 1050 50  0000 C CNN
F 1 "1uF" V 9812 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9950 1050 50  0001 C CNN
F 3 "~" H 9950 1050 50  0001 C CNN
	1    9950 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 1200 10150 1200
Wire Wire Line
	10150 1200 10150 1050
Wire Wire Line
	10150 1050 10050 1050
Wire Wire Line
	9850 1050 9750 1050
Wire Wire Line
	9750 1050 9750 1200
Wire Wire Line
	9850 1200 9750 1200
Connection ~ 9750 1200
Wire Wire Line
	9750 1200 9750 1300
$Comp
L power:GND #PWR0123
U 1 1 605E6F35
P 10150 1200
F 0 "#PWR0123" H 10150 950 50  0001 C CNN
F 1 "GND" V 10155 1072 50  0000 R CNN
F 2 "" H 10150 1200 50  0001 C CNN
F 3 "" H 10150 1200 50  0001 C CNN
	1    10150 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 1300 9750 1300
Connection ~ 9650 1300
Connection ~ 9750 1300
Wire Wire Line
	9750 1300 9750 1400
Wire Wire Line
	3550 6550 4250 6550
Connection ~ 6400 6550
$Comp
L Device:R_Small R6
U 1 1 5FF6E13C
P 4450 1100
F 0 "R6" V 4254 1100 50  0000 C CNN
F 1 "0R" V 4345 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 4450 1100 50  0001 C CNN
F 3 "~" H 4450 1100 50  0001 C CNN
	1    4450 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 1100 4200 1100
Wire Wire Line
	4200 1100 4200 1150
Text Notes 5750 2550 0    50   ~ 0
UART2_RX
Text Notes 7450 3250 2    50   ~ 0
UART6_RX
Text Notes 5750 3150 0    50   ~ 0
UART2_TX
Text Notes 7050 3150 0    50   ~ 0
UART6_TX
Text GLabel 1350 5700 0    50   Input ~ 0
PB7
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 60273EE0
P 1900 5600
F 0 "Q1" V 2149 5600 50  0000 C CNN
F 1 "BSS138" V 2240 5600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2100 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BSS138-D.PDF" H 1900 5600 50  0001 L CNN
	1    1900 5600
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0112
U 1 1 602E0619
P 1550 5300
F 0 "#PWR0112" H 1550 5150 50  0001 C CNN
F 1 "+3.3V" H 1565 5473 50  0000 C CNN
F 2 "" H 1550 5300 50  0001 C CNN
F 3 "" H 1550 5300 50  0001 C CNN
	1    1550 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5300 1550 5350
Wire Wire Line
	1900 5400 1900 5350
Wire Wire Line
	1900 5350 1550 5350
Connection ~ 1550 5350
Wire Wire Line
	1550 5350 1550 5400
Wire Wire Line
	1350 5700 1550 5700
Wire Wire Line
	1550 5600 1550 5700
Connection ~ 1550 5700
Wire Wire Line
	1550 5700 1700 5700
Wire Wire Line
	2100 5700 2250 5700
Wire Wire Line
	2250 5600 2250 5700
Connection ~ 2250 5700
Wire Wire Line
	2250 5700 2550 5700
Wire Wire Line
	2250 5400 2250 5300
Text Notes 8000 3750 0    50   ~ 0
Sharp FM
$EndSCHEMATC

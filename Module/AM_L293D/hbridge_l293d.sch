EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:modules
LIBS:motor_drivers
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:powerint
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:zetex
LIBS:Zilog
LIBS:adafruit
LIBS:GeekAmmo
LIBS:LilyPad-Wearables
LIBS:SparkFun-Aesthetics
LIBS:SparkFun-AnalogIC
LIBS:SparkFun-Boards
LIBS:SparkFun-Capacitors
LIBS:SparkFun-Connectors
LIBS:SparkFun-DigitalIC
LIBS:SparkFun-DiscreteSemi
LIBS:SparkFun-Displays
LIBS:SparkFun-Electromechanical
LIBS:SparkFun-FreqCtrl
LIBS:SparkFun-LED
LIBS:SparkFun-Passives
LIBS:SparkFun-PowerIC
LIBS:SparkFun-Resistors
LIBS:SparkFun-Retired
LIBS:SparkFun-RF
LIBS:SparkFun-Sensors
LIBS:Teensy_3_and_LC_Series_Boards_v1.1
LIBS:User-Submitted
LIBS:aktuator_module
EELAYER 25 0
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
L Aktuator_Module M1
U 1 1 5A8A015C
P 1300 2400
F 0 "M1" H 1300 2400 60  0000 C CNN
F 1 "Aktuator_Module" H 1300 2400 60  0000 C CNN
F 2 "Aktuator_Module:Aktuator_Module" H 1300 2400 60  0001 C CNN
F 3 "" H 1300 2400 60  0001 C CNN
	1    1300 2400
	1    0    0    -1  
$EndComp
Text GLabel 1850 1450 2    60   Input ~ 0
A_PWM
Text GLabel 1850 1650 2    60   Input ~ 0
B_PWM
$Comp
L GND #PWR1
U 1 1 5A8A0250
P 2100 2550
F 0 "#PWR1" H 2100 2300 50  0001 C CNN
F 1 "GND" H 2100 2400 50  0000 C CNN
F 2 "" H 2100 2550 50  0001 C CNN
F 3 "" H 2100 2550 50  0001 C CNN
	1    2100 2550
	1    0    0    -1  
$EndComp
$Comp
L 12V #SUPPLY2
U 1 1 5A8A027C
P 2000 2450
F 0 "#SUPPLY2" H 2000 2450 50  0001 L BNN
F 1 "12V" H 1960 2590 50  0000 L BNN
F 2 "" H 2000 2450 60  0001 C CNN
F 3 "" H 2000 2450 60  0001 C CNN
	1    2000 2450
	-1   0    0    1   
$EndComp
$Comp
L 5V #SUPPLY1
U 1 1 5A8A0292
P 1900 2300
F 0 "#SUPPLY1" H 1900 2300 50  0001 L BNN
F 1 "5V" H 1860 2440 50  0000 L BNN
F 2 "" H 1900 2300 60  0001 C CNN
F 3 "" H 1900 2300 60  0001 C CNN
	1    1900 2300
	-1   0    0    1   
$EndComp
Text GLabel 1850 1850 2    60   Input ~ 0
A_ENC
Text GLabel 1850 1550 2    60   Input ~ 0
B_ENC
$Comp
L L293D U1
U 1 1 5A8A0355
P 5200 2050
F 0 "U1" H 5000 3075 50  0000 R CNN
F 1 "L293D" H 5000 3000 50  0000 R CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 5450 1300 50  0001 L CNN
F 3 "" H 4900 2750 50  0001 C CNN
	1    5200 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 5A8A03EE
P 5000 2900
F 0 "#PWR5" H 5000 2650 50  0001 C CNN
F 1 "GND" H 5000 2750 50  0000 C CNN
F 2 "" H 5000 2900 50  0001 C CNN
F 3 "" H 5000 2900 50  0001 C CNN
	1    5000 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR6
U 1 1 5A8A0431
P 5100 2900
F 0 "#PWR6" H 5100 2650 50  0001 C CNN
F 1 "GND" H 5100 2750 50  0000 C CNN
F 2 "" H 5100 2900 50  0001 C CNN
F 3 "" H 5100 2900 50  0001 C CNN
	1    5100 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR8
U 1 1 5A8A0442
P 5300 2900
F 0 "#PWR8" H 5300 2650 50  0001 C CNN
F 1 "GND" H 5300 2750 50  0000 C CNN
F 2 "" H 5300 2900 50  0001 C CNN
F 3 "" H 5300 2900 50  0001 C CNN
	1    5300 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 5A8A0453
P 5400 2900
F 0 "#PWR9" H 5400 2650 50  0001 C CNN
F 1 "GND" H 5400 2750 50  0000 C CNN
F 2 "" H 5400 2900 50  0001 C CNN
F 3 "" H 5400 2900 50  0001 C CNN
	1    5400 2900
	1    0    0    -1  
$EndComp
Text GLabel 4550 1450 0    60   Input ~ 0
A_PWM
Text GLabel 4550 2250 0    60   Input ~ 0
A_PWM
Text GLabel 5750 1450 2    60   Input ~ 0
A_OUT
Text GLabel 5750 2250 2    60   Input ~ 0
A_OUT
Text GLabel 5750 1650 2    60   Input ~ 0
B_OUT
Text GLabel 5750 2050 2    60   Input ~ 0
B_OUT
Text GLabel 4550 1650 0    60   Input ~ 0
B_PWM
Text GLabel 4550 2050 0    60   Input ~ 0
B_PWM
$Comp
L 5V #SUPPLY5
U 1 1 5A8A092B
P 5100 1000
F 0 "#SUPPLY5" H 5100 1000 50  0001 L BNN
F 1 "5V" H 5060 1140 50  0000 L BNN
F 2 "" H 5100 1000 60  0001 C CNN
F 3 "" H 5100 1000 60  0001 C CNN
	1    5100 1000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR7
U 1 1 5A8A0967
P 5300 1000
F 0 "#PWR7" H 5300 850 50  0001 C CNN
F 1 "VCC" H 5300 1150 50  0000 C CNN
F 2 "" H 5300 1000 50  0001 C CNN
F 3 "" H 5300 1000 50  0001 C CNN
	1    5300 1000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X03 J1
U 1 1 5A8A09B5
P 2800 3000
F 0 "J1" H 2800 3200 50  0000 C CNN
F 1 "CONN_01X03" V 2900 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 2800 3000 50  0001 C CNN
F 3 "" H 2800 3000 50  0001 C CNN
	1    2800 3000
	0    -1   -1   0   
$EndComp
$Comp
L 12V #SUPPLY3
U 1 1 5A8A0AA2
P 2700 3250
F 0 "#SUPPLY3" H 2700 3250 50  0001 L BNN
F 1 "12V" H 2660 3390 50  0000 L BNN
F 2 "" H 2700 3250 60  0001 C CNN
F 3 "" H 2700 3250 60  0001 C CNN
	1    2700 3250
	-1   0    0    1   
$EndComp
$Comp
L Screw_Terminal_1x02 J2
U 1 1 5A8A0B15
P 3600 3000
F 0 "J2" H 3600 3250 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 3450 3000 50  0000 C TNN
F 2 "Connectors_JST:JST_EH_B02B-EH-A_02x2.50mm_Straight" H 3600 2775 50  0001 C CNN
F 3 "" H 3575 3000 50  0001 C CNN
	1    3600 3000
	0    1    1    0   
$EndComp
Text GLabel 3500 3250 3    60   Input ~ 0
IN_VCC
$Comp
L GND #PWR4
U 1 1 5A8A0C41
P 3700 3250
F 0 "#PWR4" H 3700 3000 50  0001 C CNN
F 1 "GND" H 3700 3100 50  0000 C CNN
F 2 "" H 3700 3250 50  0001 C CNN
F 3 "" H 3700 3250 50  0001 C CNN
	1    3700 3250
	1    0    0    -1  
$EndComp
Text GLabel 2900 3250 3    60   Input ~ 0
IN_VCC
$Comp
L VCC #PWR2
U 1 1 5A8A0DA3
P 2800 3250
F 0 "#PWR2" H 2800 3100 50  0001 C CNN
F 1 "VCC" H 2800 3400 50  0000 C CNN
F 2 "" H 2800 3250 50  0001 C CNN
F 3 "" H 2800 3250 50  0001 C CNN
	1    2800 3250
	-1   0    0    1   
$EndComp
Text GLabel 7300 1600 0    60   Input ~ 0
A_OUT
Text GLabel 7300 1800 0    60   Input ~ 0
B_OUT
$Comp
L Screw_Terminal_1x02 J3
U 1 1 5A8A113D
P 7550 1700
F 0 "J3" H 7550 1950 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 7400 1700 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 7550 1475 50  0001 C CNN
F 3 "" H 7525 1700 50  0001 C CNN
	1    7550 1700
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X04 J4
U 1 1 5A8A160B
P 3350 1750
F 0 "J4" H 3350 2000 50  0000 C CNN
F 1 "CONN_01X04" V 3450 1750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 3350 1750 50  0001 C CNN
F 3 "" H 3350 1750 50  0001 C CNN
	1    3350 1750
	1    0    0    -1  
$EndComp
$Comp
L 5V #SUPPLY4
U 1 1 5A8A16A2
P 3100 1550
F 0 "#SUPPLY4" H 3100 1550 50  0001 L BNN
F 1 "5V" H 3060 1690 50  0000 L BNN
F 2 "" H 3100 1550 60  0001 C CNN
F 3 "" H 3100 1550 60  0001 C CNN
	1    3100 1550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR3
U 1 1 5A8A16BF
P 3100 1950
F 0 "#PWR3" H 3100 1700 50  0001 C CNN
F 1 "GND" H 3100 1800 50  0000 C CNN
F 2 "" H 3100 1950 50  0001 C CNN
F 3 "" H 3100 1950 50  0001 C CNN
	1    3100 1950
	1    0    0    -1  
$EndComp
Text GLabel 3100 1800 0    60   Input ~ 0
A_ENC
Text GLabel 3100 1700 0    60   Input ~ 0
B_ENC
Wire Wire Line
	1850 2250 1900 2250
Wire Wire Line
	1900 2250 1900 2300
Wire Wire Line
	2000 2450 2000 2150
Wire Wire Line
	2000 2150 1850 2150
Wire Wire Line
	1850 2050 2100 2050
Wire Wire Line
	2100 2050 2100 2550
Wire Wire Line
	5300 2850 5300 2900
Wire Wire Line
	5400 2850 5400 2900
Wire Wire Line
	5100 2850 5100 2900
Wire Wire Line
	5000 2850 5000 2900
Wire Wire Line
	4700 2450 4600 2450
Wire Wire Line
	4600 2450 4600 1850
Wire Wire Line
	4600 1850 4700 1850
Wire Wire Line
	4550 2250 4700 2250
Wire Wire Line
	4550 1450 4700 1450
Wire Wire Line
	5700 1450 5750 1450
Wire Wire Line
	5700 2250 5750 2250
Wire Wire Line
	5700 1650 5750 1650
Wire Wire Line
	5700 2050 5750 2050
Wire Wire Line
	4550 2050 4700 2050
Wire Wire Line
	4550 1650 4700 1650
Wire Wire Line
	5100 1000 5100 1050
Wire Wire Line
	5300 1000 5300 1050
Wire Wire Line
	2700 3200 2700 3250
Wire Wire Line
	2900 3200 2900 3250
Wire Wire Line
	2800 3200 2800 3250
Wire Wire Line
	3500 3200 3500 3250
Wire Wire Line
	3700 3200 3700 3250
Wire Wire Line
	7300 1600 7350 1600
Wire Wire Line
	7300 1800 7350 1800
Wire Wire Line
	3150 1600 3100 1600
Wire Wire Line
	3100 1600 3100 1550
Wire Wire Line
	3100 1700 3150 1700
Wire Wire Line
	3100 1800 3150 1800
Wire Wire Line
	3100 1950 3100 1900
Wire Wire Line
	3100 1900 3150 1900
$EndSCHEMATC

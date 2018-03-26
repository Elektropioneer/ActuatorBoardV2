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
LIBS:Zilog
LIBS:zetex
LIBS:Xicor
LIBS:Worldsemi
LIBS:wiznet
LIBS:video
LIBS:ttl_ieee
LIBS:triac_thyristor
LIBS:transf
LIBS:switches
LIBS:supertex
LIBS:stm32
LIBS:stm8
LIBS:silabs
LIBS:sensors
LIBS:rfcom
LIBS:relays
LIBS:references
LIBS:pspice
LIBS:Power_Management
LIBS:powerint
LIBS:Oscillators
LIBS:onsemi
LIBS:nxp_armmcu
LIBS:nxp
LIBS:nordicsemi
LIBS:msp430
LIBS:motors
LIBS:motor_drivers
LIBS:modules
LIBS:microchip_pic32mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic10mcu
LIBS:microchip_dspic33dsc
LIBS:mechanical
LIBS:maxim
LIBS:logo
LIBS:leds
LIBS:Lattice
LIBS:ir
LIBS:hc11
LIBS:graphic
LIBS:gennum
LIBS:ftdi
LIBS:ESD_Protection
LIBS:elec-unifil
LIBS:diode
LIBS:dc-dc
LIBS:cmos_ieee
LIBS:brooktre
LIBS:bosch
LIBS:bbd
LIBS:battery_management
LIBS:analog_devices
LIBS:Altera
LIBS:allegro
LIBS:actel
LIBS:ac-dc
LIBS:74xgxx
LIBS:aktuator_module
LIBS:AM_AX-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "AX Module"
Date "2018-03-18"
Rev "1.0"
Comp "Electropioneer"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74LS241 U1
U 1 1 5AA2B9DA
P 1950 2950
F 0 "U1" H 2000 2750 50  0000 C CNN
F 1 "74LS241" H 2050 2550 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 1950 2950 50  0001 C CNN
F 3 "" H 1950 2950 50  0001 C CNN
	1    1950 2950
	1    0    0    -1  
$EndComp
Text GLabel 1150 3400 0    60   Input ~ 0
CONTROL
Text GLabel 1200 3150 0    60   Input ~ 0
TX
Text GLabel 1200 2450 0    60   Input ~ 0
AX_SIGNAL
Text GLabel 2700 3150 2    60   Input ~ 0
AX_SIGNAL
Text GLabel 2700 2450 2    60   Input ~ 0
RX
$Comp
L +5V #PWR01
U 1 1 5AA2BB6E
P 1650 2350
F 0 "#PWR01" H 1650 2200 50  0001 C CNN
F 1 "+5V" H 1650 2490 50  0000 C CNN
F 2 "" H 1650 2350 50  0001 C CNN
F 3 "" H 1650 2350 50  0001 C CNN
	1    1650 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AA2BB9E
P 1650 3550
F 0 "#PWR02" H 1650 3300 50  0001 C CNN
F 1 "GND" H 1650 3400 50  0000 C CNN
F 2 "" H 1650 3550 50  0001 C CNN
F 3 "" H 1650 3550 50  0001 C CNN
	1    1650 3550
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X02 J1
U 1 1 5AA2BC40
P 2700 750
F 0 "J1" H 2700 900 50  0000 C CNN
F 1 "CONN_02X02" H 2700 600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x02_Pitch2.54mm" H 2700 -450 50  0001 C CNN
F 3 "" H 2700 -450 50  0001 C CNN
	1    2700 750 
	1    0    0    -1  
$EndComp
Text GLabel 3000 800  2    60   Input ~ 0
TX
Text GLabel 3000 700  2    60   Input ~ 0
RX
Text GLabel 2400 800  0    60   Input ~ 0
MOD_TX
Text GLabel 2400 700  0    60   Input ~ 0
MOD_RX
$Comp
L Aktuator_Module M1
U 1 1 5AA2BDB1
P 700 1800
F 0 "M1" H 700 1800 60  0000 C CNN
F 1 "Aktuator_Module" H 700 1800 60  0000 C CNN
F 2 "Aktuator_Module:Aktuator_Module" H 700 1800 60  0001 C CNN
F 3 "" H 700 1800 60  0001 C CNN
	1    700  1800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 5AA2BE4B
P 1300 1650
F 0 "#PWR03" H 1300 1500 50  0001 C CNN
F 1 "+5V" H 1300 1790 50  0000 C CNN
F 2 "" H 1300 1650 50  0001 C CNN
F 3 "" H 1300 1650 50  0001 C CNN
	1    1300 1650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR04
U 1 1 5AA2BED1
P 1300 1450
F 0 "#PWR04" H 1300 1200 50  0001 C CNN
F 1 "GND" H 1300 1300 50  0000 C CNN
F 2 "" H 1300 1450 50  0001 C CNN
F 3 "" H 1300 1450 50  0001 C CNN
	1    1300 1450
	0    -1   -1   0   
$EndComp
Text GLabel 1300 1250 2    60   Input ~ 0
CONTROL
Text GLabel 1300 950  2    60   Input ~ 0
MOD_RX
Text GLabel 1300 1050 2    60   Input ~ 0
MOD_TX
NoConn ~ 1250 850 
NoConn ~ 1250 750 
$Comp
L CONN_01X03 J3
U 1 1 5AA2D07A
P 5400 900
F 0 "J3" H 5400 1100 50  0000 C CNN
F 1 "CONN_01X03" V 5500 900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5400 900 50  0001 C CNN
F 3 "" H 5400 900 50  0001 C CNN
	1    5400 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 3350 1250 3350
Wire Wire Line
	1200 3350 1200 3450
Wire Wire Line
	1200 3450 1250 3450
Wire Wire Line
	1200 3400 1150 3400
Connection ~ 1200 3400
Wire Wire Line
	1200 2450 1250 2450
Wire Wire Line
	1200 3150 1250 3150
Wire Wire Line
	2700 3150 2650 3150
Wire Wire Line
	2650 2450 2700 2450
Wire Wire Line
	1650 3500 1650 3550
Wire Wire Line
	1650 2400 1650 2350
Wire Wire Line
	2400 700  2450 700 
Wire Wire Line
	2400 800  2450 800 
Wire Wire Line
	2950 700  3000 700 
Wire Wire Line
	3000 800  2950 800 
Wire Wire Line
	1300 1450 1250 1450
Wire Wire Line
	1250 1650 1300 1650
Wire Wire Line
	1250 950  1300 950 
Wire Wire Line
	1250 1050 1300 1050
Wire Wire Line
	1250 1250 1300 1250
$Comp
L Screw_Terminal_1x02 J2
U 1 1 5AA2D28D
P 3850 850
F 0 "J2" H 3850 1100 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 3700 850 50  0000 C TNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 3850 625 50  0001 C CNN
F 3 "" H 3825 850 50  0001 C CNN
	1    3850 850 
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 5AA2D312
P 4500 900
F 0 "C1" H 4525 1000 50  0000 L CNN
F 1 "CP" H 4525 800 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_5x5.3" H 4538 750 50  0001 C CNN
F 3 "" H 4500 900 50  0001 C CNN
	1    4500 900 
	1    0    0    -1  
$EndComp
Text GLabel 5200 900  0    60   Input ~ 0
AX_SIGNAL
$Comp
L D D1
U 1 1 5AA2D551
P 4250 750
F 0 "D1" H 4250 850 50  0000 C CNN
F 1 "D" H 4250 650 50  0000 C CNN
F 2 "Diodes_SMD:D_SMB_Standard" H 4250 750 50  0001 C CNN
F 3 "" H 4250 750 50  0001 C CNN
	1    4250 750 
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 750  4100 750 
Wire Wire Line
	4400 750  4700 750 
Wire Wire Line
	4700 750  4700 800 
Connection ~ 4500 750 
Wire Wire Line
	4050 950  4100 950 
Wire Wire Line
	4100 950  4100 1050
Wire Wire Line
	4100 1050 4700 1050
Wire Wire Line
	4700 1050 4700 1000
Connection ~ 4500 1050
$Comp
L GND #PWR05
U 1 1 5AA2DCE0
P 4500 1100
F 0 "#PWR05" H 4500 850 50  0001 C CNN
F 1 "GND" H 4500 950 50  0000 C CNN
F 2 "" H 4500 1100 50  0001 C CNN
F 3 "" H 4500 1100 50  0001 C CNN
	1    4500 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1050 4500 1100
Wire Wire Line
	4700 800  5200 800 
Wire Wire Line
	4700 1000 5200 1000
$EndSCHEMATC

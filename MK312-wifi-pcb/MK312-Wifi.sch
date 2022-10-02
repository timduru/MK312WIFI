EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 8000 5600
encoding utf-8
Sheet 1 1
Title "MK312 ESP WiFi Interface"
Date "2022-04-05"
Rev "v1.2"
Comp "RexLabs & cLx"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L esp:ESP-01 J2
U 1 1 620BB733
P 4300 1800
F 0 "J2" H 4125 2125 50  0000 C CNN
F 1 "ESP-01" H 4125 2034 50  0000 C CNN
F 2 "ESP Wifi Interface:ESP_2x04" H 3850 1700 50  0001 C CNN
F 3 "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwix9-rmlv_1AhUC8BoKHYp8AFEQFnoECAIQAQ&url=https%3A%2F%2Fwww.microchip.ua%2Fwireless%2Fesp01.pdf&usg=AOvVaw2HW7X9VN-wjcSvhB_ViZWO" H 3850 1700 50  0001 C CNN
	1    4300 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 620BC83D
P 2200 1900
F 0 "J1" H 2300 2350 50  0000 C CNN
F 1 "MK312 Interface" H 2300 2250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06_Pitch2.54mm" H 2200 1900 50  0001 C CNN
F 3 "~" H 2200 1900 50  0001 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
NoConn ~ 2400 2200
Wire Wire Line
	2400 2100 2750 2100
Text Label 2450 1700 0    50   ~ 0
STATE_LED
Text Label 2450 1800 0    50   ~ 0
TX
Text Label 2450 1900 0    50   ~ 0
RX
Text Label 2450 2000 0    50   ~ 0
GND
Text Label 2450 2100 0    50   ~ 0
+5V
Wire Wire Line
	4550 1700 4650 1700
Connection ~ 4650 1700
Wire Wire Line
	4650 1700 4650 1500
$Comp
L power:GND #PWR0101
U 1 1 620BE381
P 2900 2250
F 0 "#PWR0101" H 2900 2000 50  0001 C CNN
F 1 "GND" H 2905 2077 50  0000 C CNN
F 2 "" H 2900 2250 50  0001 C CNN
F 3 "" H 2900 2250 50  0001 C CNN
	1    2900 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2000 2900 2250
Wire Wire Line
	2400 2000 2900 2000
$Comp
L power:GND #PWR0102
U 1 1 620BEAF5
P 3600 2100
F 0 "#PWR0102" H 3600 1850 50  0001 C CNN
F 1 "GND" H 3605 1927 50  0000 C CNN
F 2 "" H 3600 2100 50  0001 C CNN
F 3 "" H 3600 2100 50  0001 C CNN
	1    3600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2000 3600 2000
Wire Wire Line
	3600 2000 3600 2100
Wire Wire Line
	3200 1700 3200 2450
Wire Wire Line
	3200 2450 5050 2450
Wire Wire Line
	2400 1700 3200 1700
NoConn ~ 4550 1800
Wire Wire Line
	4550 1900 4650 1900
Wire Wire Line
	4650 1700 4650 1900
$Comp
L Switch:SW_Push SW1
U 1 1 620C188C
P 3350 1400
F 0 "SW1" H 3350 1685 50  0000 C CNN
F 1 "SW_Push" H 3350 1594 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 3350 1600 50  0001 C CNN
F 3 "~" H 3350 1600 50  0001 C CNN
	1    3350 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 620C2285
P 3150 1400
F 0 "#PWR0103" H 3150 1150 50  0001 C CNN
F 1 "GND" H 3155 1227 50  0000 C CNN
F 2 "" H 3150 1400 50  0001 C CNN
F 3 "" H 3150 1400 50  0001 C CNN
	1    3150 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1700 3600 1700
Wire Wire Line
	3600 1700 3600 1400
Wire Wire Line
	3600 1400 3550 1400
Wire Wire Line
	2400 1800 3700 1800
Wire Wire Line
	2400 1900 3700 1900
$Comp
L power:+3.3V #PWR0104
U 1 1 620ABD5B
P 4650 1500
F 0 "#PWR0104" H 4650 1350 50  0001 C CNN
F 1 "+3.3V" H 4665 1673 50  0000 C CNN
F 2 "" H 4650 1500 50  0001 C CNN
F 3 "" H 4650 1500 50  0001 C CNN
	1    4650 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2100 2750 2850
$Comp
L Regulator_Linear:AMS1117-3.3 U1
U 1 1 620AD5A0
P 4100 2850
F 0 "U1" H 4100 3092 50  0000 C CNN
F 1 "AMS1117-3.3" H 4100 3001 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 4100 3050 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 4200 2600 50  0001 C CNN
	1    4100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2850 3500 2850
Wire Wire Line
	4400 2850 4650 2850
$Comp
L power:+3.3V #PWR0105
U 1 1 620AEDBE
P 4650 2800
F 0 "#PWR0105" H 4650 2650 50  0001 C CNN
F 1 "+3.3V" H 4665 2973 50  0000 C CNN
F 2 "" H 4650 2800 50  0001 C CNN
F 3 "" H 4650 2800 50  0001 C CNN
	1    4650 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 620AFC68
P 3500 3100
F 0 "C1" H 3615 3146 50  0000 L CNN
F 1 "100n" H 3615 3055 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 3538 2950 50  0001 C CNN
F 3 "~" H 3500 3100 50  0001 C CNN
	1    3500 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 620B0121
P 4650 3100
F 0 "C2" H 4765 3146 50  0000 L CNN
F 1 "100n" H 4765 3055 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 4688 2950 50  0001 C CNN
F 3 "~" H 4650 3100 50  0001 C CNN
	1    4650 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 620B070A
P 3500 3250
F 0 "#PWR0106" H 3500 3000 50  0001 C CNN
F 1 "GND" H 3505 3077 50  0000 C CNN
F 2 "" H 3500 3250 50  0001 C CNN
F 3 "" H 3500 3250 50  0001 C CNN
	1    3500 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 620B0968
P 4650 3250
F 0 "#PWR0107" H 4650 3000 50  0001 C CNN
F 1 "GND" H 4655 3077 50  0000 C CNN
F 2 "" H 4650 3250 50  0001 C CNN
F 3 "" H 4650 3250 50  0001 C CNN
	1    4650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2950 3500 2850
Connection ~ 3500 2850
Wire Wire Line
	3500 2850 3800 2850
Wire Wire Line
	4650 2950 4650 2850
Connection ~ 4650 2850
Wire Wire Line
	4650 2850 4650 2800
$Comp
L power:GND #PWR0108
U 1 1 620B145F
P 4100 3250
F 0 "#PWR0108" H 4100 3000 50  0001 C CNN
F 1 "GND" H 4105 3077 50  0000 C CNN
F 2 "" H 4100 3250 50  0001 C CNN
F 3 "" H 4100 3250 50  0001 C CNN
	1    4100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3150 4100 3250
Wire Wire Line
	4650 1700 5050 1700
Wire Wire Line
	4550 2000 4650 2000
Wire Wire Line
	4650 2000 4650 2100
Wire Wire Line
	5050 1700 5050 1900
Wire Wire Line
	4650 2100 4750 2100
Wire Wire Line
	5050 2450 5050 2300
$Comp
L Transistor_BJT:PN2222A Q1
U 1 1 624B7ECC
P 4950 2100
F 0 "Q1" H 5140 2146 50  0000 L CNN
F 1 "PN2222A" H 5140 2055 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Wide_Oval" H 5150 2025 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/PN2222-D.PDF" H 4950 2100 50  0001 L CNN
	1    4950 2100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 624EB222
P 2900 2000
F 0 "#FLG0101" H 2900 2075 50  0001 C CNN
F 1 "PWR_FLAG" V 2900 2128 50  0001 L CNN
F 2 "" H 2900 2000 50  0001 C CNN
F 3 "~" H 2900 2000 50  0001 C CNN
	1    2900 2000
	0    1    1    0   
$EndComp
Connection ~ 2900 2000
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 624EC110
P 2750 2100
F 0 "#FLG0102" H 2750 2175 50  0001 C CNN
F 1 "PWR_FLAG" V 2750 2228 50  0001 L CNN
F 2 "" H 2750 2100 50  0001 C CNN
F 3 "~" H 2750 2100 50  0001 C CNN
	1    2750 2100
	0    1    1    0   
$EndComp
Connection ~ 2750 2100
$EndSCHEMATC

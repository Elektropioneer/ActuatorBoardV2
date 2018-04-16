
#include <Arduino.h>

/******************************************************************
*                           RELAY module                          *
*******************************************************************/
void setup_relay(uint8_t module);
void switch_relay(uint8_t module);
int status_relay(uint8_t module);

void setup_l293d();
void write_l293d(uint8_t pwm, int dir);
void stop_l293d(void);

void setup_stepper(uint8_t rpm, uint8_t module);
void write_stepper(long angle, uint8_t module);
void set_rpm_stepper(uint8_t rpm, uint8_t module);

void setup_ax(long baud,uint8_t Rx_Ax, uint8_t Tx_Ax, uint8_t Id);
void ax_move(uint8_t Id, uint16_t position);
void ax_movespeed(uint8_t Id, uint16_t position, uint16_t speed);
void ax_led(uint8_t Id, uint8_t LedAlarm);
int ax_get_moving(uint8_t Id);
int ax_get_position(uint8_t Id);
int ax_get_temp(uint8_t Id);
int ax_get_voltage(uint8_t Id);

void setup_stepper_2();
void stepper_2_move(uint8_t direction, uint8_t speed, uint8_t revolutions);

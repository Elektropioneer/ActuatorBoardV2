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

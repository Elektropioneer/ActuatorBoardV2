#include <Arduino.h>
#include <BasicStepperDriver.h>
#include "modules.h"

BasicStepperDriver stepper_mod1(200, 6, 2);
BasicStepperDriver stepper_mod2(200, 3, 7);
BasicStepperDriver stepper_mod3(200, 11, 10);

/******************************************************************
*                           RELAY module                          *
*******************************************************************/

static uint8_t get_relay(uint8_t module) {
  uint8_t pin = 0;
  switch(module) {
    case 1: pin = 2;  break;
    case 2: pin = 7;  break;
    case 3: pin = 10; break;
    case 4: pin = A1; break;
    case 5: pin = A4; break;
    case 6: pin = A5; break;
  }
  return pin;
}

void setup_relay(uint8_t module) { pinMode(get_relay(module), OUTPUT); }
void switch_relay(uint8_t module) { digitalWrite(get_relay(module), !digitalRead(get_relay(module))); }
int status_relay(uint8_t module) { return digitalRead(get_relay(module)); }

/******************************************************************
*                           L293D module                          *
*******************************************************************/

void setup_l293d() {
  // only used for M1 module!
  pinMode(2, INPUT);  // A encoder
  pinMode(4, INPUT);  // B encoder
  pinMode(6, OUTPUT); // PWM
  pinMode(5, OUTPUT); // PWM

  //https://arduino-info.wikispaces.com/Arduino-PWM-Frequency?responseToken=4686e110cc1f147088c13606eb4ca6f0
  TCCR0B = TCCR0B & B11111000 | B00000001;

}

void write_l293d(uint8_t pwm, uint8_t dir) {
  if(dir) {
    digitalWrite(6, LOW);
    analogWrite(5, pwm);
  } else {
    digitalWrite(5, LOW);
    analogWrite(6, pwm);
  }
}

void stop_l293d(void) {
  digitalWrite(6, HIGH);
  digitalWrite(5, HIGH);
}

/******************************************************************
*                         Stepper module                          *
*******************************************************************/

/*static get_stepper_dir(uint8_t module) {
  if(module == 1) {
    return 6;
  } else if(module == 2) {
    return 3;
  } else if(module == 3) {
    return 11;
  }
}

static get_stepper_step(uint8_t module) {
  if(module == 1) {
    return 2;
  } else if(module == 2) {
    return 7;
  } else if(module == 3) {
    return 10;
  }
}*/

void setup_stepper(uint8_t rpm, uint8_t module) {
  switch(module) {
    case 1:
      //step: D2
      //dir: D6
      stepper_mod1.begin(rpm, 1);
      break;
    case 2:
      //step: D7
      //dir:  D3
      stepper_mod2.begin(rpm, 1);
      break;
    case 3:
      //step: D10
      //dir: D11
      stepper_mod3.begin(rpm, 1);
      break;
  }
}

void write_stepper(long angle, uint8_t module) {
  switch(module) {
    case 1:
      //step: D2
      //dir: D6
      stepper_mod1.rotate(angle);
      break;
    case 2:
      //step: D7
      //dir:  D3
      stepper_mod2.rotate(angle);
      break;
    case 3:
      //step: D10
      //dir: D11
      stepper_mod3.rotate(angle);
      break;
  }
}

void set_rpm_stepper(uint8_t rpm, uint8_t module) {
  switch(module) {
    case 1:
      //step: D2
      //dir: D6
      stepper_mod1.setRPM((short)(rpm));
      break;
    case 2:
      //step: D7
      //dir:  D3
      stepper_mod2.setRPM((short)(rpm));
      break;
    case 3:
      //step: D10
      //dir: D11
      stepper_mod3.setRPM((short)(rpm));
      break;
  }
}

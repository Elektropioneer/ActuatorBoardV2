#include <Arduino.h>
#include <BasicStepperDriver.h>
#include "modules.h"
#include <DynamixelSoftSerial.h>
#include <SoftwareSerial.h>

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
//  pinMode(2, INPUT);  // A encoder
  //pinMode(4, INPUT);  // B encoder
  pinMode(A0, OUTPUT);
  pinMode(11, OUTPUT);//pwm
  pinMode(10, OUTPUT);

  //https://arduino-info.wikispaces.com/Arduino-PWM-Frequency?responseToken=4686e110cc1f147088c13606eb4ca6f0
//  TCCR1B = TCCR1B & B11111000 | B00000001;

}

void write_l293d(uint8_t pwm, int dir) {
  if(dir == 1) {
    digitalWrite(A0, LOW);
    digitalWrite(10, HIGH);
  } else {
    digitalWrite(A0, HIGH);
    digitalWrite(10, LOW);
  }

  analogWrite(11, (int)pwm);
}

void stop_l293d(void) {
  digitalWrite(A0, HIGH);
  digitalWrite(10, HIGH);
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

/******************************************************************
*                         Ax Module                          *
*******************************************************************/

/* SETUP */
void setup_ax(uint8_t baud,uint8_t Rx_Ax, uint8_t Tx_Ax, uint8_t Id) {
  /*
  D7: Id
  D8: Rx_Ax
  D3: Tx_Ax
  */
  Dynamixel.begin((long)(baud), Rx_Ax, Tx_Ax, Id );
}

/*ACTION*/
void ax_move(uint8_t Id, uint16_t position) {
    Dynamixel.move(Id, position);
}

void ax_movespeed(uint8_t Id, uint16_t position, uint16_t speed) {

  Dynamixel.moveSpeed(Id, position, speed);

}

void ax_led(uint8_t Id, uint8_t LedAlarm) {
  Dynamixel.setLEDAlarm(Id, LedAlarm);
}

/* STATUS */
int ax_get_moving(uint8_t Id) {
  int x = Dynamixel.moving(Id);
  return x;
}

int ax_get_position(uint8_t Id) {
  int x = Dynamixel.readPosition(Id);
  return x;
}

int ax_get_temp(uint8_t Id) {
  int x = Dynamixel.readTemperature(Id);
  return x;
}


int ax_get_voltage(uint8_t Id) {
  int x = Dynamixel.readVoltage(Id);
  return x;
}

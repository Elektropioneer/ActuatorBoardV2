#include <Arduino.h>
#include <PacketSerial.h>
#include <A4988.h>
#include "modules.h"
#include "motor.h"

PacketSerial myPacketSerial;

uint8_t enable_motor_regulator = 0;
double motor_achieve;

void onPacketReceived(const uint8_t* buffer, size_t size)
{
    switch(buffer[0]) {
      // setup
      case 's':
        switch(buffer[1]) {
          case 'r':
            // relay
            setup_relay(buffer[2]); // setup relay on module buffer[2]
            break;
          case 'm':
            // motor
            setup_l293d();
            motor_setup();
            motor_achieve = (buffer[2] << 8) | buffer[3];
            enable_motor_regulator = 1;
            break;
          case 's':
            setup_stepper(buffer[2], buffer[3]); // setup relay rpm on buf2 and module num on 3
            break;
        }
        break;
      // control
      case 'c':
        switch(buffer[1]) {
          case 'r':
            switch_relay(buffer[2]); // switch the relay on modules buffer[2]
            break;
          case 'm':
            motor_achieve = (buffer[2] << 8) | buffer[3];
            break;
          case 's':
            if(buffer[2] == 'a') { // angle
              uint8_t mod = buffer[3];
              long angle = (buffer[4] << 8) | buffer[5];

              write_stepper(angle, mod);
            } else if(buffer[2] == 'r') {//rpm
              set_rpm_stepper(buffer[3], buffer[4]);
            }
        }
        break;
      // status
      case 'S':
        switch(buffer[1]) {
          case 'r':
            uint8_t bufr[2];
            bufr[0] = buffer[1];
            bufr[1] = status_relay(buffer[2]);
            myPacketSerial.send(bufr, 2);
            break;
          case 'm':
            uint8_t bufm[3];
            bufm[0] = buffer[1];
            bufm[1] = motor_read() >> 8;
            bufm[2] = motor_read() & 0xFF;
            myPacketSerial.send(bufm, 2);
            break;
        }
        break;
    }
}

void setup() {
/*  myPacketSerial.begin(9600);
  myPacketSerial.setPacketHandler(&onPacketReceived);*/
  setup_l293d();
  motor_setup();
  motor_achieve = 100;
}

void loop() {
  if(enable_motor_regulator) {
    motor_regulate(motor_achieve);
  }
//  myPacketSerial.update();

}

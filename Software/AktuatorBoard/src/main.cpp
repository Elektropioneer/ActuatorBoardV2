#include <Arduino.h>
#include <PacketSerial.h>
#include <A4988.h>
#include "modules.h"
#include "motor.h"

// packetserial object
PacketSerial myPacketSerial;

// enabling motor regulator
uint8_t enable_motor_regulator = 0;
// the encoder number which the motor should achieve
double motor_achieve;

/*
 * Function:    void onPacketReceived(const uint8_t* buffer, size_t size)
 * Description: analyses the buffer
 */
void onPacketReceived(const uint8_t* buffer, size_t size)
{
    // switching the first byte
    switch(buffer[0]) {
      // SETUP
      case 's':
        switch(buffer[1]) {
          // {'s', 'r', pin} - RELAY SETUP
          case 'r':
            setup_relay(buffer[2]); // setup relay on module buffer[2]
            break;
          // { } - L293D SETUP
          case 'l':
            setup_l293d();
            break;
          // {'s','m',low_achieve, high_achieve} - MOTOR SETUP
          case 'm':
            // motor
            setup_l293d();
            motor_setup();
            motor_achieve = (buffer[2] << 8) | buffer[3];
            enable_motor_regulator = 1;
            break;
          // {'s','s',rpm, module} - STEPPER SETUP
          case 's':
            setup_stepper(buffer[2], buffer[3]);
            break;
        }
        break;

        // CONTROL
        case 'c':
          switch(buffer[1]) {
            // {'c','r',pin} - RELAY CONTROL
            case 'r':
              switch_relay(buffer[2]); // switch the relay on modules buffer[2]
              break;
            // {'c','l',type,pwm, dir} - L293D CONTROL
            case 'l':
              if(buffer[2] == 'p') {
                write_l293d(buffer[3], buffer[4]);
              } else if(buffer[2] == 's') {
                stop_l293d();
              }
              break;
            // {'c', 'm', low_achieve, high_achieve} - MOTOR CONTROL
            case 'm':
              motor_achieve = (buffer[2] << 8) | buffer[3];
              break;
            // type (buffer[2] == 'a') -> {'c','s','a',module, low_angle, high_angle} - STEPPER SET ANGLE
            // type (buffer[2] == 'r') -> {'c','s','r',rpm,module} - STEPPER RPM
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

        // STATUS
        case 'S':
          switch(buffer[1]) {
            // {'S','r',module} <--> {'r', status}
            case 'r':
              uint8_t bufr[2];
              bufr[0] = buffer[1];
              bufr[1] = status_relay(buffer[2]);
              myPacketSerial.send(bufr,  sizeof(bufr)/sizeof(bufr)[0]);
              break;
            // {'S','m'} <--> {'m',low_achieve, high_achieve}
            case 'm':
              uint8_t bufm[3];
              bufm[0] = buffer[1];
              bufm[1] = motor_read() >> 8;
              bufm[2] = motor_read() & 0xFF;
              myPacketSerial.send(bufm,  sizeof(bufm)/sizeof(bufm)[0]);
              break;
          }
          break;
    }
}

void setup() {
  // packet serial on main serial port opened at 9600 baud
  myPacketSerial.begin(9600);
  // on receive execute the onPacketReceived function
  myPacketSerial.setPacketHandler(&onPacketReceived);
}

void loop() {
  // if motor regulator (PID) is enabled, execute
  if(enable_motor_regulator) {
    motor_regulate(motor_achieve);
  }

  // update the packet serial
  myPacketSerial.update();

}

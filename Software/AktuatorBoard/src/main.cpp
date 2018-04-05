#include <Arduino.h>
#include <PacketSerial.h>
#include <A4988.h>
#include <SoftwareSerial.h>

#include "modules.h"
#include "motor.h"

// packetserial object
PacketSerial myPacketSerial;
PacketSerial AXPacketSerial;

// enabling motor regulator
uint8_t enable_motor_regulator = 0;
// the encoder number which the motor should achieve
double motor_achieve;

#define AXSSRX         8
#define AXSSTX         3
#define AXSSBAUD       9600


SoftwareSerial AXSS(AXSSRX, AXSSTX);

void onPacketReceivedAX(const uint8_t* buffer, size_t size) {
  uint8_t buff[size];
  for(int i=0; i<size; i++) {
    buff[i] = buffer[i];
  }
  myPacketSerial.send(buff, size);
}

/*
 * Function:    void onPacketReceived(const uint8_t* buffer, size_t size)
 * Description: analyses the buffer
 */
void onPacketReceived(const uint8_t* buffer, size_t size)
{
    if(buffer[0] == 'a') {
      // switching the first byte
      switch(buffer[1]) {
        // SETUP
        case 's':
          switch(buffer[2]) {
            // {'s', 'r', pin} - RELAY SETUP
            case 'r':
              setup_relay(buffer[3]); // setup relay on module buffer[2]
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
              motor_achieve = (buffer[3] << 8) | buffer[4];
              enable_motor_regulator = 1;
              break;
            // {'s','s',rpm, module} - STEPPER SETUP
            case 's':
              setup_stepper(buffer[3], buffer[4]);
              break;
          }
          break;

          // CONTROL
          case 'c':
            switch(buffer[2]) {
              // {'c','r',pin} - RELAY CONTROL
              case 'r':
                switch_relay(buffer[3]); // switch the relay on modules buffer[2]
                break;
              // {'c','l',type,pwm, dir} - L293D CONTROL
              case 'u':
                write_l293d(buffer[3], 0);
                break;
              case 'd':
                write_l293d(buffer[3], 1);
                break;
              case 'S':
                stop_l293d();
                break;
              // {'c', 'm', low_achieve, high_achieve} - MOTOR CONTROL
              case 'm':
                motor_achieve = (buffer[3] << 8) | buffer[4];
                break;
              // type (buffer[2] == 'a') -> {'c','s','a',module, low_angle, high_angle} - STEPPER SET ANGLE
              // type (buffer[2] == 'r') -> {'c','s','r',rpm,module} - STEPPER RPM
              case 's':
                if(buffer[3] == 'a') { // angle
                  uint8_t mod = buffer[4];
                  long angle = (buffer[5] << 8) | buffer[5];

                  write_stepper(angle, mod);
                } else if(buffer[3] == 'r') {//rpm
                  set_rpm_stepper(buffer[4], buffer[5]);
                }
            }
            break;

          // STATUS
          case 'S':
            switch(buffer[2]) {
              // {'S','r',module} <--> {'r', status}
              case 'r':
                uint8_t bufr[2];
                bufr[0] = buffer[2];
                bufr[1] = status_relay(buffer[3]);
                myPacketSerial.send(bufr,  sizeof(bufr)/sizeof(bufr)[0]);
                break;
              // {'S','m'} <--> {'m',low_achieve, high_achieve}
              case 'm':
                uint8_t bufm[3];
                bufm[0] = buffer[2];
                bufm[1] = motor_read() >> 8;
                bufm[2] = motor_read() & 0xFF;
                myPacketSerial.send(bufm,  sizeof(bufm)/sizeof(bufm)[0]);
                break;
            }
            break;
      }
    } else if(buffer[0] == 'x'){
      uint8_t buff[size];
      for(int i=0; i<size; i++) {
        buff[i] = buffer[i];
      }
      AXPacketSerial.send(buff, size);
    }
}
//d8 rx g
//d3 tx b
void setup() {
  // packet serial on main serial port opened at 9600 baud
  myPacketSerial.begin(9600);
  // on receive execute the onPacketReceived function
  myPacketSerial.setPacketHandler(&onPacketReceived);

  AXSS.begin(9600);
  AXPacketSerial.setStream(&AXSS);
  AXPacketSerial.setPacketHandler(&onPacketReceivedAX);

  pinMode(LED_BUILTIN, OUTPUT);

  //analogWrite(11, 150);

/*setup_l293d();
  delay(500);
  write_l293d(150, 1);
  delay(300);
  write_l293d(150, 2);
  delay(300);
  stop_l293d();*/
/*delay(500);
    uint8_t packet[4] = {'x','m', 4, 127};
    AXPacketSerial.send(packet, 4);*/
}

void loop() {
  // if motor regulator (PID) is enabled, execute
  /*if(enable_motor_regulator) {
    motor_regulate(motor_achieve);
  }*/

  // update the packet serial
  myPacketSerial.update();
  AXPacketSerial.update();

}

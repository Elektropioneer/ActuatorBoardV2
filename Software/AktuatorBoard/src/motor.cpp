#include <Arduino.h>
#include <Encoder.h>
#include <PID_v1.h>
#include "motor.h"
#include "modules.h"

#define ENC_A 2
#define ENC_B 4

Encoder myEnc(ENC_A, ENC_B);

double Input, Output;
double Kp=0.5, Ki=0, Kd=0.1;
PID myPID(&Input, &Output, 0, Kp, Ki, Kd, DIRECT);
//1540
void motor_setup() {

  myPID.SetOutputLimits(40, 80);
  //turn the PID on
  myPID.SetMode(AUTOMATIC);
}

void motor_regulate(double Setpoint) {
  Input = myEnc.read();
  if(Input < Setpoint) {
    myPID.SetControllerDirection(DIRECT);
    myPID.Compute();
    write_l293d(Output, 0);
  } else if(Input > Setpoint) {
    myPID.SetControllerDirection(REVERSE);
    myPID.Compute();
    write_l293d(Output, 1);
  } else {
    stop_l293d();
  }
}

long motor_read() {
  return myEnc.read();
}

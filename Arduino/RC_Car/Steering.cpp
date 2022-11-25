#include "Arduino.h"
#include "Steering.h"
#include "Servo.h"

Steering::Steering() {}

// setup servo pin
void Steering::setup(int steeringPin) {
  _steeringPin = steeringPin;
  servo.attach(steeringPin);
}

// if angle is between min and max, steer in that direction
void Steering::steer(int angle) {
  if (angle <= maxVal && angle >= minVal) {
    servo.write(angle);
  }
}

// center wheels
void Steering::center() {
  servo.write(centerVal);
}
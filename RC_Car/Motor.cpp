#include "Arduino.h"
#include "Motor.h"
#include "Accessories.h"

Motor::Motor() {}

// setup direction forward, backwards, and speed control pins
// speed is PWM
void Motor::setup(int forwardPin, int backwardsPin, int speedPin, Accessories accessories) {
  _forwardPin = forwardPin;
  _backwardsPin = backwardsPin;
  _speedPin = speedPin;
  _accessories = accessories;
  pinMode(forwardPin, OUTPUT);
  pinMode(backwardsPin, OUTPUT);
  pinMode(speedPin, OUTPUT);
}

// accelerate in direction forward with given speed
void Motor::accelerate(int speed) {
  _accessories.breakLights(false);
  digitalWrite(_forwardPin, HIGH);
  digitalWrite(_backwardsPin, LOW);
  analogWrite(_speedPin, speed);
}

// accelerate in direction backwards with given speed
void Motor::reverse(int speed) {
  _accessories.breakLights(true);
  digitalWrite(_backwardsPin, HIGH);
  digitalWrite(_forwardPin, LOW);
  analogWrite(_speedPin, speed);
}

// completely stop motor
void Motor::stop() {
  _accessories.breakLights(true);
  analogWrite(_speedPin, 0);
}
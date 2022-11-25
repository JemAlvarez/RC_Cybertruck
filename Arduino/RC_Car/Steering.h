#ifndef Steering_h
#define Steering_h
#include "Arduino.h"
#include "Servo.h"

class Steering {
  public: 
    Steering();
    void setup(int steeringPin);
    void steer(int angle);
    void center();

  private:
    int _steeringPin;
    int minVal = 0;
    int maxVal = 180;
    int centerVal = 90;
    Servo servo;
};

#endif
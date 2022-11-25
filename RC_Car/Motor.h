#ifndef Motor_h
#define Motor_h
#include "Arduino.h"
#include "Accessories.h"

class Motor {
  public: 
    Motor();
    void setup(int forwardPin, int backwardsPin, int speedPin, Accessories accessories);
    void accelerate(int speed);
    void reverse(int speed);
    void stop();

  private:
    int _forwardPin;
    int _backwardsPin;
    int _speedPin;
    Accessories _accessories;
};

#endif
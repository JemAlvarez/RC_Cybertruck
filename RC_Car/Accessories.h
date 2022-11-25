#ifndef Accessories_h
#define Accessories_h
#include "Arduino.h"
#include "SR04.h"

class Accessories {
  public: 
    Accessories();
    void setupFrontLights(int pin);
    void setupBreakLights(int pin);
    void setupRightBlinker(int pin);
    void setupLeftBlinker(int pin);
    void setupHonk(int pin);
    void setupUltraSonicSensor(int echoPin, int trigPin);

    void frontLights(boolean on);
    void frontHighBeams(boolean on);
    void breakLights(boolean on);
    void blinkers(int side);
    void honk(boolean on);
    long getUSDistance();

  private:
    int _frontLightsPin;
    int _breakLightsPin;
    int _leftBlinkerPin;
    int _rightBlinkerPin;
    int _honkPin;
    
    int previousMilis = 0;
    int blinkerInterval = 500;
    int blinkerState = LOW;
    int frontLightsVal = 50;
    int frontHighBeamsVal = 255;
    SR04 ultraSonicSensor = SR04(2, 3);
};

#endif
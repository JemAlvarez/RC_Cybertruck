#include "Arduino.h"
#include "Accessories.h"
#include "SR04.h"

Accessories::Accessories() {}

// ----------- Save each accessories pin number individually -----------------
// setup front light pin, PWM
void Accessories::setupFrontLights(int pin) {
  _frontLightsPin = pin;
}

// setup break lights pin
void Accessories::setupBreakLights(int pin) {
  _breakLightsPin = pin;
}

// setup right blinker pin
void Accessories::setupRightBlinker(int pin) {
  _rightBlinkerPin = pin;
}

// setup left blinker pin
void Accessories::setupLeftBlinker(int pin) {
  _leftBlinkerPin = pin;
}

// setup honk pin
void Accessories::setupHonk(int pin) {
  _honkPin = pin;
  pinMode(_honkPin, pin);
}

// setup ultrasonic pins, echo = PWM
void Accessories::setupUltraSonicSensor(int echoPin, int trigPin) {
  ultraSonicSensor = SR04(echoPin, trigPin);
}

// ------------------------ End of setup -------------------------------


// -------------------- Front lights -------------------------
void Accessories::frontLights(boolean on) {
  if (on) {
    analogWrite(_frontLightsPin, frontLightsVal);
  } else {
    analogWrite(_frontLightsPin, 0);
  }
}

void Accessories::frontHighBeams(boolean on) {
  if (on) {
    analogWrite(_frontLightsPin, frontHighBeamsVal);
  } else {
    analogWrite(_frontLightsPin, frontLightsVal);
  }
}

// -------------------- Break lights -------------------------
void Accessories::breakLights(boolean on) {
  if (on) {
    analogWrite(_breakLightsPin, 255);
  } else {
    analogWrite(_breakLightsPin, 0);
  }
}

// -------------------- Blinker lights -------------------------
void Accessories::blinkers(int side) {
  int currentMilis = millis();

  if (side == 0) {
    analogWrite(_leftBlinkerPin, 0);
    analogWrite(_rightBlinkerPin, 0);
  } else {
    if (currentMilis - previousMilis >= blinkerInterval) {
      previousMilis = currentMilis;

      if (blinkerState == 0) {
        blinkerState = 255;
      } else {
        blinkerState = 0;
      }

      if (side == -1) {
        analogWrite(_rightBlinkerPin, 0);
        analogWrite(_leftBlinkerPin, blinkerState);
      } else if (side == 1) {
        analogWrite(_leftBlinkerPin, 0);
        analogWrite(_rightBlinkerPin, blinkerState);
      } else if (side == 2) {
        analogWrite(_leftBlinkerPin, blinkerState);
        analogWrite(_rightBlinkerPin, blinkerState);
      }
    }
  }
}

// -------------------- Honk -------------------------
void Accessories::honk(boolean on) {
  if (on) {
    digitalWrite(_honkPin, HIGH);
  } else {
    digitalWrite(_honkPin, LOW);
  }
}

// -------------------- Ultrasonic Sensor -------------------------
long Accessories::getUSDistance() {
  return ultraSonicSensor.Distance();
}
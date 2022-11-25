#include "Motor.h"
#include "Steering.h"
#include "Accessories.h"
#include "SR04.h"

Motor motor;
Steering steering;
Accessories accessories;

void setup() {
  // accessories.setupBreakLights(12);
  // accessories.setupFrontLights(5);
  // accessories.setupLeftBlinker(8);
  // accessories.setupRightBlinker(7);
  // accessories.setupHonk(12);
  // accessories.setupUltraSonicSensor(11, 12);
  // motor.setup(2,4,3, accessories);
  // steering.setup(9);
  Serial.begin(9600);
  Serial.setTimeout(100);
}

// long dist;
// int prevMilis = 0;

void loop() {
  // char inData[20];
  // char inChar = -1;
  // byte index = 0;
    
  // while(Serial.available() > 0) {
  //   if (index < 19) {
  //     inChar = Serial.read(); // Read a character
  //     inData[index] = inChar; // Store it
  //     index++; // Increment where to write next
  //     inData[index] = '\0'; // Null terminate the string
  //   }
  // }
      
  // String a = "";
  // for (int i = 0; i < sizeof(inData) / sizeof(int); i++) {
  //   a.concat(inData[i]);
  // }

  // if (Serial.available() > 0) {
  //   Serial.println(Serial.readString());
  // }

  // int currentMilis = millis();

  // if (currentMilis - prevMilis >= 2000) {
  //   prevMilis = currentMilis;
  //   Serial.write("Arduino\n");
  // }

  // Serial.println((String)"Distance: " + accessories.getUSDistance() + "cm");
  // delay(1000);

  // accessories.honk(true);
  // delay(1000);
  // accessories.honk(false);
  // delay(4000);
  // accessories.honk(true);
  // delay(3000);
  // accessories.honk(false);
  // delay(1000);

  // accessories.blinkers(2);

  // accessories.frontLights(true);
  // delay(2000);
  // accessories.frontLights(false);
  // delay(2000);
  // accessories.frontLights(true);
  // delay(2000);
  // accessories.frontHighBeams(true);
  // delay(2000);
  // accessories.frontHighBeams(false);
  // delay(2000);
  // accessories.frontHighBeams(false);
  // delay(2000);
  // accessories.frontLights(false);
  // delay(2000);
  // accessories.frontHighBeams(true);
  // delay(2000);
  // accessories.frontHighBeams(false);
  // delay(2000);
  // accessories.frontLights(false);

  // motor.accelerate(50);
  // delay(5000);
  // motor.stop();
  // delay(1000);
  // motor.reverse(50);
  // delay(5000);

  // for (int i = 0; i < 10; i++) {
  //   steering.steer(random(180));
  //   delay(500);
  // }

  // steering.center();
  // delay(5000);
}

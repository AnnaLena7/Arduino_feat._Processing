//gyro
#include <Adafruit_LSM9DS1.h>
#include <Adafruit_Sensor.h>

Adafruit_LSM9DS1 lsm = Adafruit_LSM9DS1();

#define LSM9DS1_SCK A5
#define LSM9DS1_MOSI A4
/*
 * #define LSM9DS1_SCK A5
   #define LSM9DS1_MISO 12
   #define LSM9DS1_MOSI A4
   #define LSM9DS1_XGCS 6
   #define LSM9DS1_MCS 5
    You can also use software SPI
   Adafruit_LSM9DS1 lsm = Adafruit_LSM9DS1(LSM9DS1_SCK, LSM9DS1_MISO, LSM9DS1_MOSI, LSM9DS1_XGCS, LSM9DS1_MCS);
    Or hardware SPI! In this case, only CS pins are passed in
   Adafruit_LSM9DS1 lsm = Adafruit_LSM9DS1(LSM9DS1_XGCS, LSM9DS1_MCS);
*/

//flex
int flexPin = A0;

//stuff
int ledRed = 9;
int ledGreen = 10;
int ledBlue = 11;
String hit;

void setupSensor() {
  //Set the accelerometer range
  lsm.setupAccel(lsm.LSM9DS1_ACCELRANGE_2G);
  //Setup the gyroscope
  lsm.setupGyro(lsm.LSM9DS1_GYROSCALE_245DPS);
  //lsm.setupGyro(lsm.LSM9DS1_GYROSCALE_500DPS);
  //lsm.setupGyro(lsm.LSM9DS1_GYROSCALE_2000DPS);
}

void setup() {
  Serial.begin(9600);
  if(!lsm.begin()) {
    Serial.println("Oops, da ist was schief gelaufen, überprüfe deine Kabel");
    while(1); //endlosloop
  }
  Serial.println("LSM9DS1 9DOF gefunden");
  setupSensor();

  pinMode(ledRed,OUTPUT);
  pinMode(ledGreen,OUTPUT);
  pinMode(ledBlue,OUTPUT);
}

void loop() {
  //GyroSensor
  lsm.read();
  sensors_event_t a, m, g, temp; //Variable für gyro g
  lsm.getEvent(&a, &m, &g, &temp);
  /*Serial.print("Gyro X: "); Serial.print(g.gyro.x);   Serial.print(" dps");
  Serial.print("\tY: "); Serial.print(g.gyro.y);      Serial.print(" dps");
  Serial.print("\tZ: "); Serial.print(g.gyro.z);      Serial.println(" dps");
  */
  //FlexSensor
  int flexValue = analogRead(flexPin);
  
  //Verarbeiten...
  /*Serial.print(g.gyro.x, 4);
  Serial.print(",");
  Serial.print(g.gyro.y, 4);
  Serial.print(",");
  Serial.print(g.gyro.z, 4);*/
  Serial.print(a.acceleration.x, 4);
  Serial.print(",");
  Serial.print(a.acceleration.y, 4);
  Serial.print(",");
  Serial.print(a.acceleration.z, 4);
  Serial.print(",");
  Serial.println(flexValue);

  if(Serial.available()) {
    hit = Serial.read();
    if(hit.equals("geschossen")) {
      analogWrite(ledBlue, 255); //blue
    }
    if(hit.equals("hit")) {
      analogWrite(ledGreen, 255); //green
    } else if(hit.equals("shot")) {
      analogWrite(ledRed, 255); //red
    }
  }
  
  delay(500);
}

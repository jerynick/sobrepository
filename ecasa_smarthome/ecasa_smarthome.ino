#include <Wire.h>
#include <WiFi.h>
#include <IOXhop_FirebaseESP32.h>
#include "DHT.h"
#include <ESP32Servo.h>
//#include <MQUnifiedsensor.h>
#include <LiquidCrystal_I2C.h>

// MQ-135
//#define BOARD ("ESP-32")
//#define MQ135_PIN (34)
//#define TYPE ("MQ-135")
//#define VOLTAGE_Resolution (3.3)
//#define ADC_Bit_Resolution (12)
//#define RatioMQ135CleanAir (3.6)
//MQUnifiedsensor MQ135(BOARD, VOLTAGE_Resolution, ADC_Bit_Resolution, MQ135_PIN, TYPE);

unsigned long previousMillis = 0;
const long interval = 500 ; 

//DHT11 
#define DHTPIN 5
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

//MQ135 Pin
#define MQ135_PIN 34

//LED Pin
#define Relay1_PIN 25
#define Relay2_PIN 26
#define Relay3_PIN 27

//Fan Pin
#define Relay4_PIN 16

//HC SR04
#define SoundSpeed 0.034
const int trigPin = 18;
const int echoPin = 19;
long duration;
float distance;

//Magnetic Door Sensor
#define DOORPIN 19
int gateState;

//Servo
Servo gateServo;

//LCD-i2C
int lcdColumns = 16;
int lcdRows = 2;
LiquidCrystal_I2C lcd(0x27, lcdColumns, lcdRows);

//Database
#define FIREBASE_HOST "https://ecasa-db-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "rBp12ILV0gF4DGEp3DTQmydQVukDwYtWB6vyU3yL"
#define WIFI_SSID "Violet Corner"
#define WIFI_PASSWORD "katakanpeta"

//LED Database
#define LED1_DB "/Led_1"
#define LED2_DB "/Led_2"
#define LED3_DB "/Led_3"

//Fan Database
#define Fan_DB "/Fan"

//Servo Database
#define SERVO_DB "/Gate" 

//I2C Database
#define Line1_DB "/LCD/Line_1"
#define Line2_DB "/LCD/Line_2"

//const int MQ135_PIN = 34;
float VREF = 3.3;

void setup() {

  Serial.begin(115200);
  Serial.println("DHT11 test!");
  dht.begin();
  gateServo.attach(17);
  lcd.init();
  lcd.backlight();

  //MQ135.setRegressionMethod(1); 
  //MQ135.setA(110.47); MQ135.setB(-2.862);

  //MQ135.init();

  //Serial.print("Calibrating please wait.");
  //float calcR0 = 0;
  //for(int i = 1; i<=10; i ++)

  {
    //MQ135.update();
    //calcR0 += MQ135.calibrate(RatioMQ135CleanAir);
    //Serial.print(".");
  }
  //MQ135.setR0(calcR0/10);
  //Serial.println("  done!.");

  //if(isinf(calcR0)) {Serial.println("Warning: Conection issue, R0 is infinite (Open circuit detected) please check your wiring and supply"); while(1);}
  //if(calcR0 == 0){Serial.println("Warning: Conection issue found, R0 is zero (Analog pin shorts to ground) please check your wiring and supply"); while(1);}

  // Connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  pinMode(Relay1_PIN, OUTPUT);
  pinMode(Relay2_PIN, OUTPUT);
  pinMode(Relay3_PIN, OUTPUT);
  pinMode(Relay4_PIN, OUTPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  pinMode(DOORPIN, INPUT_PULLUP);
}

void loop() {
  unsigned long currentMillis = millis();

  //Read sensor data
  readDHT11();

  //Read MQ135 data
  //readMQ135();

  // Read Gate Status
  Gate_Detect();

  //Read MQ135 without MQUnifiedsensor
  tryMQ135();

  // Control lamp based on Firebase value
  controlLED1();
  controlLED2();
  controlLED3();

  //Fan control
  controlFan();

  // Automatic Gate
  autoGate();

  // Control gate based on Firebase value
  firebaseGate();

  // Write Text in LCD
  LCD_i2C();

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
  }

}

void readDHT11() {
    delay(500);
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  
  if (isnan(h) || isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }
  
  // Display sensor data on Serial Monitor
  Serial.print("Humidity: ");
  Serial.print(h);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print(t);
  Serial.println(" *C ");
  
  // Set value to Firebase
  Firebase.setFloat("Suhu", t);
  if (Firebase.failed()) {
    Serial.print("setting /Suhu failed:");
    Serial.println(Firebase.error());  
    return;
  }
  delay(500);
  
  Firebase.setFloat("Kelembaban", h);
  if (Firebase.failed()) {
    Serial.print("setting /Kelembaban failed:");
    Serial.println(Firebase.error());  
    return;
  }
  
  Serial.println("Data Suhu dan Kelembaban Sukses Terkirim");
  delay(500);
}

//void readMQ135() {
  //float air = MQ135.readSensor();

  //MQ135.update();
  //Serial.print(air);
  //Serial.println(" PPM");

  //Firebase.setFloat("Udara", air);
  //if (Firebase.failed()) {
    //Serial.print("setting /Udara failed:");
    //Serial.println(Firebase.error());  
    //return;
  //}

  //delay(500);
//}

void Gate_Detect() {
  gateState = digitalRead(DOORPIN);

  if (gateState == HIGH) {
    Serial.println("Gerbang terbuka");
    Firebase.setString("GateStatus", "OPEN");
  } else if (gateState == LOW) {
    Serial.println("Gerbang tertutup");
    Firebase.setString("GateStatus", "CLOSE");
  } else {
    Serial.println("Invalid gate state");
    // You may want to set a default value or handle this case accordingly
  }

  if (Firebase.failed()) {
    Serial.print("Setting /GateStatus failed: ");
    Serial.println(Firebase.error());
    // Handle the Firebase failure here
    return;
  }

  delay(500);
}

void tryMQ135() {

  int sensorValue = analogRead(MQ135_PIN);
  float voltage = sensorValue * (VREF / 4095);
  float airRatio = voltage / VREF;
  float ppm = pow(10, ((log10(airRatio) - (-0.8)) / -0.34)); 

  Serial.print("Air Quality : ");
  Serial.print(ppm);

  Firebase.setFloat("Udara", ppm);
  if (Firebase.failed()) {
    Serial.print("setting /Udara failed:");
    Serial.println(Firebase.error());  
    return;
  }

  delay(100);

}

void controlLED1() {
  // Read lamp status from Firebase
  String led1Status = Firebase.getString(LED1_DB);

  if (Firebase.failed()) {
    Serial.print("Reading led 1 status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  // Control lamp based on the status from Firebase
  if (led1Status == "ON") {
    Serial.println("Turning ON the lamp");
    digitalWrite(Relay1_PIN, LOW);
  } else if (led1Status == "OFF") {
    Serial.println("Turning OFF the lamp");
    digitalWrite(Relay1_PIN, HIGH);
  } else {
    Serial.println("Invalid led 1 status from Firebase");
  }

  delay(500);
}

void controlLED2() {
  // Read lamp status from Firebase
  String led2Status = Firebase.getString(LED2_DB);

  if (Firebase.failed()) {
    Serial.print("Reading led 2 status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  // Control lamp based on the status from Firebase
  if (led2Status == "ON") {
    Serial.println("Turning ON the lamp");
    digitalWrite(Relay2_PIN, LOW);
  } else if (led2Status == "OFF") {
    Serial.println("Turning OFF the lamp");
    digitalWrite(Relay2_PIN, HIGH);
  } else {
    Serial.println("Invalid led 2 status from Firebase");
  }

  delay(500);
}

void controlLED3() {
  // Read lamp status from Firebase
  String led3Status = Firebase.getString(LED3_DB);

  if (Firebase.failed()) {
    Serial.print("Reading led 3 status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  // Control lamp based on the status from Firebase
  if (led3Status == "ON") {
    Serial.println("Turning ON the lamp");
    digitalWrite(Relay3_PIN, LOW);
  } else if (led3Status == "OFF") {
    Serial.println("Turning OFF the lamp");
    digitalWrite(Relay3_PIN, HIGH);
  } else {
    Serial.println("Invalid led 3 status from Firebase");
  }

  delay(500);
}

void controlFan() {
  // Read lamp status from Firebase
  String fanStatus = Firebase.getString(Fan_DB);

  if (Firebase.failed()) {
    Serial.print("Reading fan 3 status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  // Control lamp based on the status from Firebase
  if (fanStatus == "ON") {
    Serial.println("Turning ON the Fan");
    digitalWrite(Relay4_PIN, LOW);
  } else if (fanStatus == "OFF") {
    Serial.println("Turning OFF the Fan");
    digitalWrite(Relay4_PIN, HIGH);
  } else {
    Serial.println("Invalid fan status from Firebase");
  }

  delay(500);
}

void autoGate(){
  unsigned long currentMillis = millis();

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);
  distance = duration * SoundSpeed/2;

  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

  if (distance <= 5) {
    gateServo.write(90);
    delay(500);
  } else {
    gateServo.write(0);
    delay(500);
  }

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
  }
}

void firebaseGate() {
  unsigned long currentMillis = millis();

  // Read gate status from Firebase
  String gateStatus = Firebase.getString(SERVO_DB);

  if (Firebase.failed()) {
    Serial.print("Reading gate status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

    if (gateStatus == "OPEN") {
    Serial.println("OPEN GATE");
    gateServo.write(90);
  } else if (gateStatus == "CLOSE") {
    Serial.println("CLOSE GATE");
    gateServo.write(0);
  } else {
    Serial.println("Invalid gate status from Firebase");
  }

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
  }

}

void LCD_i2C () {
  String Line1 = Firebase.getString(Line1_DB);
  String Line2 = Firebase.getString(Line2_DB);

  if (Firebase.failed()) {
    Serial.print("Reading gate status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(Line1);
  
  lcd.setCursor(0, 1);
  lcd.print(Line2);

}
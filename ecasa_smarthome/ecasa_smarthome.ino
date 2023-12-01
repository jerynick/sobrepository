#include <Wire.h>
#include <WiFi.h>
#include <IOXhop_FirebaseESP32.h>
#include "DHT.h"
#include <ESP32Servo.h>
#include <LiquidCrystal_I2C.h>
#include <MQ135.h>

unsigned long previousMillis = 0;
const long interval = 500 ; 

//DHT11 
#define DHTPIN 5
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

//MQ135 
#define MQ135_PIN 36
MQ135 mq135(MQ135_PIN);

//Raindrop
#define Rain_PIN 35

//Brightness PIN
#define Bright_PIN 23

//LED Pin
#define Relay1_PIN 25
#define Relay2_PIN 26
#define Relay3_PIN 27

//Fan Pin
#define Relay4_PIN 14

//HC SR04
#define SoundSpeed 0.034
const int trigPin = 18;
const int echoPin = 19;
long duration;
float distance;

//Magnetic Door Sensor
#define DOORPIN 15
int gateState;

//Servo
Servo gateServo;
Servo canopiServo;

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

//Rain Database
#define Rain_DB "RainStatus"

//LDR Database
#define Bright_DB "Brightness"

//Fan Database
#define Fan_DB "/Fan"

//Servo Database
#define SERVO_DB "/Gate"
#define SERVO2_DB "/Canopi" 

//I2C Database
#define Line1_DB "/LCD/Line_1"
#define Line2_DB "/LCD/Line_2"
#define airQLCD_DB "/LCD/mq135"
#define dhtLCD_DB "/LCD/DHT11"
#define rainLCD_DB "/LCD/Rain"

//Automatic mode DB
#define Auto_DB "/Automatic"

void setup() {

  Serial.begin(115200);
  Serial.println("DHT11 test!");
  dht.begin();
  gateServo.attach(17);
  canopiServo.attach(16);
  lcd.init();
  lcd.backlight();

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
  pinMode(Bright_PIN, INPUT);
}

void loop() {
  unsigned long currentMillis = millis();

  // Read Gate Status
  Gate_Detect();
  
  //Read MQ135 Status
  MQ135Sensor();

  //Read Raindrops Sensor
  rainSensor();

  //Read brightness sensor
  brightSensor();

  //Read sensor data
  readDHT11();

  // Control gate based on Firebase value
  firebaseGate();

  // Write Text in LCD
  LCD_i2C();

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
  }

}


void Gate_Detect() {
  gateState = digitalRead(DOORPIN);

  if (gateState == HIGH) {
    Firebase.setString("GateStatus", "OPEN");
  } else if (gateState == LOW) {
    Serial.println("Gerbang tertutup");
  } else {
    Serial.println("Invalid gate state");
  }

  if (Firebase.failed()) {
    Serial.print("Setting /GateStatus failed: ");
    Serial.println(Firebase.error());
    return;
  }
}


void MQ135Sensor() {
  float ppm = mq135.getPPM();
  Serial.println(ppm);
  Firebase.setFloat("Udara", ppm);
  if (Firebase.failed()) {
    Serial.print("setting /Udara failed:");
    Serial.println(Firebase.error());  
    return;
  }

  String airQLCD = Firebase.getString(airQLCD_DB);

  if (airQLCD == "YES") {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Air Quality: ");

    lcd.setCursor(0, 1);
    lcd.print(ppm);
    lcd.print("      PPM");
    lcd.clear();
  } else {
    Serial.println ("Air Quality not displayed");
  }

}

void rainSensor() {
  int rainvalue = analogRead(Rain_PIN);

  Serial.println(rainvalue);
  
  if (rainvalue > 4000) {
    Firebase.setString("RainStatus", "Sunny");
  } 
  else if (rainvalue < 4000) {
    Firebase.setString("RainStatus", "Rainy");
  }
  else {
    Serial.println("Invalid Rain Status");
  }

  if (Firebase.failed()) {
    Serial.print("Reading gate status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }
  //Automatic Mode
  String Automatic = Firebase.getString(Auto_DB);
  String RainStatus = Firebase.getString(Rain_DB);
  Serial.print("Automatic mode: ");
  Serial.println(Automatic);

  if (Automatic == "AUTO") {
    if (RainStatus == "Rainy") {
      canopiServo.write(180);
    } else if (RainStatus == "Sunny") {
      canopiServo.write(0);
    } else {
      Serial.println("Invalid condition of AutoCanopi");
    }
  } 
  else if (Automatic == "MANUAL") {
    Serial.println("Manual mode: Running controlCanopi");
    controlCanopi ();
  }
  else {
    Serial.println("Error: Cant move to Automatic mode");
  }

  String rainLCD = Firebase.getString(rainLCD_DB);

  if (rainLCD == "YES") {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Rain Status: ");

    lcd.setCursor(0, 1);
    lcd.print(RainStatus);

  } else {
    Serial.println("Rain Status isn't displayed");
  }
}

void brightSensor() {
  int brightnessStatus = digitalRead(Bright_PIN);

  if (brightnessStatus == HIGH) {
    Firebase.setString("Brightness", "DARK");
    Serial.println("Gelap");
  } else {
    Firebase.setString("Brightness", "BRIGHT");
     Serial.println("Terang");
  }

  if (Firebase.failed()) {
    Serial.print("Reading brightness status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  String Automatic = Firebase.getString(Auto_DB);
  String brightness = Firebase.getString(Bright_DB);

  if (Automatic == "AUTO") {
    if (brightness == "DARK") {
      Firebase.setString("Led_1", "ON");
      controlLED1();
      Firebase.setString("Led_2", "ON");
      controlLED2();
      Firebase.setString("Led_3", "ON");
      controlLED3();
    } else if (brightness == "BRIGHT") {
      Firebase.setString("Led_1", "OFF");
      controlLED1();
      Firebase.setString("Led_2", "OFF");
      controlLED2();
      Firebase.setString("Led_3", "OFF");
      controlLED3();
    } else {
      Serial.println("Invalid Condition of Auto LED");
    }
  }

  else if (Automatic == "MANUAL") {
    Serial.println("Manual mode : Running LED Manual");
    controlLED1();
    controlLED2();
    controlLED3();
  }
  else {
    Serial.println("Error: cant running Automatic mode");
  }
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
    digitalWrite(Relay1_PIN, LOW);
  } else if (led1Status == "OFF") {
    digitalWrite(Relay1_PIN, HIGH);
  } else {
    Serial.println("Invalid led 1 status from Firebase");
  }
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
    digitalWrite(Relay2_PIN, LOW);
  } else if (led2Status == "OFF") {
    digitalWrite(Relay2_PIN, HIGH);
  } else {
    Serial.println("Invalid led 2 status from Firebase");
  }
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
    digitalWrite(Relay3_PIN, LOW);
  } else if (led3Status == "OFF") {
    digitalWrite(Relay3_PIN, HIGH);
  } else {
    Serial.println("Invalid led 3 status from Firebase");
  }
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
    digitalWrite(Relay4_PIN, LOW);
  } else if (fanStatus == "OFF") {
    digitalWrite(Relay4_PIN, HIGH);
  } else {
    Serial.println("Invalid fan status from Firebase");
  }
}

void readDHT11() {
  float h = dht.readHumidity();
  float t = dht.readTemperature();

  if (isnan(h) || isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }
  
  // Set value to Firebase
  Firebase.setFloat("Suhu", t);
  Firebase.setFloat("Kelembaban", h);
  if (Firebase.failed()) {
    Serial.print("Reading DHT11 status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

  Serial.println("Data Suhu dan Kelembaban Sukses Terkirim");

  String Automatic = Firebase.getString(Auto_DB);
  Serial.print("Automatic mode: ");
  Serial.println(Automatic);

  if (Automatic == "AUTO") {
    float limitTemp = 30.5;

    if (t >= limitTemp) {
      Firebase.setString("Fan", "ON");
      controlFan();
    } else if (t <= limitTemp) {
      Firebase.setString("Fan", "OFF");
      controlFan();
    } else {
      Serial.println("Invalid condition of Auto Fan");
    }
  } else if (Automatic == "MANUAL") {
    Serial.println("Manual mode: Running controlFan");
    controlFan();
  } else {
    Serial.println("Error: Cannot move to Automatic mode");
  }

  String dht11LCD = Firebase.getString(dhtLCD_DB);

  if (dht11LCD == "YES") {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp: ");
    lcd.print(t);
    lcd.print(" °C");

    lcd.setCursor(0, 1);
    lcd.print("Hum: ");
    lcd.print(h);
    lcd.print(" %");
    lcd.clear();
  } else {
    Serial.println("DHT11 Sensor isn't displayed");
  }
}

void firebaseGate() {
  
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
  // Read gate status from Firebase
  String gateStatus = Firebase.getString(SERVO_DB);

  if (Firebase.failed()) {
    Serial.print("Reading gate status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }

    if (gateStatus == "OPEN") {
    gateServo.write(120);
  } else if (gateStatus == "CLOSE") {
    gateServo.write(50);
  } else {
    Serial.println("Invalid gate status from Firebase");
  }

  if (distance <= 5) {
    delay(3000);
    gateServo.write(0);
  }

}

void controlCanopi () {
  String canopiStatus = Firebase.getString(SERVO2_DB);
  String rainStatus = Firebase.getString(Rain_DB);

  if (Firebase.failed()) {
    Serial.print("Reading gate status from Firebase failed:");
    Serial.println(Firebase.error());
    return;
  }
  
  if (canopiStatus == "UP") {
    canopiServo.write(0);
  }
  else if (canopiStatus == "DOWN") {
    canopiServo.write(180);
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
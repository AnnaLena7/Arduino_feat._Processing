int ledPin = 3;
int flexPin = A0; //immer in analogen input

void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int flexValue = analogRead(flexPin);
  Serial.print(flexValue);
  int startwert = 730;
  int endwert = 900;
  int mappedValue = map(flexValue, startwert, endwert, 0, 255);
  if(mappedValue < 0)
    mappedValue = 0;
  if(mappedValue > 255)
    mappedValue = 255;
  Serial.print(" ");
  Serial.print(mappedValue);
  analogWrite(ledPin, mappedValue); //dimmung initialisieren
  delay(1000);
}

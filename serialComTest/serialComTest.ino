int r;  // rot
int g;  // gruen
int b;  // blau

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  r = random(0, 255); // zufallsrotwert
  g = random(0, 255); // zufallsgruenwert
  b = random(0, 255); // zufallsblauwert
  Serial.print(r);    // rgb als "r,g,b\n" auf com ausgeben
  Serial.print(",");
  Serial.print(g);
  Serial.print(",");
  Serial.println(b);
  delay(500);
}

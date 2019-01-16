import processing.serial.*;

float r = 0;  // rot
float g = 0;  // gruen
float b = 0;  // blau

Serial p;    // objekt serieller port

void setup()
{
  size(200, 200);
  println(Serial.list());
  // serieller port ist erster com-port
  // ggfs. aendern oder auswahlmenue ...
  p = new Serial(this, Serial.list()[0], 9600);
  // seriellen eingabepuffer leeren
  p.bufferUntil('\n');
}

void draw()
{
  // hintergrund mit r, g und b faerben
  background(r, g, b);
}

// event von port p abfangen und behandeln
// funktion muss serialEvent heissen!!!
void serialEvent(Serial p)
{
  // string vom port lesen
  String s = p.readStringUntil('\n');
  if(s != null) {
    // string zur kontrolle ausgeben
    println(s);
  // whitespaces entfernen
    s = trim(s);
  // string in r, g und b splitten
    float c[] = float(split(s, ","));
  // r, g und b setzen
    if(c.length >= 3) {
      r = c[0];
      g = c[1];
      b = c[2];
    }
  }
}

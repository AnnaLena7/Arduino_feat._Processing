import processing.serial.*;

float x = 0;  // x-Gyro
float y = 0;  // y-Gyro
float z = 0;  // z-Gyro
float flex = 0;
//hilfsvariablen
int zaehler = 1; //bis vier bewertbar ;), weil vier values vorhanden
String zwerg = "";

Serial p;    // objekt serieller port

PImage ship;
Starship starship;
Schuss shoot;

void setup()
{
  size(1280, 720);
  
  println(Serial.list());
  // serieller port ist erster com-port
  // ggfs. aendern oder auswahlmenue ...
  p = new Serial(this, Serial.list()[0], 9600);
  // seriellen eingabepuffer leeren
  p.bufferUntil('\n');
  
  ship = loadImage("spaceship_1.jpg");
  starship = new Starship(ship, -z, -y);
}

void draw()
{
  background(127);
  starship.calculatePosition(-z, -y);
  starship.draw();
  //ausgabe printen
  text("x: " + x + ", y: " + y + ", z: " + z + ", Flex: " + flex, 100, 100);
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
    // x, y, z und flex setzen
    if(c.length >= 4) {
      x = c[0];
      y = c[1];
      z = c[2];
      flex = c[3];
    }
  }
}

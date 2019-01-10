import processing.serial.*;

Serial myPort;
String portStream; //erhält die daten, die über serielle schnittstelle laufen
    //erst gyro, dann flex

float gyroxValue;
float gyroyValue;
float gyrozValue;
int flexValue;
//hilfsvariablen
int zaehler = 1; //bis vier bewertbar ;), weil vier values vorhanden
String zwerg = "";

void setup() {
  size(1280, 720);
  background(255);
  
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil('\n');
}

void draw() {
  if(portStream != null) {
    //portstream trennen, wenn leerzeichen
    for (int i = 0; i < portStream.length(); i++) {
      //wenn noch aktuelles value abgelesen wird, an zwerg anhängen
      if (portStream.charAt(i) != ' ') {
        zwerg += portStream.charAt(i);
      } else { //sonst
        //variablen werte geben
        if (zaehler == 1)
          gyroxValue = float(zwerg);
        else if (zaehler == 2)
          gyroyValue = float(zwerg);
        else if (zaehler == 3)
          gyrozValue = float(zwerg);
        else if (zaehler == 4)
          flexValue = parseInt(zwerg);
        /*else
          //wenn alle variablen abgefrühstückt, raus aus der schleife
          break;*/
        //den zaehler erhöhen
        zaehler++;
        //zwerg clearen
        zwerg = "";
        //und weiter zum nächsten value
      }
    }
    //verarbeiten...
    print("Gyro X: " + gyroxValue + " Gyro Y: " + gyroyValue + "Gyro Z: " + gyrozValue + " Flex: " + flexValue + "\n");
  }
  else
    print ("not found :(");
}

void serialEvent(Serial myPort) {
  portStream = myPort.readString();
}

class Starship{
  float accX, accY;
  float positionX = width/2;
  float positionY = height/2;
  //float lastAccX, lastAccY = 0.0;
  PImage img;
  int t0 = millis();
  
  public Starship(PImage img, float x, float y) {
    this.accX = x;
    this.accY = y;
    this.img = img;
  }
  
  private void calculatePosition(float x, float y) { 
    /*
    //https://stackoverflow.com/questions/17572769/calculating-distances-using-accelerometer
    int t1 = millis();
    //geschwindigkeit zu t1
    float vx1 = x + accX * (t1 - t0);
    float vy1 = y + accY * (t1 - t0);
    //durchschnittliche geschwindigkeit zwischen t0 und t1
    x = (x + vx1) / 2;
    y = (y + vy1) / 2;
    //neue position
    this.positionX = map(this.positionX + x * (t1 - t0), -20, 20, 20, width -20);
    this.positionY = map(this.positionY + y * (t1 - t0), -20, 20, 20, height -20);
    
    //alte sachen neu machen
    t0 = millis();
    //lastAccX = vx1;
    //lastAccY = vy1;
    */
    this.positionX = map(this.positionX + accX, -20, 20, 20, width-20);
    this.positionY = map(this.positionY + accY, -20, 20, 20, height-20);
  }
  
  public void draw() {
    //image(img, mouseX, mouseY, width/4, height/4);
    image(this.img, this.positionX, this.positionY, width/7, width/7);
    imageMode(CENTER);
  }
}

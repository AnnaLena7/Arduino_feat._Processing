class Starship{
  float x, y;
  PImage img;
  
  public Starship(PImage img, float x, float y) {
    if(x < 2)
      x = 0;
    this.x = x;
    this.y = y;
    this.img = img;
  }
  
  public void draw(float x, float y) {
    if(x < 2 && x > -2)
      x = 0;
    this.x += x*0.5;
    x = map(x, -20, 20, 20, width);
    this.y = y;
    //image(img, mouseX, mouseY, width/4, height/4);
    image(this.img, this.x, y, width/7, height/7);
    imageMode(CENTER);
  }
  
  public float position() {
    return this.x;
  }
}

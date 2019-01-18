class Starship{
  float x, y;
  PImage img;
  
  public Starship(PImage img, float x, float y) {
    this.x = x;
    this.y = y;
    this.img = img;
  }
  
  public void draw(float x, float y) {
    this.x += x;
    this.y += y;
    //image(img, mouseX, mouseY, width/4, height/4);
    image(this.img, this.x + width/2, y, width/7, height/7);
    imageMode(CENTER);
  }
  
  public float position() {
    return this.x;
  }
}

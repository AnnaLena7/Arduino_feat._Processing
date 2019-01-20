class Schuss {
  float x, y;
  float v = 0.5;
  float w, h;
  
  public Schuss(float x, float y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void draw() {
    rect(x, y, w, h);
    fill(#FFA227);
    x += v;
  }
}

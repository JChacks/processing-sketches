class Ghost {
  color c;
  float x;
  float y;
  Ghost(color c, float x, float y) {
    this.c = c;
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    fill(c);
    ellipse((x*size)+size/2, (y*size)+size/2, 2*size, 3*size/2);
  }
}
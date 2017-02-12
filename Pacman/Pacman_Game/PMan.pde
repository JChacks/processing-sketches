class PMan extends Entity { //<>// //<>// //<>//

  float v = 4.2/60;

  PMan() {
    this.x = 14;
    this.y = 23.5;
    currentDir = new PVector(-1, 0);
  }

  void draw() {
    fill(255, 255, 0);
    ellipse((x*size), (y*size), size, size);
  }
}
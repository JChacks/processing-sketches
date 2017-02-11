class Food {
  boolean isSmall = true;
  Food(boolean isSmall) {
    this.isSmall = isSmall;
  }
  void drawAt(int x,int y) {
    stroke(0, 153, 255);
    ellipse(x, y, size, size);
  }
}
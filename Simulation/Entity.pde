class Entity {
  Boolean stayOnScreen = true;

  float   r = 0;
  color   c;

  PVector pos = null;
  PVector vel =  PVector.random2D().mult(2);


  void move() {
    PVector acc = PVector.random2D();
    this.vel = this.vel.add(acc);
    if ( stayOnScreen && (this.pos.x < 0 || this.pos.y < 0 || this.pos.y > height || this.pos.x > width) ) {
      this.vel.x = -this.vel.x;
      this.vel.y = -this.vel.y;
    }
    this.pos.add(vel);
  };

  void show() {
    noStroke();
    fill(this.c);
    ellipse(this.pos.x, this.pos.y, this.r, this.r);
  };
}
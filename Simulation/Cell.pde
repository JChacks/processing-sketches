class Cell extends Entity {
  float energy = 30;
  float energyUsed = 0.1;
  float energyGain = 0.5;

  float lastUpdate = 0;

  float mitosisCost = 5;

  Cell(PVector pos, color c) {
    this.pos = pos.copy();
    this.r = radius();
    this.c = c;
    this.energy = mitosisCost;
  }

  Cell() {
    this.pos  = new PVector(width/2, height/2);//new PVector(random(width), random(height));
    this.r = 30;
    this.c =  color(random(100, 255), 0, random(100, 255), 100);
  }

  void update(ArrayList<Cell> cells) {
    if (this.energy <=0) {
      cells.remove(this);
    }
    this.mitosis(cells);
    this.energy(cells);
    this.move();
    this.show();
  }

  void mitosis(ArrayList<Cell> cells) {
    boolean mitosis = log(this.energy/mitosisCost) - random(1) > 0;
    if (mitosis) {
      this.energy -= mitosisCost;
      PVector disp = new PVector(random(this.r*2), random(this.r*2));
      Cell cell = new Cell(this.pos.add(disp), this.c+(int)random(-20, 20));
      cells.add(cell);
    }
  }

  // Fancy energy calcs
  void energy(ArrayList<Cell> cells) {
    float totArea = 0;
    for (Cell c : cells) {
      if (c!=this) {
        float maxDist = this.r + c.r;
        float d = this.pos.dist(c.pos);
        //System.out.println("dist:"+d);
        //System.out.println("rad1:"+this.r);
        //System.out.println("rad2:"+c.r);
        if (d!=0 && (d<c.r+this.r || (d-c.r>this.r || d-this.r>c.r)) ) {
          float diffRSq = sq(this.r)-sq(c.r);
          System.out.println(sq(this.r)   *acos((sq(d)+diffRSq)/(2*d*this.r)));
          double area = 
            sq(this.r)   *acos((sq(d)+diffRSq)/(2*d*this.r))
            +sq(c.r)     *acos((sq(d)-diffRSq)/(2*d*c.r))
            -(0.5*(sqrt((-d + this.r + c.r)*(d + this.r - c.r)*(d - this.r + c.r)*(d + this.r + c.r))));
          totArea += area;
          if (area>0) {
            System.out.println(area);
          }
        }
      }
    }

    this.energy += energyGain*energy;//*(1/(totArea+1));
    //this.energy -= energyUsed;
    this.r = radius();
  }

  float radius() {
    return this.energy + 1;
  }
}
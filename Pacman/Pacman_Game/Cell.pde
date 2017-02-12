class Cell {
  int x;
  int y;
  int type; // 0 - wall, 1 - food, 2 - big food, 4 - Nothing, 5 - Entrance to Ghosts
  boolean isWalkable = true;
  
  Cell(int x, int y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
    if(type == 0 || type == 5)
      isWalkable = false;
    else
      isWalkable = true;
  }
  
  void drawAt(int x, int y) {
    switch(type) {
      case 0://Wall
        fill(0, 0, 255);
        rect(x+size/4, y+size/4, size/2, size/2);
        break;
      case 1://Small food
        fill(0, 0, 0);
        rect(x, y, size, size);
        fill(255, 164, 164);
        ellipse(x+size/2, y+size/2, size/3, size/3);
        break;
      case 2://Big food
        fill(0, 0, 0);
        rect(x, y, size, size);
        fill(255, 164, 164);
        ellipse(x+size/2, y+size/2, 2*size/3, 2*size/3);
        break;
      case 5:// Ghost exit
        fill(255, 164, 164);
        rect(x, y+size-size/5, size, size/5);
        break;
    }
  } 
  
  String toString() {
    return x+","+y+":"+type;
  }
}
class Ghost extends Entity {
  color c;
  PVector target = new PVector(25,0);
  ArrayList<Cell> path;

  Ghost(color c, float x, float y) {
    super(x, y);
    this.c = c;
    currentDir = new PVector(0, 0);
  }

  void draw() {
    if(target != null){
      noFill();
      stroke(255);
      rect((target.x*size), (target.y*size), size, size);
    }
    noStroke();
    fill(c);
    ellipse((x*size), (y*size), 2*size, 2*size);
  }

  void update() {
    super.update();
    if (target == null) {
      target = new PVector(pm.x,pm.y);
    } 
    if(pm.x == target.x && pm.y == target.y) {
      target = null;
    }
    Cell next = shortestPath((int)(target.x), (int)(target.y));
    if (next == null) {
      target = new PVector(pm.x,pm.y);
      next = shortestPath((int)(target.x), (int)(target.y));
    } 
    Cell current = currentCell();
    this.changeDir = new PVector(next.x-current.x, next.y-current.y);
  }

  Cell shortestPath(int x, int y) {
    Cell[] poss = getAdjMoveableCells();
    float dist = sqrt(sq(super.x-x) + sq(super.y-y));
    Cell cell = null;
    for (int i = 0; i < poss.length; i ++) {
      if (poss[i] != null) {
        float tmpDist = sqrt(sq(poss[i].x - x)+sq(poss[i].y - y));
        if (tmpDist < dist) {
          dist = tmpDist;
          cell = poss[i];
        }
      }
    }
    return cell;
  }

  Cell[] getAdjMoveableCells() {
    PVector direction = super.currentDir;
    Cell[] cells = new Cell[4];
    if (map.cells[(int)y][(int)x-1].isWalkable && direction.x != 1) {
      cells[0] = map.cells[(int)y][(int)x-1];
    }
    if (map.cells[(int)y][(int)x+1].isWalkable && direction.x != -1) {
      cells[1] = map.cells[(int)y][(int)x+1];
    }
    if (map.cells[(int)y-1][(int)x].isWalkable && direction.y != 1) {
      cells[2] = map.cells[(int)y-1][(int)x];
    }
    if (map.cells[(int)y+1][(int)x].isWalkable && direction.y != -1) {
      cells[3] = map.cells[(int)y+1][(int)x];
    }
    return cells;
  }
}
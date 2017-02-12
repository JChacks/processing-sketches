class Entity {
  float x;
  float y;

  float v = 0.07;
  PVector currentDir;
  PVector changeDir;


  Entity() {
    this.x = 0;
    this.y = 0;
  }
  
  Entity(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    fill(255, 255, 255);
    ellipse((x*size), (y*size), size, size);
  }

  void update() {
    // Turn logic
    if (changeDir != null && nextDirCell().isWalkable) {
      PVector result = new PVector(currentDir.x-changeDir.x, currentDir.y-changeDir.y);
      if (result.x == 0 ^ result.y == 0 ) {
        currentDir = changeDir;
        changeDir = null;
      } else {
        //We need to make a turn
        if (abs(currentDir.x) > 0) {    
          if (result.x < 0 && nextDirCell().isWalkable && x < floor(x) + 0.5) {
            x= floor(x) + 0.5;
            currentDir = changeDir;
            changeDir = null;
          } else if (result.x > 0 && nextDirCell().isWalkable && x > ceil(x) - 0.5) {
            x= ceil(x) - 0.5;
            currentDir = changeDir;
            changeDir = null;
          }
        } else {
          if (result.y < 0 && nextDirCell().isWalkable && y < floor(y) + 0.5) {
            y= floor(y) + 0.5;
            currentDir = changeDir;
            changeDir = null;
          } else if (result.y > 0 && nextDirCell().isWalkable && y > ceil(y) - 0.5) {
            y= ceil(y) - 0.5;
            currentDir = changeDir;
            changeDir = null;
          }
        }
      }
    }

    // Move logic
    if (nextCell().type != 0 || 
      (nextCell().type == 0 && 
      (abs(nextCell().x - x + 0.5) > 1 || abs(nextCell().y - y + 0.5) > 1))
      ) {
      this.x = this.x + (currentDir.x*v);
      this.y = this.y + (currentDir.y*v);
    } else {
      currentDir = new PVector(0, 0);
    }
  }

  Cell currentCell() {
    return map.cells[floor(y)][floor(x)];
  }

  Cell nextCell() {
    return map.cells[floor(y+currentDir.y)][floor(x + currentDir.x)];
  }

  Cell nextDirCell() {
    if (changeDir == null)
      return null;
    return map.cells[floor(y+changeDir.y)][floor(x+changeDir.x)];
  }
}
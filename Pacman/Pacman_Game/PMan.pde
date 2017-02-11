class PMan {
  float x;
  float y;
  
  PVector min;
  PVector max;

  float v = 0.1;
  PVector currentDir = new PVector(-1, 0);
  PVector changeDir;
  

  PMan() {
    this.x = 13.5;
    this.y = 23.5;
    
    min = new PVector(-size/2,-size/2);
    max = new PVector( size/2, size/2);
  }

  void draw() {
    fill(255, 255, 0);
    ellipse((x*size), (y*size), size, size);
  }

  void update() {
    // Turn logic
    if(changeDir != null && nextDirCell().isWalkable) { //<>//
      PVector result = new PVector(currentDir.x-changeDir.x,currentDir.y-changeDir.y);
      println(result.x +","+ result.y);
      if(result.x == 0 ^ result.y == 0 ) {
        currentDir = changeDir;
        changeDir = null;
      } else {
       
        //We need to make a turn
        if(abs(currentDir.y) > 0){
          println(result.x < 0 && nextDirCell().isWalkable && x < floor(x) + 0.5);
          println(result.x > 0 && nextDirCell().isWalkable && x < ceil(x) - 0.5);
          if(result.x < 0 && nextDirCell().isWalkable && x < floor(x) + 0.5) { //<>//
            x= floor(x) + 0.5;
            currentDir = changeDir;
            changeDir = null;
          } else if(result.x > 0 && nextDirCell().isWalkable && x < ceil(x) - 0.5) {
            x= ceil(x) - 0.5;
            currentDir = changeDir;
            changeDir = null;
          }
        } else {
          println(result.y < 0 && nextDirCell().isWalkable && y < floor(y) + 0.5);
          println(result.y > 0 && nextDirCell().isWalkable && y < ceil(y) - 0.5);
       
          if(result.y < 0 && nextDirCell().isWalkable && y < floor(y) + 0.5) { //<>//
            y= floor(y) + 0.5;
            currentDir = changeDir;
            changeDir = null;
          } else if(result.y > 0 && nextDirCell().isWalkable && y < ceil(y) - 0.5) {
            y= ceil(y) - 0.5;
            currentDir = changeDir;
            changeDir = null;
          }
        }
      }
      
      
    }
    
    // Move logic
    if (nextCell().type != 0) {
      this.x = this.x + (currentDir.x*v);
      this.y = this.y + (currentDir.y*v);
    }
  }

  Cell currentCell() {
    return map.cells[floor(y)][floor(x)];
  }

  PVector currentCellCoords() {
    return new PVector(floor(x), floor(y));
  }

  Cell nextCell() {
    return map.cells[floor(y+currentDir.y)][floor(x + currentDir.x)];
  }

  Cell nextDirCell() {
    if (changeDir == null)
      return null;
    return map.cells[floor(y+changeDir.y)][floor(x+changeDir.x)];
  } 

  //float getNextX() {
  //  float nextX = (x + (currentDir.x*v))%28;
  //  if(nextX<0)
  //    nextX += 27;
  //  if(nextX>27)
  //     nextX -= 27;
  //  return nextX;
  //}

  //float getNextY() {
  //   return y+currentDir.y;
  //}
}
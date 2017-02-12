PMan pm;
Ghost[] ghosts = new Ghost[4];
Map map;
PFont f;
int size = 16;
int score = 0;

Ghost blinky;
Ghost pinky;
Ghost inky;
Ghost clyde;

ArrayList<Integer> Inputs = new ArrayList<Integer>();

void setup() {
  size(448, 576);
  
  f = createFont("Arial",10,true); 
  
  map = new Map();
  blinky = new Ghost(color(208,62,25),13.5,11);
  pinky = new Ghost(color(234,130,229),13.5,14);
  inky = new Ghost(color(70,191,238),11.5,14);
  clyde = new Ghost(color(219,133,28),15.5,14);
  
  pm = new PMan();
  frameRate(60);
  
  
}

void draw() {
  background(0);
  
  textFont(f,16);
  fill(255);
  text("Score: "+score,10,30);
  
  noStroke();
  
  translate(0,size*5);
  for(int y = 0; y < map.cells.length; y++) {
    for(int x = 0; x < map.cells[y].length; x++) {
      map.cells[y][x].drawAt(x*size,y*size);
    }
  }
  //<>//
  
  pm.draw();
  blinky.draw();
  pinky.draw();
  inky.draw();
  clyde.draw();
  
  update(); //<>//
}

void update() {
  if(checkDeath()) {
    setup();
  }
  if(pm.currentCell().type == 1) {
    score += 20;
    pm.currentCell().type = 4;
  }
  if(pm.currentCell().type == 2) {
    pm.currentCell().type = 4;
    //scare
  }
  pm.update();
  blinky.update();
}

boolean checkDeath() {  
  if(pm.currentCell() == blinky.currentCell()) {
    return true;
  } else if(pm.currentCell() == pinky.currentCell()) {
    return true;
  } else if(pm.currentCell() == inky.currentCell()) {
    return true;
  } else if(pm.currentCell() == clyde.currentCell()) {
    return true;
  }
  return false;
}

void keyPressed() {
  switch(key) {
    case 'w':
      pm.changeDir = new PVector(0,-1);
      break;
    case 's':
      pm.changeDir = new PVector(0,1);
      break;
    case 'a':
      pm.changeDir = new PVector(-1,0);
      break;
    case 'd':
      pm.changeDir = new PVector(1,0);
      break;
    default:
      break;
  }
}
ArrayList<Cell> cells = new ArrayList<Cell>();
Boolean stayOnScreen = true;
float tickRate = 10;
long lastTick = 0;
int width = 600;
int height = 600;
void setup() {
  size(1200, 1200);
  cells.add(new Cell());
}

void draw() {
  if (System.currentTimeMillis() - lastTick > (1/tickRate)*1000) {
    background(200);
    for (int i = cells.size()-1; i >= 0; i--) {
      Cell c = cells.get(i);
      c.update(cells);
    }
    lastTick = System.currentTimeMillis();
  }
}
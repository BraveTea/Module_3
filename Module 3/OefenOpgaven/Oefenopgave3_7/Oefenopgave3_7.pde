int wdth = 300;
int hght = 40;
int colour = #00FF00;
int points = 25;

void setup() {
  size(400, 400);
}

void draw() {
  CounterConsole();
}

void mouseClicked() {
  pointsCounter();
}

void CounterConsole() {
  fill(colour);
  rect(width/2 - wdth/2, height/2 - hght/2, wdth, hght);
  fill(0);
  textAlign(CENTER, CENTER);
  text(points, width/2, height/2);
}

void pointsCounter() {

  if (points >= 1) {
    if (mouseX % 2 == 0 && mouseY % 2 ==0) {
      points = points + 1;
    } else {
      points = points - 1;
    }
  }
  if (points == 0){
    points = 25;
  }
}

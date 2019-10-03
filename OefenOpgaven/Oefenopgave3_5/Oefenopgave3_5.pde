int wdth = 300;
int hght = 40;
int colour = #00FF00;

void setup() {
  size(400, 400);
}

void draw() {
  coordinatesRect();
}

void mouseMoved() {
  println(mouseX, mouseY);
}

void coordinatesRect() {
  fill(colour);
  rect(width/2 - wdth/2, height/2 - hght/2, wdth, hght);
  if (mouseX % 2 == 0 && mouseY % 2 == 0) {
    String coordinates = "(" + mouseX + "-" + mouseY + ")" ;
    fill(0);
    textAlign(CENTER, CENTER);
    text(coordinates, width/2, height/2);
  }
}

int hght = 150;
int wdth = 100;
int colour = 255;

void setup() {
  size(400, 400);
}

void draw() {
  fill(colour);
  rect(width/2 - wdth/2, height/2 - hght/2, wdth, hght);
}

void mouseClicked() {
  if (colour == 0) {
    colour = 255;
  }
  else {
    colour = 0;
  }
}

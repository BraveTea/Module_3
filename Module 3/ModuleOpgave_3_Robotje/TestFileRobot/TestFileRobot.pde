//array coordinate gird test
// If I have through nested for loops put the coordinates in an array
// will I then be able to use those coordinates for the squares?


final int size = 500;
final int arraySize= 10;

int[] coorRobot = new int[2];
int[] coorPayload = new int[2];

int payloadStartX = round(random(0,9))*50;
int payloadStartY = round(random(0,9))*50;

void settings() {
  size(size, size);
}

void setup() {
  
}

void draw() {
  background(0);
  stroke(255);
  drawGrid();
  robot();
  payload();
}

void robot() {
  drawRobot();
}

void payload(){
  drawPayload();
}

void drawRobot() {
  int x = coorRobot[0];
  int y = coorRobot[1];
  fill(155);
  square(x, y, size/10);
}

void drawPayload(){
  coorPayload[0] = payloadStartX; //okay so this works now, but isn't correct yet
  coorPayload[1] = payloadStartY; //need to figure out how to do this correctly.. Where do the variable go???
  fill(255);                  
  ellipseMode(CORNER);
  circle(payloadStartX, payloadStartY, size/10);
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      coorRobot[0] += 50;
    } 
    else if (keyCode == LEFT) {
      coorRobot[0] -= 50;
    }
    else if (keyCode == UP){
      coorRobot[1] -= 50;
    }
    else if (keyCode == DOWN){
      coorRobot[1] += 50;
    }
    
    if (keyCode == SHIFT){
      if (coorRobot[0] == coorPayload[0] && coorRobot[1] == coorPayload[1]){
        fill(255);
        rect(0,0,150,150);
      }
    }
  }
  print(coorRobot[0], coorRobot[1], coorPayload[0], coorPayload[1],"\n");
}

void drawGrid() {
  for (int i = 0; i < height; i+=height/10) {
    line(0, i, width, i); 
    for (int j = 0; j < width; j+=width/10) {
      line(j, 0, j, height);
    }
  }
}

//array coordinate gird test
// If I have through nested for loops put the coordinates in an array
// will I then be able to use those coordinates for the squares?


final int size = 500; //The size is final because I don't want it changed in settings
final int arraySize= 10;

int[] coorRobot = new int[2];
int[] coorPayload = new int[2];

boolean shiftCount = true;

void settings() {
  size(size, size); //by using settings you can appoint a variable to size
}

void setup() {
  coorPayload[0] = round(random(0, 9))*50;
  coorPayload[1] = round(random(0, 9))*50;
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

void payload() {
  drawPayload();
}

void drawRobot() {
  int x = coorRobot[0];
  int y = coorRobot[1];
  fill(155);
  square(x, y, size/10);
}

void drawPayload() {
  int x = coorPayload[0];
  int y = coorPayload[1];
  fill(255);                  
  ellipseMode(CORNER);
  circle(x, y, size/10);
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      coorRobot[0] += 50;
    } else if (keyCode == LEFT) {
      coorRobot[0] -= 50;
    } else if (keyCode == UP) {
      coorRobot[1] -= 50;
    } else if (keyCode == DOWN) {
      coorRobot[1] += 50;
    }

    if (keyCode == SHIFT) {
      if (coorRobot[0] == coorPayload[0] && coorRobot[1] == coorPayload[1]) {
        fill(255);
        rect(0, 0, 150, 150);
        shiftCount = !shiftCount;
      }
    }
    if (shiftCount == false) {
      if (keyCode == RIGHT) {
        coorPayload[0] += 50;
      } else if (keyCode == LEFT) {
        coorPayload[0] -= 50;
      } else if (keyCode == UP) {
        coorPayload[1] -= 50;
      } else if (keyCode == DOWN) {
        coorPayload[1] += 50;
      }
    }
  }
  print(coorRobot[0], coorRobot[1], coorPayload[0], coorPayload[1], "\n");
  print("\n shiftCount = ", shiftCount, "\n");
}

void drawGrid() {
  for (int i = 0; i < height; i+=height/10) {
    line(0, i, width, i); 
    for (int j = 0; j < width; j+=width/10) {
      line(j, 0, j, height);
    }
  }
}

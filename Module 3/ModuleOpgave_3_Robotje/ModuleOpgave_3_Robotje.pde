//Thing to do:

//Clean up code. I am thinking that the bunch of if statements in the keyPressed can be a lot prettier and smaller
//There is a lot of things I would do to make this code better:
//Robot and Payload should disappear when win screen is visible.
//I am sure a lot of code could be a lot prettier. 


/*
instructions:
The square is a robot you control by using the arrow keys. 
The circle is the payload (or cargo) which will spawn in a random place.
Manoeuvre the robot to the same spot as the payload (move over it)
Once on top of payload press the shift key to "pick it up" 
Now you can move the cargo to any other spot on the field.
Press the shift key again to drop the cargo off.
Bring the cargo to the Goal (X) to win
*/


final int size = 500; //The size is final because I don't want it changed in settings
final int arraySize= 10;

int[] coorRobot = new int[2];
int[] coorPayload = new int[2];
int[] coorGoal = new int[2];

boolean shiftToggle = false;

void settings() {
  size(size, size); //by using settings you can appoint a variable to size
}

void setup() {
  coorPayload[0] = round(random(0, 9))*50;
  coorPayload[1] = round(random(0, 9))*50;
  
  coorGoal[0] = round(random(0, 9))*50;
  coorGoal[1] = round(random(0, 9))*50;
}

void draw() {
  background(0);
  stroke(255);
  //drawGrid(); //remove the comment// to draw a grid (used for testing mostly)
  goal();
  robot();
  payload();
  
}

void robot() {
  drawRobot();
  limiterRobot();
}

void payload() {
  drawPayload();
  limiterPayload();
}

void goal(){
  drawGoal();
  if (coorPayload[0] == coorGoal[0] && coorPayload[1] == coorGoal[1]){
    fill(255);
    square(size/4, size/4, size/2);
    fill(0);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("WINNER!", width/2, height/2);
  } 
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
  stroke(0);
  ellipseMode(CORNER);
  circle(x, y, size/10);
}

void drawGoal() {
  int x = coorGoal[0];
  int y = coorGoal[1];
  fill(50);
  stroke(0);
  square(x, y, size/10);
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("X", x + 25, y + 25);
}

void limiterRobot(){
  if (coorRobot[0] > size - 50){
    coorRobot[0] -= 50;
  }
  if (coorRobot[1] > size - 50){
    coorRobot[1] -= 50;
  }
  if (coorRobot[0] < 0){
    coorRobot[0] += 50;
  }
  if (coorRobot[1] < 0) {
    coorRobot[1] += 50;
  }
}

void limiterPayload(){
  if (coorPayload[0] > size - 50){
    coorPayload[0] -= 50;
  }
  if (coorPayload[1] > size - 50){
    coorPayload[1] -= 50;
  }
  if (coorPayload[0] < 0){
    coorPayload[0] += 50;
  }
  if (coorPayload[1] < 0) {
    coorPayload[1] += 50;
  }
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
        shiftToggle = !shiftToggle;
      }
    }
    if (shiftToggle == true) {
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
  print("\n shiftToggle = ", shiftToggle, "\n");
}

void drawGrid() {
  for (int i = 0; i < height; i+=height/10) {
    line(0, i, width, i); 
    for (int j = 0; j < width; j+=width/10) {
      line(j, 0, j, height);
    }
  }
}

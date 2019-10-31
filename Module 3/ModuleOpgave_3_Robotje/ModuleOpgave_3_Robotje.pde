/* 
 I have to code a little robot which can pick up and move and drop off freight
 
 Robot ==> a square 
 Payload ==> a circle
 
 Moving robot ==> using the arrow keys
 Picking up payload ==> a specific key chosen by me (I am going with spacebar)
 Dropping off payload ==> needs to be same key as Picking up freight
 
 Rules:
 -Robot is not allowed to leave the playing area
 -All the "steps" the robot takes must be equal to his own size in order to keep allignment. 
 and I am thinking it might be a good idea if the robot is a %2 == 0 order of size to the screen
 - Not really a rule but I'd say the payload needs to fit inside the robot.
 
 Expected Variables
 
 boolean move_up 
 boolean move_down
 boolean move_left
 boolean move_right
 
 loadUnload
 
 
 Pseudo
 
 Robot is somewhere in playing area
 Payload is somewhere in playing area
 Their distances must be "%2 == 0 the size of the robot" from each other 
 When the arrowkeys are used/pressed the robot needs to move in that direction on the screen.
 When robot reaches edge of playing area it is not allowed to move any further even when keys are pressed in that direction.
 When robot moves on the payload I want it to be on top
 Press loadUnload (spacebar) and payload moves on top of robot
 When robot moves with arrowkeys, the payload needs to move along
 When loadUnload is pressed payload is put underneath the robot and robot can move away freely leaving payload behind
 */

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

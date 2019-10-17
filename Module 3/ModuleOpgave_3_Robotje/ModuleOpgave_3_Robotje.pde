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

void setup(){
  size(500, 500);
  background(0);
}

void draw(){
 stroke(255);
 drawGrid();
}


void drawGrid(){
  for (int i = 0; i < height; i+=height/10){
    line(0, i, width, i); 
      for (int j = 0; j < width; j+=width/10){
        line(j, 0, j, height);
      }
  }
}

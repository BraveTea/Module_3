/*
Oefenopgave 3.8 where I used modified code from 3.7 
 1. Move mouse after every click, if not done, deduction of 1 point
 2. When clicked on double even twice (but not same point) == 2 points
 3. When clicked thrice (but not same point) == 3 points
 4. When clicked 4 times == 5 points
 5. When clicked >= 5 times == 10 points
 
 */

int wdth = 300;
int hght = 40;
int colour = #00FF00;
int points = 25;
int count = 1;
boolean moveBool;



void setup() {
  size(400, 400);
}

void draw() {
  CounterConsole();
  println(mouseX, mouseY); //for testing
}

void mouseMoved() {
  moveBool = true;
}

void mouseClicked() {
  pointsCounter();
  moveBool = false;
}

boolean doubleEven() {
  return (mouseX % 2 == 0 && mouseY % 2 ==0);
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
    if (doubleEven() && moveBool) {
      switch (count) {
      case 1:
        points += 1;
        count += 1;
        break;
      case 2:
        points += 2;
        count += 1;
        break;
      case 3:
        points += 3;
        count += 1;
        break;
      case 4:
        points += 5;
        count += 1;
        break;
      case 5:
        points += 10;
        break;
      }
    } 
    else {
      points -= 1;
      count = 1;
    }
  }
  if (points == 0) {
    points = 25;
  }
  println(doubleEven(), points, count, mouseX, mouseY); //for testing
}

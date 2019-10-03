void setup(){
  size(400,400);
}

void draw(){
  secondCounter();
}

void secondCounter(){
  background(155);
  int count = millis()/1000;
  textAlign(CENTER, CENTER);
  textSize(20);
  text(count, width/2, height/2);
}

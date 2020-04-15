
void setup() {
  size(1000, 900); 
  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255, 150);
  noFill();
  fract(0, 0, 300);
}



void fract(float x, float y, float a) {
  rect(x, y, a, a);
  ellipse(x, y, a/2, a/2);
  if (a > 50) {
    fract(x + a/2, y + a/2, a/2);
    fract(x - a/2, y - a/2, a/2);
    fract(x - a/2, y + a/2, a/2);
    fract(x + a/2, y - a/2, a/2);
  }
}



void setup() {
  size(1200, 800);
  
  
}


void draw() {
  float r = 20;
  background(100);
  translate(0, height/2);
  for(float i = 20; i < width; i += 20) {
    float x = i;
    float y = cos((i + frameCount)/ mouseX/2) * height/2;
    r = map(sin((i+frameCount)/50), -1, 1, 50, 70);
    pushMatrix();
    fill(sin(i) * 55, 0, y, 100);
    ellipse(x, y, r, r);
    popMatrix();
  }
  
}



void setup() {
  size (800, 800);
  background(255);
  translate(width/2, height/2);
  float radius = 100;
  for(float i = 0; i < TWO_PI; i+= 0.001){
    float x = pow(sin(i), 3)*16;
    float y = 13 * cos(i) - 5 * cos(2*i) - 2 * cos(3*i) - cos(4*i);
    
    beginShape();
    strokeWeight(50);
    stroke(200, 0, 0);
    vertex(x*15, -y* 15);
    endShape();
    
  }
}

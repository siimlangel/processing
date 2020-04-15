
void setup() {
  size(800, 600);
  
  
}


void draw() {
  background(100);
  translate(width/2, height);
  strokeWeight(3);
  tree(200);


}

float angle = 120;

void tree(float len) {
  pushMatrix();
  line(0, 0, 0, -len);
  translate(0, -len);
  if(len > 10) {
   rotate(angle);
   tree(len * 0.67);
   rotate(2 * -angle);
   tree(len * 0.67);
    
  }
  popMatrix();
  
}

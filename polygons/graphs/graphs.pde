
void setup() {
  size(800, 800);
  background(255);
  axes();
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(2);
  for(float i = 0; i <= width/2; i += 0.01) {
    beginShape();
    stroke(255, 0, 0);
    vertex(i, x(i));
    endShape();
    
    pushMatrix();   
    beginShape();
    stroke(0, 0, 255);
    vertex(i, x2(i));
    endShape();
    popMatrix();
    
  }
  popMatrix();
  
  pushMatrix();
  stroke(255, 0, 0);
  
  translate(width/2, height/2);
  for(float i = 0; i >= -width/2; i -= 0.01) {
    beginShape();
    stroke(255, 0, 0);
    vertex(i, x(i));
    endShape();
    
    pushMatrix();   
    beginShape();
    stroke(0, 0, 255);
    vertex(i, x2(i));
    endShape();
    popMatrix();
    
  }
  popMatrix();
}



float x(float t) {
   float val = norm(tan(t * t / 2500), 0, 1);
  return (val * (height/16));

  
}

float x2(float t) {
  float val = norm(tan(t * t / 2500), 0, 1);
  return -(val * (height/16));

  
}


void axes() {
  /*
 pushMatrix();
 strokeWeight(2);
 translate(width/2, 0);
 line(0, 0, 0, height);
 translate(0, height/2);
 line(-width/2 , 0, width, 0);
 popMatrix();
 */
 
 pushMatrix();
 for(float i = 0; i <= width; i+= width/16) {
  strokeWeight(0.4);
  line(i, 0, i, height);
 }
 
 popMatrix();
 
 pushMatrix();
 for(float i = 0; i <= height; i+= height/16) {
  strokeWeight(0.4);
  line(0, i, width, i);
 }
 
 popMatrix();
  
}

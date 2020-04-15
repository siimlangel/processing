float x, y;
float r = 0;
float theta;
float n = 1;
void setup () {
  background(100);
  size(1200, 900);
  strokeWeight(4);
  translate(width/2, height/2);
  for (int i = 0; i < 100000; i ++) {

    x = 10*(16*sin(theta)*sin(theta)*sin(theta));
    y = -10 * (13*cos(theta) - 5* cos(2*theta) - 2* cos(3*theta) - cos(4*theta));
    
    //r = 200 * (1 - cos(8*theta) * sin(0.1 * theta));
    //r = -(3.5 -1.5*(abs(cos(theta)))*sqrt(1.3 +abs(sin(theta))) + cos(2*theta) - 3*sin(theta) + 0.7*cos(12.2*theta))* 75;
    beginShape();
    pushMatrix();
    stroke(255, 0, 0);
    vertex(x, y);
    popMatrix();
    endShape();
    theta += 0.01;
  }
  
}

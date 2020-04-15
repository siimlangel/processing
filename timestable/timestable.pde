
float total = 1000;
float r;
float x, y;
float n = 100;
float hue = 1;
float inc = 0;


void setup() {
  size(1200, 800, P3D);
  r = height/2;
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  pushMatrix();
  noFill();
  ellipse(0, 0, r*2, r*2);
  popMatrix();
  fill(255);
  
  
  
  for (int i = 0; i < total; i ++) {
    PVector b = getVector(i);
    

    ellipse(b.x, b.y, 10, 10);
  }
  
  
  
  for (int i = 0; i < total; i ++) {
    PVector a = getVector(i);
    PVector b = getVector(i * n);
    PVector len = a.copy().add(b.copy());
    pushMatrix();
    stroke(map(len.mag(), 0, 800, 60, 200), 255, 255, 75);
    line(a.x, a.y, b.x, b.y);
    popMatrix();

    
  }
  hue += inc;
  if (hue > 360) {
    inc *= -1;
  } else if (hue < 0) {
    inc *= -1;
  }
  n += 0.001;
}

void mousePressed() {
  n += 1;
  println(n);
}


PVector getVector(float index) {
  float angle = map(index % total, 0, total, 0, TWO_PI);
  PVector v = PVector.fromAngle(angle);
  v.setMag(r);
  return v;
}

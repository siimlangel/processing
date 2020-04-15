

ArrayList<Ball> balls;
int scl = 20;
float max_distance;
float zoff;
void setup() {
  size(1200, 800);
  balls = new ArrayList<Ball>();
  max_distance = dist(0, 0, width, height);
  for (int i = 0; i < width + scl; i+= scl) {
    for (int j = 0; j < height + scl; j+= scl) {
      PVector pos = new PVector(i, j);
      balls.add(new Ball(pos, 100));
    }
  }
  
}

PVector target;
void draw() {
  background(255);
  target = new PVector(mouseX, mouseY);
 
  for (Ball b: balls) {
    b.show();
    b.changeRadius(target);
  }
  
  zoff += 0.01;
  
}


class Ball {
  PVector pos;
  float r;

  Ball(PVector position, float radius) {
    pos = position;
    r = radius;
    
  }

  void show() {
    float hue = map(r, 0, 15, 0, 255);
    fill(0, hue);
    noStroke();
    ellipse(pos.x, pos.y, r, r);
  }

  void changeRadius(PVector target) {
    float d = dist(target.x, target.y,pos.x , pos.y);
    if (mousePressed){
      r = map(d * scl / 2, 0, max_distance, 0, scl);
    }
    //r = noise((d/max_distance) / 200, d/max_distance * 200, zoff)* 50;
    if (r > scl + 10) {
      r = scl + 10;
    }
    
  }
}


int scl = 10;
int cols, rows;
float angle;
float xoff, yoff;

PVector flowfield[];

ArrayList<Particle> particles;

float hue = 160;
float inc = 1;


void setup() {
  fullScreen(P3D);
  background(0);
  colorMode(HSB);
  cols = floor(width / scl) + 1;
  rows = floor(height /scl) + 1;
  flowfield = new PVector[cols * rows];
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 50000; i++) {
    if (hue > 220) {
      inc *= -1;
    } else if (hue < 160) {
      inc *= -1;
    }

    PVector start = new PVector(random(width), random(height));
    //PVector start = new PVector(width/2, height/2);
    particles.add(new Particle(start, random(0.05, 4), hue));

    hue += inc;
  }
}

float getValue(float x, float y) {
  //return (sin(x * 0.1) + sin(y * 0.1)) * TWO_PI * 2;
  //return (sin(x * y * 0.1) * TWO_PI * 2);
  //return (tan(x * 0.05) + tan(y * 0.05)) * TWO_PI * 2;
  //return (sqrt(x * x * x * 0.05) + sqrt(y * y * y * 0.05)) * 2.5;
  //return (log(x * x * 0.1) + log(y * y * 0.1)) * 10;
  //return (sin(x * x * 0.1) + sin(y * y * 0.1)) * TWO_PI * 4;
  return (sin((x +y) * 0.1) + sin((x- y) * 0.1)) * 4;
}

float zoff = 0;
float x_, y_;
PVector start;
boolean changeStart;



void draw() {
  background(255);
  if (mousePressed) {
    for (int i = 0; i < 10; i++) {
      start = new PVector(mouseX+random(-100, 100), mouseY+random(-100, 100));
      particles.add(new Particle(start, random(0.05, 4), hue));
    }
  }
  yoff = 0;
  for (int x = 0; x < cols; x++) {
    xoff = 0;
    for (int y = 0; y < rows; y++) {
      //angle = noise(xoff, yoff, zoff) * TWO_PI * 4;

      angle = getValue(x, y) * sin(zoff * 4);

      //angle = getValue(x, y);
      x_ = sin((y - x + angle) * 0.05);
      y_ = sin((x + y + angle) * 0.05);

      //PVector v = PVector.fromAngle(angle);
      PVector v = new PVector(x_, y_);
      v.setMag(0.1);
      int index = y + x * rows;
      flowfield[index] = v;

      
      pushMatrix();
       strokeWeight(1);
       stroke(0);
       translate(x * scl, y * scl);
       rotate(v.heading());
       line(0, 0, scl, 0);
       popMatrix();
       

      xoff += 0.05;
    }
    yoff += 0.05;
    zoff += 0.00001;
  }
  /*
  for (Particle p : particles) {
    p.follow(flowfield);
    p.update();
    p.edges();
    p.show();
    p.hue = (map(p.vel.mag(), 0.5, 2, 120, 160));
  }
  */
}




class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed;
  PVector prevPos;
  float hue;


  Particle(PVector start, float maxspeed, float hue) {
    pos = start;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxSpeed = maxspeed;
    prevPos = pos.copy();
    this.hue = hue;
  }


  void show() {
    pushMatrix();
    strokeWeight(2);
    stroke(this.hue, 255, 255, 200);
    line(pos.x, pos.y, prevPos.x, prevPos.y);        
    popMatrix();
    updatePos();
  }

  void updatePos() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }

  void update() {
    pos.add(vel);
    vel.limit(maxSpeed);
    vel.add(acc);
    acc.mult(0);
  }


  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePos();
    }
    if (pos.x < 0) {
      pos.x = width;
      updatePos();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePos();
    }
    if (pos.y < 0) {
      pos.y = height;
      updatePos();
    }
  }

  void applyForce(PVector force) {
    acc.add(force);
  }


  void follow (PVector flowfield[]) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = y + x * rows;

    PVector force = flowfield[index];

    applyForce(force);
  }
}

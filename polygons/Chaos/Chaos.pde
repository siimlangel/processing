import peasy.*;


float a = 10;
float b = 28;
float c = 8.0/3.0;
Point p;
PeasyCam cam;
Attractor att;
ArrayList<Attractor> attractors = new ArrayList<Attractor>();
ArrayList<PVector> positions = new ArrayList<PVector>();
ArrayList<Point> points = new ArrayList<Point>();

float col = 1;
float inc = 1;

void setup() {
  size(1200, 800, P3D);
  colorMode(HSB);
  att = new Attractor(0.01, 0, 0, 255);
  cam = new PeasyCam(this, 500);
  for (float i = 0; i < 5000; i++) {
    positions.add(att.calc());
  }
}


void draw() {
  scale(5);
  strokeWeight(0.5);
  background(0);
  noFill();
  /*
  beginShape();
   for (PVector loc : positions) {
   att.graph(loc);
   }
   endShape();
   */
  if (col > 360) {
    inc *= -1;
  } else if (col <= 0) {
    inc *= -1;
  }

  if (frameCount % 20 == 0) {
    points.add(new Point(0.01, 0, 0, col));
  }
  if (points.size() > 300) {
    points.remove(0);
  }
  for (Point p : points) {
    p.move();
  }

  col += inc;
}

class Attractor {
  float x;
  float y;
  float z;
  float hue;

  Attractor(float x, float y, float z, float hue) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.hue = hue;
  }

  void graph(PVector p) {
    pushMatrix();
    stroke(255, 100);
    vertex(p.x, p.y, p.z);
    popMatrix();
  }

  PVector calc() {
    float dt = 0.01;

    float dx = (a * (this.y - this.x)) * dt;
    float dy = (this.x * (b - this.z) - this.y) * dt;
    float dz = (this.x * this.y - c * this.z) * dt;

    this.x += dx;
    this.y += dy;
    this.z += dz;
    return new PVector(this.x, this.y, this.z);
  }
}



class Point {
  float x;
  float y;
  float z;
  float hue;
  ArrayList<PVector> history = new ArrayList<PVector>();
  float r = 1;

  Point(float x, float y, float z, float hue) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.hue = hue;
  }

  void move() {
    float dt = 0.01;

    float dx = (a * (this.y - this.x)) * dt;
    float dy = (this.x * (b - this.z) - this.y) * dt;
    float dz = (this.x * this.y - c * this.z) * dt;

    this.x += dx;
    this.y += dy;
    this.z += dz;
    
    PVector position = new PVector(this.x, this.y, this.z);


    history.add(position); 

    if (history.size() > 300) {
      history.remove(0);
    }


    pushMatrix();

    stroke(map((this.x + this.y + this.z)/6, -15, 15, 0, 120), 255, 100);
    strokeWeight(1);
    beginShape();
    for (int i = 0; i < history.size(); i++) {
      vertex(history.get(i).x, history.get(i).y, history.get(i).z);
    }
    endShape();


    popMatrix();
  }
}

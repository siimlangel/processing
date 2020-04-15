PVector p, v, a, target;
Mover m;

ArrayList<Mover> movers;

void setup() {
  size (1200, 800);
  movers = new ArrayList<Mover>();


 
  for (int i = 0; i < 20; i++) {
     p = new PVector(random(width), random(height));
     v = new PVector(0, 0);
     a = new PVector(0, 0);
    movers.add(new Mover(p, v, a, random(10, 30)));
  }
}



void draw() {
  background(151);
  //translate(width/2, height/2);
  target = new PVector(mouseX, mouseY);
  pushMatrix();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  popMatrix();
  for (Mover m: movers) {
    m.show();
    m.move();
    m.seek(target);
  }
}


class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float maxvel;
  float maxforce;

  Mover(PVector pos, PVector vel, PVector acc, float r) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.r = r;
    maxvel = 8;
    maxforce = 0.1;
  }


  void show() {

    fill(255);
    stroke(0);
    float angle = this.vel.heading() + PI/2;

    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(angle);
    beginShape();
    vertex(0, -this.r * 2);
    vertex(-this.r, this.r);
    vertex(this.r, this.r);
    endShape();
    popMatrix();
  }

  void move() {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, this.pos);
    float d = desired.mag();
    desired.normalize();

    desired.normalize();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxvel);
      desired.mult(m);
    } else {
      desired.mult(this.maxvel);
    }
    if ( d < 1) {
      this.vel.add(new PVector(random(-10, 10), random(-10, 10)));
    }


    PVector steer = PVector.sub(desired, this.vel);
    steer.limit(maxforce);



    applyForce(steer);
  }

  void applyForce(PVector force) {
    this.acc = force;
  }
}

class Particle {
  PVector pos;
  PVector vel;
  PVector acc = new PVector(0, 0);
  boolean seed;
  float lifespan = 255;
  float hu;

  Particle(PVector pos, PVector vel, boolean seed, float hu) {
    this.pos = pos;
    if (seed) {
      this.vel = vel;
    } else {
      this.vel = vel.mult(random(-10, 5));
    }
    this.seed = seed;
    this.hu = hu;
  }


  void show() {
    pushMatrix();
    if (this.seed) {
      stroke(255);
    } else {
      stroke(hu, 255, 255, lifespan);
    }
    strokeWeight(map(this.vel.mag(), 0, 10, 10, 1));
    point(this.pos.x, this.pos.y);

    popMatrix();
  }
  
  void update() { 
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.acc.mult(0);
    
    if (!this.seed) {
      lifespan -= 2;
      this.vel.mult(0.95);
    }
    
  }
  
  void applyForce(PVector force) {
    this.acc.add(force);
  }
  
  boolean isDead() {
    return this.lifespan <= 0;
  }
  
}

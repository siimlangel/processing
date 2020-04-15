ArrayList<Particle> snowflake;
Particle particle;

void setup() {
  size(1000, 1000);
  particle = new Particle(new PVector(width/2, 0));
  snowflake = new ArrayList<Particle>();
}

void draw() {
  background(100);
  translate(width/2, height/2);
  
  //snowflake.add(new Particle(particle.pos));
  //particle.pos = new PVector(width/2, 0);
  
  while (!particle.finished() && !particle.intersects(snowflake)) {
    particle.move();
  }
  
  snowflake.add(particle);
  particle = new Particle(new PVector(width/2, 0));
  
  for (int i = 0; i < 6; i ++) {
    rotate(PI/3);
    particle.show();
    
    for (Particle p : snowflake) {
      p.show();
    }
   
    
    pushMatrix();
    scale(1, -1);
    particle.show();
    for (Particle p : snowflake) {
      p.show();
    }
    popMatrix();
    
  }
  
}



class Particle {

  PVector pos;
  float r;

  Particle(PVector pos_) {
    pos = pos_;
    r = 5;
  }

  void show() {
    noStroke();
    fill(255, 100);
    ellipse(pos.x, pos.y, r, r);
  }

  void move() {
    pos.x += -1;
    pos.y += random(-5, 5);
  }

  boolean finished() {
    return pos.x < 1;
  }

  boolean intersects(ArrayList<Particle> snowflake) {
    boolean result = false;

    for (Particle p : snowflake) {
      float d = dist(pos.x, pos.y, p.pos.x, p.pos.y);
      if (d < r) {
        result = true;
        break;
      }
    }
    return result;
  }
}

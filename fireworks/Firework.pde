
class Firework {
  ArrayList<Particle> particles;
  Particle firework;
  Firework() {
    this.particles = new ArrayList<Particle>();
    this.firework = new Particle(new PVector(random(width), height), new PVector(random(-2, 2), random(-9, -5)), true, 255);
  }


  void run() {
    if (this.firework != null) {
      firework.applyForce(gravity);
      firework.show();
      firework.update();
      explode();
    } else {
      for (int i = particles.size() - 1; i >= 0; i--) {
        particles.get(i).show();
        particles.get(i).update();
        particles.get(i).applyForce(gravity);
        if (particles.get(i).isDead()) {
          particles.remove(i);
        }
      }
    }
  }

  boolean exploded() {
    return this.firework.vel.y >= 0;
  }

  void explode() {
    if (this.exploded()) {
      float col = random(360);
      for (int i = 0; i < 100; i++) {
        if (i % 50 == 0) {
          col = random(360);
        }
        particles.add(new Particle(new PVector(this.firework.pos.x, this.firework.pos.y), PVector.random2D(), false, col));
      }
      this.firework = null;
    }
  }

  boolean done() {
    if (this.firework == null && this.particles.isEmpty()) {
      return true;
    }
    return false;
  }
}

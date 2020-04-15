ArrayList<Firework> fireworks;
PVector gravity;

void setup() {
  size(1200, 600, P3D);
  colorMode(HSB);
  background(0);
  fireworks = new ArrayList<Firework>();
}

void draw() {
  fill(0, 20);
  rect(0,0,width, height);
  if (random(0, 1) < 0.05) {
    fireworks.add(new Firework());
  }

  gravity = new PVector(0, 0.1);
  for (int i = fireworks.size() - 1; i >= 0; i--) {
    fireworks.get(i).run();
    if (fireworks.get(i).done()) {
      fireworks.remove(i);
    }
  }
}

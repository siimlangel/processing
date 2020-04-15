float[] weights;
String[] prizes;
float sum_of_weights;
PVector current;
PVector next;
void setup () {
  fullScreen();
  background(0);
  weights =  new float[]{1, 85, 7, 7};
  prizes = new String[]{"1", "2", "3", "4"};
  for (int i = 0; i < weights.length; i++) {
    sum_of_weights += weights[i];
  }
  current = new PVector(1, 1);
  next = new PVector();

  translate(width/2, height - 100);
  rotate(PI);
  for (int i = 0; i < 300000; i++) {
    generate();
  }
}


void generate() {
  float r = random(0, sum_of_weights);

  float px = current.x * 160;
  float py = current.y * 90;
  stroke(map(r, 0, sum_of_weights, 0, 100), map(r, 0, sum_of_weights, 45, 255), py / 10, 100);
  point(px, py);

  if (getChoice(r) == "1") {
    next.x = 0;
    next.y = 0.16 * current.y;
  } else if (getChoice(r) == "2") {
    next.x = 0.85 * current.x + 0.04 * current.y;
    next.y = -0.04 * current.x + 0.85 * current.y + 1.6;
  } else if (getChoice(r) == "3") {
    next.x = 0.2 * current.x - 0.26 * current.y;
    next.y = 0.23 * current.x + 0.22 * current.y + 1.6;
  } else if (getChoice(r) == "4") {
    next.x = -0.15 * current.x + 0.28 * current.y;
    next.y = 0.26 * current.x + 0.24 * current.y + 0.44;
  }
  current = next.copy();
}



String getChoice(float rand) {
  for (int i = 0; i < weights.length; i++) {
    if (rand < weights[i]) {
      return prizes[i];
    }
    rand -= weights[i];
  }
  return "Shouldn't get here";
}

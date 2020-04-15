Ball b;
Ball b2;
void setup() {

  size(1000, 800);
  b = new Ball(new PVector(0, 0), 10, 0);
  b2 = new Ball(new PVector(0, 0), 10, 255);
}

float t;

void draw() {
  background(51);
  translate(width/2, height/2);
  scale(1.5);
  //b.pos.x = mouseX;
  //b.pos.y = mouseY;
  b2.show();
  b.show();
  b.move(t, 100, (cos(t/3 + PI) + sin (t / 2 + PI) ), (sin(t/3 + PI) - cos(t/2 + PI)));
  b2.move(t, 100, (cos(t/3) + sin (t / 2) ), (sin(t/3) - cos(t/2)));

  t+=0.05;
}


class Ball {
  PVector pos;
  float r;
  float dr = 1;
  ArrayList<PVector>history = new ArrayList<PVector>();
  float c;

  Ball(PVector pos, float r, float c) {
    this.pos = pos;
    this.r = r;
    this.c = c;
  }


  void show() {
    noStroke();

    for (int i = 1; i < history.size(); i++) {
      pushMatrix();
      //fill(255 - i * c , 150 , 67);
      fill(c, 100);
      ellipse(history.get(i).x, history.get(i).y, (i % 8) * 5, (i % 8) * 5);
      popMatrix();
    }
  }


  void move(float angle, float radius, float xchange, float ychange) {
    this.pos.x = xchange * radius;
    this.pos.y = ychange * radius;

    history.add(new PVector(this.pos.x, this.pos.y));

    if (this.history.size() > 40) {
      this.history.remove(0);
    }
  }
}

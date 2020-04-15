
PVector a, b, c;
PVector next;
int r;
int nextr;
int n = 3;
float inc = 0.5;
ArrayList<PVector> points;


void setup() {
  fullScreen();
  background(0);
  points = new ArrayList<PVector>();
  
  for (int i = 0; i < n; i++) {
    float x = cos(i * TWO_PI / n) * min(width/2, height/2) + width/2;
    float y = sin(i * TWO_PI / n) * min(width/2, height/2) + height/2;
    points.add(new PVector(x, y));
  }

  next = new PVector(random(width), random(height));
}


void draw() {
  for (PVector p : points) {
    stroke(255, 0, 255, 100);
    strokeWeight(4);
    point(p.x, p.y);
  }
  for (int i = 0; i <800; i++) {
    int r = floor(random(n));
    strokeWeight(1);
    stroke(map(r, 0, n, 0, 255), 155, 50);
    
    if (abs(r - nextr) != 2) {
      point(next.x, next.y);
      pushMatrix();
      strokeWeight(2);
      stroke(255, 0, 0);
      point(next.x, next.y);
      popMatrix();
     
      PVector curr = points.get(r);
      next.x = lerp(next.x, curr.x, inc);
      next.y = lerp(next.y, curr.y, inc);
      
      
    }
    nextr = r;
  }
}


Slider s;

void setup() {
  size(1200, 800);
  s = new Slider(450, 50, 100, 800);
}

float c1 = random(255);
float c2 = random(255);
float c3 = random(255);


float n = 0;
float m = 1;

float r = 150;



float yoff = 0;
float zoff = 0;
void draw() {
  background(100);
  fill(255, 55, 100, 100);

  
  s.show();
  s.move();
  n = map(s.x, 100, 800, -2, 2);

  pushMatrix();
  translate(width/2, height/2);
  fill(c1, c2, c3, 100);
  strokeWeight(2);
  beginShape();
  float xoff = 0;
  for (float i = -0.001; i < TWO_PI - 0.001; i+= 0.001) {
    float radius = r + map(noise(sin(xoff * n) / m + (cos(xoff * n/2)* m), yoff, zoff), -0.4, 0.4, -300, 100);
    float x = cos(i) * radius;
    float y = sin(i) * radius;
    vertex(x, y);
    xoff += 0.01;
  }

  endShape(CLOSE);
  popMatrix();
  yoff += 0.007;
  zoff += 0.01;
}

void keyPressed() {
  if(key == 'd'){
    s.x += 1;
  }else if(key == 'a'){
    s.x -= 1;
  }
}





class Button {
  float x;
  float y;
  float r;


  Button(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  void show() {
    ellipse(this.x, this.y, this.r, this.r);
  }

  boolean pressed() {
    return dist(this.x, this.y, mouseX, mouseY) < this.r / 2;
  }
}



class Slider {
  float x;
  float y;
  float minX;
  float maxX;
  

  Slider(float x, float y, float minX, float maxX) {
    this.x = x;
    this.y = y;
    this.maxX = maxX;
    this.minX = minX;
    
    
  }
  
  void show() {
   line(this.minX, this.y, this.maxX, this.y);
   ellipse(this.x, this.y, 30, 30);
    
  }
  
  void move() {
    float d = dist(mouseX, mouseY, this.x, this.y);
    
    if(d < 30 && mousePressed) {
      
        this.x = constrain(mouseX, this.minX, this.maxX);
        
      
      
    }
    
  }
}

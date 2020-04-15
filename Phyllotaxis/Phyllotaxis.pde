
float x, y;

float r = 0;
float c = 3;

float angle = 0;
float n = 0;
void setup() {
  size(800, 600);
  background(51);
  colorMode(HSB);
 
}

float hu;
float b;
float d;
void draw() {
  //hu = map(angle % 360, 0, 360, 0, 80);
  hu = 40;
  if( n < 1000) {
    b = 10;
  }else {
    b = 255;
  }
  fill(hu, 255, b);
  translate(width/2, height/2);
  angle = n * 137.5;
  r = c * sqrt(n);
  
  x = cos(angle) * r;
  y = sin(angle) * r;
  
  d = map(frameCount % 10, 0, 10, 5, 15);
  
  ellipse(x, y, d, d);
  n+=2;
  
}

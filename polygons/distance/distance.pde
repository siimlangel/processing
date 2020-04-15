

void setup() {
  fullScreen();
  
}

void draw() {
 background(255);
 float r = 10;
 
 for(float i = 0; i < width; i += 30) {
   for(float j = 0; j < height; j += 30) {
     float x = i;
     float y = j;
     float d = dist(mouseX, mouseY, x, y);
     r = map(d, -100, 100, 0, 100);
     fill(0);
     ellipse(x, y, r, r);
   }

   
 }
  
}

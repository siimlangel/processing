
float a, b = 0;
float aa, bb;
float n = 0;
float brightness;
float maxits = 10000;


void setup() {
  fullScreen();
  background(51);
  colorMode(HSB);
  pixelDensity(1);
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      a = map(i, 0, width, -2, 1.5);
      b = map(j, 0, height, -1.5, 1.5);
      float ca = a;
      float cb = b;
      n = 0;
      while (n < maxits) {
        aa = a * a - b * b;
        bb = 2 * a * b;

        a = aa + ca;
        b = bb + cb;

        if (abs(a + b) > 1000) {
          break;
        }
        n++;
      }
     
      if (n < maxits) {
        float log_zn = log(a * a + b * b) / 2;
        float nu = log(log_zn / log(2)) / log(2);
        n = n + 1 - nu;
        n = map(n, -100, 100, 0, 360);
      }
      

      
      if (n == maxits) {       
        n = 0;
      }

      int loc = (i + j * width) ;
      //pixels[loc] = color(hue, sat, brightness);
      pixels[loc] = color(n, 255, 100 * n);
    }
  }

  updatePixels();
}

int x=0;
int y=70;

float radio;

void setup() {
  size(1000, 1000);
  background(255);
  //noStroke();
  //frameRate(10);
}

void draw() {
  //Número provisional para reemplazarlo por una onda de sonido
  float numaleatorio = random (0, 1);
  radio = (numaleatorio * width/4);

  fill (random(100), random(80), random(200));
  line(x, y, radio, radio);
  x += 10;
  //controlar el dibujo en el eje horizontal

  if (x >= width) {
    x = 0;
    y = y + 70;
  }
  if (y > height) {
    background(255);
    y= 70;
    //controlar el dibujo en el eje vertical
  }
}

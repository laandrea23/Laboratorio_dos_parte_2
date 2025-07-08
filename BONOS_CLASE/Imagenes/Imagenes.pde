PImage cuento;

void setup(){
  size(600,600);
  cuento = loadImage("cuento.png");
  cuento.loadPixels();
}

void draw(){
  image(cuento,0,0);
}

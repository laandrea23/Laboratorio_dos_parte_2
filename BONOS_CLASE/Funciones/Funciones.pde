void setup() {
  size(600, 600);
  background(255);
}
//Función dibujar un triangulo
//void draw() {
//  dibujarTriangulo(10, 10, 100, 500, 500, 100, 10);
//}
////Funciones
//void dibujarTriangulo(float x1, float y1, float x2, float y2, float x3, float y3, float num) {
//  for (int i=0; i < num; i++) {
//    triangle(x1, y1, x2, y2, x3, y3);
//  }
//}

void draw() {
  //El ultimo numero añade más capas al circulo
  dibujarCirculo(width*0.25, height*0.4, 100, 4);
  dibujarCirculo(width*0.5, height*0.75, 100, 10);
 
}
//Funciones
void dibujarCirculo(float xPos, float yPos, float size, float numero) {
  float grayValue = 255 /5;
  float steps = size/numero;
  //Se define el numero de iteraciones con el parametro numero
  for (int i=0; i < numero; i++) {
    fill(i*grayValue);
    ellipse(xPos, yPos, size-1*steps, size-i*steps);
  }
}

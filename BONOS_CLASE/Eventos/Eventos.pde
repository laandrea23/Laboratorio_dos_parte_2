//int spacing;

//void setup() {
//  size(1000, 1000);
//  background(0);

//  spacing = 30;
//}

//void draw() {
//  for (int x = spacing; x < width; x+= spacing) {
//    ellipse(x, 50, 20, 20);
//  }
//}

// -------- PSEUDOGODIGO---------
//Inicio
//  Definir un número
//  Evaluar si el número es mayor o igual a 10
//   Si es mayor, Imprimir el número en la consola
//   Si no es mayor, imprimir que no es mayor
//Fin

//void setup() {
//  int numero = 6;

//  if (numero >= 10) {
//    println("El número es: " + numero);
//  } else {
//    println("Número menor a 10");
//  }
//}

//---------- INTERACCIÓN CON MOUSE ------------
//void setup() {
//  size(1000, 1000);
//  background(0);
//}
////Interacción Teclados

//void draw() {

//  if (keyPressed == true) {
//    if (keyCode == UP) {
//      println("Evento inicial");
//    }
//    if (keyCode == DOWN) {
//      println("Climax");
//    }
//    if (keyCode == LEFT) {
//      println("Desenlace");
//    }
//  }
//}

PImage img;
int index;

void setup() {
  size(1000, 1000);
  loadImageEvent(index);
}
void draw() {
  loadImageEvent(index);
}

void mousePressed() {
  //Incrementar en una unidad el valor de index cuando el mouse se presiona
  index++;
  loadImageEvent(index);
}

void loadImageEvent(int i) {
  switch(i) {
  case 0:
    println("Evento 0");
    img = loadImage("inicio.jpg");
    break;
  case 1:
    println("Evento 1");
    img = loadImage("medio.jpg");
    break;
  case 2:
    println("Evento 2");
    img = loadImage("final.jpg");
    break;
  case 3:
    println("Evento 3");
    index = 0;
    break;
  }
  image(img, 0, 0, width, height);
}

//Gato miGato;

//void setup() {
//  size(800, 800);
//  miGato = new Gato(color(255, 100, 50), 400, 400, 3);
//}

//void draw() {
//  background(220);
//  miGato.display();
//  miGato.correr();
//}

//class Gato {
//  //propiedades
//  color c;
//  float posX;
//  float posY;
//  float velocidad;

//  //Constructor
//  Gato(color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
//    c= tempC;
//    posX=tempPosX;
//    posY = tempPosY;
//    velocidad=tempVelocidad;
//  }
//  //Métodos
//  void display() {
//    fill(c);
//    noStroke();

//    // Cabeza
//    ellipse(posX, posY, 50, 50);

//    // Orejas
//    triangle(posX - 20, posY - 20, posX - 10, posY - 40, posX, posY - 20);
//    triangle(posX + 20, posY - 20, posX + 10, posY - 40, posX, posY - 20);

//    // Ojos
//    fill(255);
//    ellipse(posX - 10, posY - 5, 10, 10);
//    ellipse(posX + 10, posY - 5, 10, 10);
//    fill(0);
//    ellipse(posX - 10, posY - 5, 4, 4);
//    ellipse(posX + 10, posY - 5, 4, 4);

//    // Nariz
//    fill(255, 100, 100);
//    triangle(posX - 3, posY + 5, posX + 3, posY + 5, posX, posY + 10);
//  }

//  void correr() {
//    posX += velocidad;

//    // Si llega al borde derecho o izquierdo, invierte la dirección
//    if (posX > width || posX < 0) {
//      velocidad *= -1;
//    }
//  }
//}

// ------------- SUBCLASES------------------

Gato miGato;
Perro miPerro;

void setup() {
  size(800, 800);
  miGato = new Gato(color(255, 100, 50), 200, 200, 3);
  miPerro = new Perro(color(255, 100, 50), 400, 400, 3);
}

void draw() {
  background(220);
  miGato.display();
  miPerro.display();
  miGato.correr();
  miPerro.correr();
  miGato.maullar();
  miPerro.ladrar();
}
// Clase grande
class Mamifero {
  //propiedades
  color c;
  float posX;
  float posY;
  float velocidad;

  //Métodos
  void display() {
    fill(c);
    noStroke();
    rect(posX, posY, 100, 100);
  }

  void correr() {
    posX += velocidad;

    // Si llega al borde derecho o izquierdo, invierte la dirección
    if (posX > width || posX < 0) {
      velocidad *= -1;
    }
  }
}

//Sub clases
class Gato extends Mamifero {
  //Constructor
  Gato(color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c= tempC;
    posX=tempPosX;
    posY = tempPosY;
    velocidad=tempVelocidad;
  }

  void maullar() {
    if (keyPressed == true) {
      if (keyCode == UP) {
        println("El gato maulla");
      }
    }
  }
}

class Perro extends Mamifero {
  //Constructor
  Perro(color tempC, float tempPosX, float tempPosY, float tempVelocidad) {
    c= tempC;
    posX=tempPosX;
    posY = tempPosY;
    velocidad=tempVelocidad;
  }

    void ladrar() {
    if (keyPressed == true) {
      if (keyCode == DOWN) {
        println("El perro ladra");
      }
    }
  }
}

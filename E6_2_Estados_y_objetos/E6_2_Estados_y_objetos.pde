//Laura Andrea Hurtado Acosta
//La bella y la Bestia

// "this" references the Processing sketch
// "super" llama función de la clase padre
//PApplet: Permite usar loadImage, SoundFile, etc., dentro de tus clases personalizadas


// Importa la librería de sonido de Processing
import processing.sound.*;

Cuento momentoActual;//Objeto inicio, climax y final
Portada portada; //objeto portada
boolean enPortada = true;

void setup() {
  size(800, 500);
  colorMode(HSB, 360, 100, 100);

  portada = new Portada(this); // inicia portada
  momentoActual = null;  // no inicia los momentos hasta el clic
}

void draw() {
  background(0);

  // Mostrar la portada o el momento actual de la historia
  if (enPortada) {
    portada.mostrar();
  } else {
    momentoActual.mostrar();
  }
}

//Cambio de escenas inicio, climax, final con presionar teclas a, s, d respectivamente
void keyPressed() {
  if (!enPortada) {
    momentoActual.detenerSonido();

    if (key == 'a' || key == 'A') {
      momentoActual = new Inicio(this);
    } else if (key == 's' || key == 'S') {
      momentoActual = new Climax(this);
    } else if (key == 'd' || key == 'D') {
      momentoActual = new Desenlace(this);
    }
  }
}

//Cambio a portada o iniicar momentos con el clic
void mousePressed() {
  //Si estamos en la portada se inicia el cuento
  if (enPortada) {
    portada.detenerSonido();
    enPortada = false;
    momentoActual = new Inicio(this);
  } else {// si se esta en algun momento vuelve a la portada
    momentoActual.detenerSonido();
    enPortada = true;
    portada = new Portada(this);
    momentoActual = null;
  }
}

// ---------------- CLASES ----------------
//Clase padre
class Cuento {
  PImage img;
  SoundFile sonido;

  void mostrar() {
    image(img, 0, 0, width, height); //Imagen tamaño del canva
  }

  // detener sonido cuando cambia de escena
  void detenerSonido() {
    if (sonido != null && sonido.isPlaying()) {
      sonido.stop();
    }
  }
}

// ---------------- SUB-CLASES ----------------

// ---------------- INICIO ----------------
class Inicio extends Cuento {
  //Efecto puertas abriendose
  float puerta;
  float velocidadPuerta;

  Inicio(PApplet app) {
    img = loadImage("Inicio.png");
    sonido = new SoundFile(app, "puerta.mp3");
    sonido.play();

    puerta = width;
    velocidadPuerta = 5;
  }

  void mostrar() {
    super.mostrar(); // Muestra la imagen de fondo
    //Dibuja la puerta en toda la pantalla
    rectMode(CORNER);
    fill(0);
    rect(0, 0, puerta/2, height);
    rect(width - puerta/2, 0, puerta/2, height);
    //Efecto de abrirse
    if (puerta > 0) {
      puerta -= velocidadPuerta;
    } else { // Se termina de abrir y se encienden la lucecitas
      for (int i = 0; i < 20; i++) {
        float x = random(width);
        float y = random(height);
        fill(50, 100, 100, 80);
        ellipse(x, y, 10 + sin(frameCount * 0.2 + i) * 5, 10 + sin(frameCount * 0.2 + i) * 5);
      }
    }
  }
}

// ---------------- CLIMAX ----------------

class Climax extends Cuento {
  SoundFile trueno; //Sonido extra

  Climax(PApplet app) {
    img = loadImage("Climax.png");
    sonido = new SoundFile(app, "lluvia.mp3");
    trueno = new SoundFile(app, "trueno.mp3");
    //Que se repitan los sonidos
    sonido.loop();
    trueno.loop();
  }

  void mostrar() {
    super.mostrar();
    //Dibujar lineas como lluvia
    for (int i = 0; i < 100; i++) {
      float x = random(width);
      float y = random(height);
      stroke(200, 50, 100);
      line(x, y, x, y + 10);
    }
    // Cada 100 frames ilumina la pantalla simulando un relámpago
    if (frameCount % 100 < 5) {
      rectMode(CORNER);
      fill(0, 0, 100, 50); // Blanco semi-transparente
      rect(0, 0, width, height);
    }
  }

  void detenerSonido() {
    super.detenerSonido();
    if (trueno != null && trueno.isPlaying()) {
      trueno.stop();
    }
  }
}

// ---------------- DESENLACE ----------------
class Desenlace extends Cuento {
  Desenlace(PApplet app) {
    img = loadImage("Final.png");
    sonido = new SoundFile(app, "baile.mp3");
    sonido.play();
  }

  void mostrar() {
    super.mostrar();
    // Fuegos artificiales en la parte superior de la pantalla
    for (int i = 0; i < 10; i++) {
      float x = random(width);
      float y = random(height/2);
      fill(random(360), 80, 100);
      ellipse(x, y, 10, 10);
    }
  }
}
// ---------------- PORTADA ----------------
class Portada {
  PImage img;
  SoundFile intro;

  Portada(PApplet app) {
    img = loadImage("portada.png");
    intro = new SoundFile(app, "intro.mp3");
    intro.play();
  }

  void mostrar() {
    image(img, 0, 0, width, height);

    // Fuegos artificiales en la parte superior
    for (int i = 0; i < 10; i++) {
      float x = random(width);
      float y = random(height/3);
      fill(random(360), 80, 100);
      ellipse(x, y, 10, 10);
    }

    // Cuadro blanco con el texto
    fill(0, 0, 100);
    rectMode(CENTER);
    rect(width/2, height - 80, 400, 60, 10);
    //Texto nombre del cuento
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("La Bella y la Bestia", width/2, height - 80);
  }
  //Cada que se cambia de escena se detiene el sonido
  void detenerSonido() {
    if (intro != null && intro.isPlaying()) {
      intro.stop();
    }
  }
}

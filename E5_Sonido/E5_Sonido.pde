// Laura Andrea Hurtado Acosta
// 202213259
// E5 - Sonido
// Visualización musical de "Mockingbird" - Eminem


//Importar TODO lo del programa que se instaló
import processing.sound.*;

//Transformada de fourier
import processing.sound.FFT;

//  Importar audio
SoundFile soundfile;

// Procesarlo
FFT fft;


int timeLapsed;

// numero de bandas de frecuencia
int bands = 256;
// array para guarda el espectro de neustras frecuencias
float[] spectrum = new float[bands];


// Variables para espiral
int total = 200;
int visibles = 0; // Cuantos circulos aparecen
int velocidad = 10;   // mayor valor = más lento
int contador = 0; // Espera unos frames antes de que aparezca otro
boolean fondoBlancoActivado = false;

// Arrays para almacenar información visual de la espiral
// items can be easily added and removed from the ArrayList and it is resized dynamically.
//Uso el array List para que no se reinicie el backgraund en la parte 3 en cada fotograma
//y queden dibujados los circulos

ArrayList<PVector> puntos = new ArrayList<PVector>();
ArrayList<Float> coloresHue = new ArrayList<Float>();
ArrayList<Float> tamanos = new ArrayList<Float>();

void setup() {
  size(600, 600);
  background(0);



  //Importar audio
  //Sketch + Add file + select audio
  soundfile = new SoundFile(this, "Mockingbird.mp3");


  //Crear el analizador de audio
  fft = new FFT(this, bands);
  //analice la cancion
  fft.input(soundfile);

  //reproducir la cancion
  soundfile.play();
}

void draw() {
  timeLapsed++;
  println(timeLapsed);

  fft.analyze(spectrum);

  // --------- PRIMERA PARTE (Intro suave)------------
  if (timeLapsed < 1417) {
    background(0, 20);

    float level = spectrum[100] * 300;
    // circulos flotantes moviendose en onda
    for (int i = 0; i < width; i += 80) {
      float tam = map(level, 0, 100, 30, 60);
      float offsetY = sin(frameCount * 0.05 + i) * 10;

      noStroke();
      fill(180, 80, 100, 100);
      ellipse(i, height/2 + offsetY, tam, tam);
    }

    //Lineas verticales como un ecualizador
    float spacing = width / (bands - 5.0);
    for (int i = 5; i < bands; i+=10) {
      float h = map(spectrum[i]*50, 0, 0.05, 0, height);
      stroke(300, 80, 100);
      line(i * spacing, height, i * spacing, height - h);
    }
  }

  // --------- SEGUNDA PARTE (empieza a cantar en forma) ----------

  if (timeLapsed >= 1417) {
    // Fondo parpadeo rítmico continuo
    background(0);
  }
  if (!fondoBlancoActivado) {
    fondoBlancoActivado = true; //Esto evita el reinicio del fondo en cada fotograma
  }
  if (timeLapsed >= 1417 && timeLapsed < 5468) {
    // explosión de partículas
    for (int i = 0; i < 100; i++) {
      float angle = random(TWO_PI);
      float r = random(0, 300);
      float x = r * cos(angle);
      float y = r * sin(angle);
      fill(random(0, 360), 100, 100);
      ellipse(width/2 + x, height/2 + y, 4, 4);
    }
  }

  // --------- TERCERA PARTE (el coro) ----------
  if (timeLapsed >= 5468 && timeLapsed < 6783) {

    translate(width / 2, height / 2);

    // Dibujar todos los puntos guardados
    for (int i = 0; i < puntos.size(); i++) { //.size accede al tamaño de la lista
      PVector p = puntos.get(i); // .get para obtener el valor de la posición de la lista
      float hue = coloresHue.get(i);
      float tam = tamanos.get(i);

      fill(hue, 80, 100);
      noStroke();
      ellipse(p.x, p.y, tam, tam); //p. asigna el valor a las variables x - y
    }

    // Agregar un nuevo punto si aún no terminamos
    if (visibles < total) {
      if (contador >= velocidad) {
        float angleStep = TWO_PI / 10;
        float radioStep = 3;

        float angle = visibles * angleStep;
        float radius = visibles * radioStep;

        float x = radius * cos(angle);
        float y = radius * sin(angle);

        float tam = map(visibles, 0, total, 20, 5);
        float hueAzul = map(sin(angle + frameCount * 0.02), -1, 1, 60, 90);

        //Guarda la información en el Array list
        puntos.add(new PVector(x, y)); // .add agregar información a la lista
        coloresHue.add(hueAzul);
        tamanos.add(tam);

        visibles++;
        contador = 0;
      } else {
        contador++;
      }
    }
  }


  // --------- CUARTA PARTE  (Continua el canto fuerte) ----------
  if (timeLapsed >= 6783) {

    if (timeLapsed >= 6783) {
      // explosión de partículas
      for (int i = 0; i < 100; i++) {
        float angle = random(TWO_PI);
        float r = random(0, 300);
        float x = r * cos(angle);
        float y = r * sin(angle);
        fill(random(0, 360), 100, 100);
        ellipse(width/2 + x, height/2 + y, 4, 4);
      }
    }
  }
}

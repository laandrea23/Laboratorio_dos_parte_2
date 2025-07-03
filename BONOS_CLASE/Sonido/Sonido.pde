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

int x=0;
int y=70;
int z = 0;

float radio;

void setup() {
  size(1000, 1000);
  background(255);
  //noStroke();
  //frameRate(1);

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
  //contador
  timeLapsed++;
  
  fft.analyze(spectrum);

  float level = spectrum[50]*100;
  //Número provisional para reemplazarlo por una onda de sonido
  //float numaleatorio = random (0, 1);

  radio = (level * width);

  stroke (random(100), random(80), random(200));
  ellipse(x, y, radio, radio);
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
  z += 10;
  for (int i = 0; i < z; i += 5) {
    stroke(random(100), random(80), random(200));
    line(i, 0, i, height);
  }
}

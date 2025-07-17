//Laura Andrea Hurtado Acosta - 202213259
//Entrega Base de datos
//Base de datos: Plant disease database

Table table;
int nSamples;

float[] temperature;
float[] humidity;

void setup() {
  size(1000, 700);
  table = loadTable("plant_disease_dataset.csv", "header");
  nSamples = table.getRowCount();

  temperature = new float[nSamples];
  humidity = new float[nSamples];

  for (int i = 0; i < nSamples; i++) {
    temperature[i] = table.getFloat(i, "temperature");
    humidity[i] = table.getFloat(i, "humidity");
  }
}

void draw() {
  // Fondo con efecto de amanecer-anochecer
  float t = millis() * 0.0001; // Tiempo en segundos
  float dayCycle = (sin(t) + 1) / 2;

  color amanecer = color(255, 200, 150);
  color dia = color(135, 206, 235);
  color atardecer = color(255, 160, 120);
  color noche = color(20, 30, 60);

  color bg;
  if (dayCycle < 0.5) {
    float f = map(dayCycle, 0, 0.5, 0, 1);
    bg = lerpColor(amanecer, dia, f); // lerpcolor combina colores
  } else {
    float f = map(dayCycle, 0.5, 1, 0, 1);
    bg = lerpColor(atardecer, noche, f);
  }

  background(bg);

  // Márgenes para los ejes
  int margin = 80;

  // Dibujo de los ejes
  stroke(0);
  strokeWeight(2);

  // Eje X (temperatura)
  line(margin, height - margin, width - margin, height - margin);

  // Eje Y (humedad)
  line(margin, height - margin, margin, margin);

  // Etiquetas
  fill(0);
  textSize(20);
  textAlign(CENTER);

  // Etiqueta X
  text("Temperatura", width / 2, height - 40);

  // Etiqueta Y (rotada)
  pushMatrix();
  translate(40, height / 2);
  rotate(-HALF_PI);
  text("Humedad", 0, 0);
  popMatrix();

  // Lectura de los datos para graficar las flores
  for (int i = 0; i < nSamples; i++) {
    float x = map(temperature[i], 0, max(temperature), margin, width - margin);
    float y = map(humidity[i], 0, max(humidity), height - margin, margin);

    float size = 10;
    int petals = 5;
    //Entre menor humedad la planta se ve mas amarilla
    color amarillo = color(255, 255, 0);
    color verde = color(0, 200, 0);

    float humedadNorm = map(humidity[i], 0, 100, 0, 1);
    color c = lerpColor(amarillo, verde, humedadNorm);

    drawFlower(x, y, size, petals, c);
    
    //Función que si se pasa sobre alguna flor se pueda ver los datos 
    //Aunque no se ve muy claro en donde hay muchas flores se puede porbar el las flores mas lejanas
    //muy útil si se quiere identificar los valores
    
    if (dist(mouseX, mouseY, x, y) < 10) {
    fill(0);
    textSize(12);
    textAlign(LEFT);
    //Tipo de concatenado de strings
    text("Temp: " + nf(temperature[i], 1, 1) + "°C\nHum: " + nf(humidity[i], 1, 1) + "%", x + 10, y - 10);
    }
  }
}

// Función para dibujar las flores
void drawFlower(float x, float y, float size, int petals, color c) {
  //guarda el estado actual de coordenadas.
  pushMatrix();
  //cambia el sistema de coordenadas para que puedas dibujar la flor centrada en (x, y)
  translate(x, y);
  fill(c);
  noStroke();

  beginShape();
  // Recorre un círculo completo (0 a 360 grados o 2*PI radianes)
  for (float angle = 0; angle < TWO_PI; angle += 0.05) {
    //generar ondas que forman los pétalos.
    float r = size * (1 + 0.3 * sin(petals * angle));
    // Convierte las coordenadas polares (r, angle) a coordenadas cartesianas (vx, vy)
    float vx = r * cos(angle);
    float vy = r * sin(angle);
    // Dibuja cada punto en la flor.
    vertex(vx, vy);
  }
  endShape(CLOSE);
  //vuelve al sistema de coordenadas original
  popMatrix();
}

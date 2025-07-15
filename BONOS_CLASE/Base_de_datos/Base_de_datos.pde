Table table;
int nSamples;

float[] appUsageTime;
float[] screenOnTime;

void setup() {
  size(1000, 700);
  // Se realiza conteo de las filas sin tomar en cuenta la primera que son los nombres
  table = loadTable("user_behavior_dataset.csv", "header");
  nSamples = table.getRowCount();

  appUsageTime = new float[nSamples];
  screenOnTime = new float[nSamples];

  //appUsageTime[0] = table.getFloat(0, "App Usage Time (min/day)");
  //println(appUsageTime[0]);

  for (int i = 0; i < nSamples; i++) {
    appUsageTime[i] = table.getFloat(i, "App Usage Time (min/day)");
    screenOnTime[i] = table.getFloat(i, "Screen On Time (hours/day)");
    println(" | App Usage: " + appUsageTime[i] + " min/day | Screen On: " + screenOnTime[i] + " hours/day");
  }
}

void draw() {
  background(0);
  for (int i = 0; i < height; i++) {
    stroke(lerpColor(color(20, 20, 50), color(0, 0, 0), float(i)/height));
    line(0, i, width, i);
  }
  //// Ejemplo escalabilidad con map
  //float value = 10;
  //float m = map(value,0,100,0,1000);
  //println(m);

  for (int i = 0; i < nSamples; i++) {
    float x = map(appUsageTime[i], 0, max(appUsageTime), 0, width);
    float y = map(screenOnTime[i], 0, max(screenOnTime), height, 0);

    //función de map tambien aplica para colores
    float colorVal = map(appUsageTime[i], 0, max(appUsageTime), 0, 255);
    fill(colorVal, 100, 255 - colorVal, 180);
    noStroke();
    float size = 12;
    float x1 = x;
    float y1 = y - size / 2;

    float x2 = x - size / 2;
    float y2 = y + size / 2;

    float x3 = x + size / 2;
    float y3 = y + size / 2;

    triangle(x1, y1, x2, y2, x3, y3);
  }
}

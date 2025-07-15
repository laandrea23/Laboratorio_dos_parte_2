Table table;
int nSamples;

float[] appUsageTime;
float[] screenOnTime;

void setup() {
  size(800, 800);
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
  //// Ejemplo escalabilidad con map
  //float value = 10;
  //float m = map(value,0,100,0,1000);
  //println(m);

  for (int i = 0; i < nSamples; i++) {
    float x = map(appUsageTime[i], 0, max(appUsageTime), 0, width);
    float y = map(screenOnTime[i], 0, max(screenOnTime), 0, width);

    ellipse(x, y, 10, 10);
  }
}

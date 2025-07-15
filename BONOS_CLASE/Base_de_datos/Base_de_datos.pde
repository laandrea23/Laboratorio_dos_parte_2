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

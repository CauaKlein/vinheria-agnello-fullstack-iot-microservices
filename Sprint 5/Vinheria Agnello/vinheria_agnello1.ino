// C++ code
//
void setup() {
  Serial.begin(9600);
}

void loop() {
  
  int leituraTemp = analogRead(A0);
  int leituraLuminosidade = analogRead(A1);

  float tensao = leituraTemp * (5.0 / 1023.0);
  float temperatura = (tensao - 0.5) * 100.0;
  int luminosidade = map(leituraLuminosidade, 0, 1023, 0, 100);

  Serial.print("{\"temperatura\":");
  Serial.print(temperatura);
  Serial.print(", \"luminosidade\":");
  Serial.print(luminosidade);
  Serial.println("}");

  delay(4000);
}

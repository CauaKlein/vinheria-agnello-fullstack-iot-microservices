/*
  vinheria_esp32_mqtt_funcional.ino
  ESP32 + NTC + LDR -> publica JSON no test.mosquitto.org
  Ajustado para evitar conflitos de nomes e leituras fora de runtime.
*/

#include <WiFi.h>
#include <PubSubClient.h>
#include <math.h>

// ===== CONFIG =====
const char* WIFI_SSID = "Wokwi-GUEST";
const char* WIFI_PASS = "";

const char* MQTT_BROKER = "test.mosquitto.org";
const uint16_t MQTT_PORT = 1883;

const char* TOPIC_TEMP = "Fiap/iot/3esor/agnello/temperatura";
const char* TOPIC_LUM  = "Fiap/iot/3esor/agnello/luminosidade";

// Pinos (ADC1 recomendados)
const int PIN_NTC = 34;   // termistor (NTC) -> GPIO34
const int PIN_LDR = 32;   // LDR signal -> GPIO32

// NTC params (assumindo NTC 10k @25°C e resistor fixo 10k no divisor)
const float R_FIXED = 10000.0f; // resistor fixo do divisor (10k)
const float BETA = 3950.0f;     // beta (ajuste se seu NTC for diferente)
const float R0 = 10000.0f;      // R0 do NTC (10k @ 25°C)
const float T_REF_K = 298.15f;  // 25°C em Kelvin (evitou o nome T0 conflitante)

// leitura/pub interval
const unsigned long INTERVAL_MS = 4000;
unsigned long lastPublish = 0;

// Wifi + MQTT
WiFiClient  netClient;
PubSubClient mqttClient(netClient);

// ===== utilitários =====
void setupWiFi() {
  Serial.print("WiFi connect to ");
  Serial.println(WIFI_SSID);
  WiFi.begin(WIFI_SSID, WIFI_PASS);
  int tries = 0;
  while (WiFi.status() != WL_CONNECTED && tries < 30) {
    delay(500);
    Serial.print(".");
    tries++;
  }
  Serial.println();
  if (WiFi.status() == WL_CONNECTED) {
    Serial.print("WiFi connected, IP: ");
    Serial.println(WiFi.localIP());
  } else {
    Serial.println("WiFi not connected (simulation may still allow MQTT).");
  }
}

void connectMQTT() {
  if (mqttClient.connected()) return;
  String clientId = "agnello-esp32-";
  clientId += String((uint32_t)esp_random(), HEX);
  if (mqttClient.connect(clientId.c_str())) {
    Serial.println("MQTT connected");
  } else {
    Serial.print("MQTT connect failed, rc=");
    Serial.println(mqttClient.state());
  }
}

// Converte raw ADC (0..4095) do NTC para °C usando Beta model (aproximado)
float ntcRawToCelsius(int raw_adc) {
  if (raw_adc <= 0 || raw_adc >= 4095) return NAN; // proteção

  float r_ntc = R_FIXED * (4095.0f / (float)raw_adc - 1.0f);
  float invT = (1.0f / T_REF_K) + (1.0f / BETA) * log(r_ntc / R0);
  float T = 1.0f / invT; // Kelvin
  float celsius = T - 273.15f;
  return celsius;
}

int readLdrPercent(int pin) {
  int raw = analogRead(pin); // 0..4095
  int pct = map(raw, 0, 4095, 0, 100);
  // Se o comportamento estiver invertido (mais luz -> menor valor), descomente:
  // pct = 100 - pct;
  return pct;
}

void setup() {
  Serial.begin(115200);
  delay(100);
  setupWiFi();
  mqttClient.setServer(MQTT_BROKER, MQTT_PORT);
  Serial.println("Setup done.");
}

void loop() {
  if (WiFi.status() == WL_CONNECTED && !mqttClient.connected()) {
    connectMQTT();
  }
  if (mqttClient.connected()) mqttClient.loop();

  unsigned long now = millis();
  if (now - lastPublish >= INTERVAL_MS) {
    lastPublish = now;

    int raw_ntc = analogRead(PIN_NTC);
    float tempC = ntcRawToCelsius(raw_ntc);
    int lumPct = readLdrPercent(PIN_LDR);
    unsigned long ts = now / 1000UL;

    // payloads JSON
    char payloadTemp[128];
    // usamos "C" em vez de símbolo para evitar problemas de encoding
    snprintf(payloadTemp, sizeof(payloadTemp),
             "{\"valor\":%.2f,\"unidade\":\"C\",\"ts\":%lu}", isnan(tempC) ? 0.0f : tempC, ts);

    char payloadLum[128];
    // para imprimir o caractere % no resultado usamos "%%" no format string
    snprintf(payloadLum, sizeof(payloadLum),
             "{\"valor\":%d,\"unidade\":\"%%\",\"ts\":%lu}", lumPct, ts);

    if (mqttClient.connected()) {
      bool ok1 = mqttClient.publish(TOPIC_TEMP, payloadTemp);
      bool ok2 = mqttClient.publish(TOPIC_LUM, payloadLum);
      Serial.printf("PUB %s -> %s (%s)\n", TOPIC_TEMP, payloadTemp, ok1 ? "ok" : "fail");
      Serial.printf("PUB %s -> %s (%s)\n", TOPIC_LUM, payloadLum, ok2 ? "ok" : "fail");
    } else {
      Serial.println("MQTT not connected -> skipping publish (still printing serial JSON).");
    }

    // Serial combinado (requisito do prof)
    char combined[128];
    snprintf(combined, sizeof(combined),
             "{\"sensor1\":%.2f,\"sensor2\":%d}", isnan(tempC) ? 0.0f : tempC, lumPct);
    Serial.println(combined);

    // DEBUG: opcionalmente mostrar raw ADC (descomente para debugging)
    // Serial.printf("DEBUG raw_ntc=%d raw_ldr=%d\n", raw_ntc, analogRead(PIN_LDR));
  }
}

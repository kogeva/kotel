import 'dart:io';

import 'package:mqtt_client/mqtt_server_client.dart';

class MqttSettings {
  String host;
  int port = 1883;
  String? login;
  String? password;

  MqttSettings(this.host, this.port);
}

class MqttService {
  late MqttServerClient _mqttClient;

  MqttService() {
    _mqttClient = MqttServerClient('127.0.0.1', '');
    _mqttClient.logging(on: true);
    _mqttClient.setProtocolV311();
  }
}
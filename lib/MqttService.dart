import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
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

    _mqttClient.keepAlivePeriod = 20;
    _mqttClient.connectTimeoutPeriod = 2000;

    _mqttClient.onConnected = connected;
    _mqttClient.onDisconnected = disconnected;
  }

  Future<void> connect(Function success, Function(MqttConnectionState reason)? error) async {
    await _mqttClient.connect("kogeva", "kogeva89");
    if (_mqttClient.connectionStatus!.state == MqttConnectionState.connected) {
      success();
    } else {
      error!(_mqttClient.connectionStatus!.state);
      _mqttClient.disconnect();
    }
  }

  void connected() {
  }

  void disconnected() {
  }
}
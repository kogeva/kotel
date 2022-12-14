import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:developer';
import 'dart:convert';

class MqttSettings {
  String host;
  int port = 1883;
  String? login;
  String? password;

  MqttSettings(this.host, this.port);
}

class MqttService {
  late MqttServerClient _mqttClient;
  late Map<String, Function> subscribeCallbacks;

  MqttService() {
    _mqttClient = MqttServerClient('127.0.0.1', '');
    _mqttClient.logging(on: true);
    _mqttClient.setProtocolV311();

    _mqttClient.keepAlivePeriod = 20;
    _mqttClient.connectTimeoutPeriod = 2000;

    _mqttClient.onConnected = connected;
    _mqttClient.onDisconnected = disconnected;


    subscribeCallbacks = <String, Function>{};
  }

  Future<void> connect(Function success, Function(MqttConnectionState reason)? error) async {
    await _mqttClient.connect("kogeva", "kogeva89");
    if (_mqttClient.connectionStatus!.state == MqttConnectionState.connected) {
      success();
    } else {
      error!(_mqttClient.connectionStatus!.state);
      _mqttClient.disconnect();
    }

    _mqttClient.updates!.listen(onMessage);
  }

  void connected() {
  }

  void disconnected() {
  }

  void onMessage(List<MqttReceivedMessage> event) {
    final MqttReceivedMessage message =  event[0];
    final MqttPublishMessage pMessage = message.payload;
    final String strMessage = utf8.decode(pMessage.payload.message);

    Function callback = subscribeCallbacks[message.topic]!;

    callback(message.topic, strMessage);
    // log(message.topic);
    //
    // log(message.toString());
  }

  void addSubscribe(String topic, Function(String topic, String payload) callback )
  {
    _mqttClient.subscribe(topic, MqttQos.atMostOnce);
    
    subscribeCallbacks[topic] = callback;
  }
}
import 'dart:convert';

import 'package:boiler_control/bloc/home_page/home_page_state.dart';
import 'package:boiler_control/data/model/heater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../MqttService.dart';

class HomePageCubit extends Cubit<HomePageState> {
  late MqttService mqttService;
  int counter = 0;
  double roomTemperature = 0.00;

  HomePageCubit() : super(HomePageEmptyState()) {
    mqttService = MqttService();
  }

  void incrementCounter() {
    counter++;
    emit(HomePageMqttState(state.isConnected, counter, null));
  }

  void mqttConnect() {
    mqttService.connect(() {
      state.isConnected = true;
      emit(state);

      mqttService.addSubscribe('kogeva/feeds/info', onHeaterCallback);
    }, (reason) {
      state.isConnected = false;
      emit(state);
    });
  }

  void onHeaterCallback(String topic, String messagePayload) {
    Info heaterInfo = Info.fromJson(jsonDecode(messagePayload));
    state.roomTemperature = heaterInfo.temperature.room;
    emit(HomePageMqttState(true, counter, heaterInfo.temperature.room));
  }
}

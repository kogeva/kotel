import 'package:boiler_control/bloc/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../MqttService.dart';
import 'dart:developer' as developer;

class HomePageCubit extends Cubit<HomePageState> {
  late MqttService mqttService;
  int counter = 0;

  HomePageCubit() : super(HomePageEmptyState()) {
    mqttService = MqttService();
  }

  void incrementCounter() {
    counter++;
    emit(HomePageMqttState(state.isConnected, counter));
  }

  void mqttConnect() {
    mqttService.connect(() {
      state.isConnected = true;
      emit(state);
    }, (reason) {
      state.isConnected = false;
      emit(state);
    });
  }
}

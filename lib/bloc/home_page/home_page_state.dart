import 'package:flutter/foundation.dart';

abstract class HomePageState {
  late int counter;
}

class HomePageEmptyState extends HomePageState {
  HomePageEmptyState() {
    counter = 0;
  }
}

class HomePageCounterState extends HomePageState {
  HomePageCounterState(int counter) {
    this.counter = counter;
  }
}

class HomePageMqttConnectingState extends HomePageState {
  bool isConnected = false;
}

class HomePageMqttConnectedState extends HomePageState {
  bool isConnected = false;
  HomePageMqttConnectedState({required this.isConnected }) : assert(isConnected != false);
}

class HomePageMqttConnectionErrorState extends HomePageState {}
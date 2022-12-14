abstract class HomePageState {
  late bool isConnected;
  late int counter;
  late double roomTemperature;
}

class HomePageEmptyState extends HomePageState {
  HomePageEmptyState() {
    counter = 0;
    isConnected = false;
    roomTemperature = 0.0;
  }
}

class HomePageCounterState extends HomePageEmptyState {
  HomePageCounterState(int counter) {
    this.counter = counter;
  }
}

class HomePageMqttState extends HomePageCounterState {
  HomePageMqttState(bool connected, super.counter, double? roomTemperature) {
    isConnected = connected;
    if(roomTemperature != null) {
      this.roomTemperature = roomTemperature;
    }

  }
}
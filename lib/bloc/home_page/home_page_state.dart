abstract class HomePageState {
  late bool isConnected;
  late int counter;
}

class HomePageEmptyState extends HomePageState {
  HomePageEmptyState() {
    counter = 0;
    isConnected = false;
  }
}

class HomePageCounterState extends HomePageEmptyState {
  HomePageCounterState(int counter) {
    this.counter = counter;
  }
}

class HomePageMqttState extends HomePageCounterState {
  HomePageMqttState(bool connected, super.counter) {
    isConnected = connected;
  }
}
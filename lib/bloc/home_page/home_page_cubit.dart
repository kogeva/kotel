import 'package:boiler_control/bloc/home_page/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../MqttService.dart';

class HomePageCubit extends Cubit<HomePageState> {
  late MqttService mqttService;
  int counter = 0;
  HomePageCubit() : super(HomePageEmptyState());

  void incrementCounter() {
    counter ++ ;
    emit(HomePageCounterState(counter));
  }
}
import 'package:boiler_control/bloc/heater_page/heater_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class HeaterPageCubit extends Cubit<HeaterPageState> {
  HeaterPageCubit() : super(HeaterPageState(0, 0, 0, false,false, false)) {

  }

  void refreshData() {
    developer.log("Cubit entry");
  }
}
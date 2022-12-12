class HeaterPageState {
  final double roomTemperature;
  final double heaterTemperature;
  final double pumpTemperature;

  final bool heaterOneState;
  final bool heaterTwoState;
  final bool heaterThreeState;

  HeaterPageState(
      this.roomTemperature,
      this.heaterTemperature,
      this.pumpTemperature,
      this.heaterOneState,
      this.heaterTwoState,
      this.heaterThreeState);
}
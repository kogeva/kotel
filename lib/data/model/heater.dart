class Info {
  final TemperatureInfo temperature;
  final DateTime dateTime;
  final bool pumpStream;
  final String ipAddress;

  Info(this.temperature, this.dateTime, this.pumpStream, this.ipAddress);

  Info.fromJson(Map<String, dynamic> json)
      : temperature = TemperatureInfo.fromJson(json['temperature']),
        dateTime = DateTime.fromMillisecondsSinceEpoch((json['date_time'] as int) * 1000),
        pumpStream = json['pump']['stream'],
        ipAddress = json['ip_address'];
}

class TemperatureInfo {
  final double room;
  final double boiler;
  final double pump;

  TemperatureInfo(this.room, this.boiler, this.pump);

  TemperatureInfo.fromJson(Map<String, dynamic> json)
      : room = json['room'],
        boiler = json['boiler'],
        pump = json['pump'];
}
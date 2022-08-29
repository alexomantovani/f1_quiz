class ChampionsModel {
  final String driverName;

  ChampionsModel({
    required this.driverName,
  });

  static ChampionsModel fromJson(Map map) {
    return ChampionsModel(
      driverName: map["DriverStandings"][0]["Driver"]["driverId"],
    );
  }
}

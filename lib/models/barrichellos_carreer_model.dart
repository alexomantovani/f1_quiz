class BarrichellosCarreerModel {
  final int racesCount;

  BarrichellosCarreerModel({required this.racesCount});

  static BarrichellosCarreerModel fromJson(Map map) {
    return BarrichellosCarreerModel(
      racesCount: map.length,
    );
  }
}

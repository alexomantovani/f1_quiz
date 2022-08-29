class RaikkonenCarreerModel {
  final int racesCount;

  RaikkonenCarreerModel({required this.racesCount});

  static RaikkonenCarreerModel fromJson(Map map) {
    return RaikkonenCarreerModel(
      racesCount: map.length,
    );
  }
}

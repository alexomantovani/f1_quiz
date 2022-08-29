class SennaMonacoVictoriesModel {
  final String victoriesCount;

  SennaMonacoVictoriesModel({required this.victoriesCount});

  static SennaMonacoVictoriesModel fromJson(Map map) {
    return SennaMonacoVictoriesModel(
      victoriesCount: (map.values.length - 1).toString(),
    );
  }
}

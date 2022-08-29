class MassasFinishedRacesForFerrariModel {
  final String finishedRacesCount;

  MassasFinishedRacesForFerrariModel({required this.finishedRacesCount});

  static MassasFinishedRacesForFerrariModel fromJson(Map map) {
    return MassasFinishedRacesForFerrariModel(
      finishedRacesCount: map["season"],
    );
  }
}

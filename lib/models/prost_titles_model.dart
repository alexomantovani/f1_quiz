class ProstTitlesModel {
  final String constructorName;

  ProstTitlesModel({required this.constructorName});

  static ProstTitlesModel fromJson(Map map) {
    return ProstTitlesModel(
      constructorName: map["DriverStandings"][0]["Constructors"][0]["name"],
    );
  }
}

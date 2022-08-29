class VettelsAgeFirstTitleModel {
  final DateTime dateOfBirth;
  final String season;
  final int age;

  VettelsAgeFirstTitleModel({
    required this.dateOfBirth,
    required this.season,
    required this.age,
  });

  static VettelsAgeFirstTitleModel fromJson(Map map) {
    return VettelsAgeFirstTitleModel(
      dateOfBirth:
          DateTime.parse(map["DriverStandings"][0]["Driver"]["dateOfBirth"]),
      season: map["season"],
      age: int.parse(map["season"]) -
          DateTime.parse(map["DriverStandings"][0]["Driver"]["dateOfBirth"])
              .year,
    );
  }
}

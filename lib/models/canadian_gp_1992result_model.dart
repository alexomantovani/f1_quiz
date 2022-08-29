class CanadianGp1992ResultModel {
  final String driversName;
  final String constructorsName;

  CanadianGp1992ResultModel({
    required this.driversName,
    required this.constructorsName,
  });

  static CanadianGp1992ResultModel fromJson(Map standings) {
    return CanadianGp1992ResultModel(
      driversName:
          '${standings["Driver"]["givenName"]} ${standings["Driver"]["familyName"]}',
      constructorsName: standings["Constructor"]["name"],
    );
  }
}

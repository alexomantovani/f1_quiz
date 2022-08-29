class TwoThousandEightRoundsModel {
  final String circuitName;

  TwoThousandEightRoundsModel({required this.circuitName});

  static TwoThousandEightRoundsModel fromJson(Map map) {
    return TwoThousandEightRoundsModel(circuitName: map["raceName"]);
  }
}

class Finishing1976StatusModel {
  final String status;
  final String circuitName;

  Finishing1976StatusModel({
    required this.status,
    required this.circuitName,
  });

  static Finishing1976StatusModel fromJson(Map map) {
    return Finishing1976StatusModel(
      status: map["Results"][0]["status"],
      circuitName: map["Circuit"]["circuitName"],
    );
  }
}

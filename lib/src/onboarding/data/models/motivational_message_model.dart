class MotivationalMessageModel {
  MotivationalMessageModel({required this.message});

  factory MotivationalMessageModel.fromJson(Map<String, dynamic> json) {
    return MotivationalMessageModel(
      message: json['message'] as String,
    );
  }

  final String message;
}

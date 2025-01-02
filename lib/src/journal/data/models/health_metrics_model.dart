class HealthMetricsModel {
  HealthMetricsModel({
    required this.steps,
    required this.heartRate,
    required this.lastUpdated,
  });

  factory HealthMetricsModel.fromJson(Map<String, dynamic> json) {
    return HealthMetricsModel(
      steps: json['steps'] as int,
      heartRate: json['heartRate'] as int,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );
  }
  final int steps;
  final int heartRate;
  final DateTime lastUpdated;
}

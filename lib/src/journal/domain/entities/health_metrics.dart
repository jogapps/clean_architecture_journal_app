import 'package:equatable/equatable.dart';

class HealthMetrics extends Equatable {
  const HealthMetrics({
    required this.steps,
    required this.heartRate,
    required this.lastUpdated,
  });

  HealthMetrics.empty()
      : this(steps: 1, heartRate: 7, lastUpdated: DateTime.timestamp());

  final int steps;
  final int heartRate;
  final DateTime lastUpdated;

  @override
  List<Object?> get props => [steps, heartRate, lastUpdated];
}

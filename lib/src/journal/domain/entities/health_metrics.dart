import 'package:equatable/equatable.dart';

class HealthMetrics extends Equatable {
  const HealthMetrics({
    required this.steps,
    required this.heartRate,
    required this.lastUpdated,
  });

  final int steps;
  final int heartRate;
  final DateTime lastUpdated;

  @override
  List<Object?> get props => [steps, heartRate, lastUpdated];
}

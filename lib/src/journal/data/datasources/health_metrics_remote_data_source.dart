import 'package:dio/dio.dart';
import 'package:journal_app/src/journal/data/models/health_metrics_model.dart';

class HealthMetricsRemoteDataSource {
  HealthMetricsRemoteDataSource(this.dio);
  final Dio dio;

  Future<HealthMetricsModel> fetchHealthMetrics() async {
    // final response = await apiClient.get(Constants.healthMetricsUrl);
    // return HealthMetricsModel.fromJson(response.data);
    await Future<void>.delayed(const Duration(seconds: 3));
    final response = {
      'steps': 7200,
      'heartRate': 72,
      'lastUpdated': '2024-12-25T10:00:00Z',
    };
    return HealthMetricsModel.fromJson(response);
  }
}

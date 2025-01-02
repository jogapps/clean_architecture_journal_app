import 'package:journal_app/src/journal/domain/entities/health_metrics.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class FetchHealthMetrics {
  FetchHealthMetrics(this.repository);
  final JournalRepository repository;

  Future<HealthMetrics> call() async {
    return repository.fetchHealthMetrics();
  }
}

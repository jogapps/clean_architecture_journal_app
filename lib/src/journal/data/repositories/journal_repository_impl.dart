import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/data/datasources/health_metrics_remote_data_source.dart';
import 'package:journal_app/src/journal/data/datasources/journal_local_data_source.dart';
import 'package:journal_app/src/journal/domain/entities/health_metrics.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';
import 'package:journal_app/src/onboarding/data/datasources/motivational_message_remote_datasource.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';

class JournalRepositoryImpl implements JournalRepository {
  JournalRepositoryImpl({
    required this.motivationalMessageRemoteDataSource,
    required this.healthMetricsRemoteDataSource,
    required this.journalLocalDataSource,
  });

  final MotivationalMessageDataSource motivationalMessageRemoteDataSource;
  final HealthMetricsRemoteDataSource healthMetricsRemoteDataSource;
  final JournalLocalDataSource journalLocalDataSource;

  @override
  Future<Either<String, MotivationalMessage>> fetchMotivationalMessage() async {
    try {
      final result =
          await motivationalMessageRemoteDataSource.fetchMotivationalMessage();
      return Right(result as MotivationalMessage);
    } catch (e) {
      return const Left('Failed to fetch motivational message');
    }
  }

  @override
  Future<HealthMetrics> fetchHealthMetrics() async {
    final metrics = await healthMetricsRemoteDataSource.fetchHealthMetrics();
    return HealthMetrics(
      steps: metrics.steps,
      heartRate: metrics.heartRate,
      lastUpdated: metrics.lastUpdated,
    );
  }

  @override
  Future<Either<String, void>> saveJournalEntry(JournalEntry entry) async {
    try {
      final journalEntryModel = JournalEntry(
        mood: entry.mood,
        date: entry.date,
        content: entry.content,
      );
      await journalLocalDataSource.saveJournalEntry(journalEntryModel);
      return const Right(null);
    } catch (e) {
      return const Left('Failed to save journal entry');
    }
  }

  @override
  Future<Either<String, List<JournalEntry>>> getJournalEntries() async {
    try {
      final result = await journalLocalDataSource.getAllEntries();
      final journalEntries = result
          .map((model) => JournalEntry(
                content: model.content,
                mood: model.mood,
                date: model.date,
              ))
          .toList();
      return Right(journalEntries);
    } catch (e) {
      return const Left('Failed to fetch journal entries');
    }
  }

  @override
  Future<Either<String, void>> deleteJournalEntry(int index) async {
    try {
      await journalLocalDataSource.deleteJournalEntry(index);
      return const Right(null);
    } catch (e) {
      return const Left('Failed to delete journal entry');
    }
  }
}

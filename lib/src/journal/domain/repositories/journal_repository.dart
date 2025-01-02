import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/domain/entities/health_metrics.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';

abstract class JournalRepository {
  /// Fetches a motivational message from the API.
  Future<Either<String, MotivationalMessage>> fetchMotivationalMessage();

  /// Fetches health metrics such as step count and heart rate from the API.
  Future<HealthMetrics> fetchHealthMetrics();

  /// Saves a journal entry locally.
  Future<Either<String, void>> saveJournalEntry(JournalEntry entry);

  /// Retrieves all saved journal entries from local storage.
  Future<Either<String, List<JournalEntry>>> getJournalEntries();

  Future<Either<String, void>> deleteJournalEntry(int index);
}

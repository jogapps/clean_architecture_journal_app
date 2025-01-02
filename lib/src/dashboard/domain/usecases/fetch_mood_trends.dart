import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class FetchMoodTrends {
  FetchMoodTrends(this.repository);
  final JournalRepository repository;

  Future<Either<String, List<JournalEntry>>> call() async {
    final result = await repository.getJournalEntries();
    return result.map((entries) {
      // Assuming entries are already sorted by date, descending
      return entries.take(7).toList(); // Limit to the latest 7 entries
    });
  }
}

import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class FetchMostPositiveEntry {
  FetchMostPositiveEntry(this.repository);
  final JournalRepository repository;

  Future<Either<String, JournalEntry>> call() async {
    final result = await repository.getJournalEntries();
    return result.fold(
      (error) => Left(error),
      (entries) {
        final mostPositive = entries.reduce(
          (current, next) =>
              current.mood.compareTo(next.mood) > 0 ? next : current,
        );
        return Right(mostPositive);
      },
    );
  }
}

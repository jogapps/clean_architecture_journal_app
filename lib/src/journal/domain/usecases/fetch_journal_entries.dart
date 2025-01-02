import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class FetchJournalEntries {
  FetchJournalEntries(this.repository);
  final JournalRepository repository;

  Future<Either<String, List<JournalEntry>>> call() async {
    return repository.getJournalEntries();
  }
}

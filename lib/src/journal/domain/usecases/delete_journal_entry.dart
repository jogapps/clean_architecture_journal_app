import 'package:dartz/dartz.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class DeleteJournalEntry {
  DeleteJournalEntry(this.repository);
  final JournalRepository repository;

  Future<Either<String, void>> call(int index) async {
    return repository.deleteJournalEntry(index);
  }
}

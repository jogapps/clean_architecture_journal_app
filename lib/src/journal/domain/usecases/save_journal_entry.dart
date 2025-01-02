import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';

class SaveJournalEntry {
  SaveJournalEntry(this.repository);
  final JournalRepository repository;

  Future<void> call(JournalEntry entry) async {
    await repository.saveJournalEntry(entry);
  }
}

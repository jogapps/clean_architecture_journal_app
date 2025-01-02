import 'package:hive_flutter/hive_flutter.dart';
import 'package:journal_app/src/journal/data/models/journal_entry_model.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';

class JournalLocalDataSource {
  JournalLocalDataSource(this.journalBox);
  final Box<JournalEntryModel> journalBox;

  Future<void> saveJournalEntry(JournalEntry entry) async {
    final journalEntryModel = JournalEntryModel(
      content: entry.content,
      mood: entry.mood,
      date: entry.date,
    );
    await journalBox.add(journalEntryModel);
  }

  List<JournalEntry> getAllEntries() {
    return journalBox.values
        .map((model) => JournalEntry(
              content: model.content,
              mood: model.mood,
              date: model.date,
            ))
        .toList();
  }

  Future<void> deleteJournalEntry(int index) async {
    await journalBox.deleteAt(index); // Hive's deleteAt deletes by index
  }
}

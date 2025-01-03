import 'package:hive_flutter/hive_flutter.dart';

part 'journal_entry_model.g.dart';

@HiveType(typeId: 0)
class JournalEntryModel {
  JournalEntryModel({
    required this.content,
    required this.mood,
    required this.date,
  });

  @HiveField(0)
  final String content;

  @HiveField(1)
  final String mood;

  @HiveField(2)
  final DateTime date;
}

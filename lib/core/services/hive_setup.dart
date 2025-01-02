import 'package:hive_flutter/adapters.dart';
import 'package:journal_app/core/utils/constants.dart';
import 'package:journal_app/src/journal/data/models/journal_entry_model.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(JournalEntryModelAdapter());

    await Hive.openBox<JournalEntryModel>(Constants.journalBox);
  }
}

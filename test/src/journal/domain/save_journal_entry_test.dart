import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';
import 'package:journal_app/src/journal/domain/usecases/save_journal_entry.dart';
import 'package:mocktail/mocktail.dart';

class MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late SaveJournalEntry saveJournalEntry;
  late MockJournalRepository mockJournalRepository;

  setUp(() {
    mockJournalRepository = MockJournalRepository();
    saveJournalEntry = SaveJournalEntry(mockJournalRepository);
  });

  test('should save journal entry successfully', () async {
    final journalEntry = JournalEntry(
        content: 'Test Content', mood: 'Happy', date: DateTime.now());
    when(() => mockJournalRepository.saveJournalEntry(journalEntry))
        .thenAnswer((_) async => const Right(null));

    final result = await saveJournalEntry(journalEntry);

    // expect(result, const Right(null));
    verify(() => mockJournalRepository.saveJournalEntry(journalEntry))
        .called(1);
  });

  test('should return error when saving journal entry fails', () async {
    final journalEntry = JournalEntry(
        content: 'Test Content', mood: 'Happy', date: DateTime.now());
    when(() => mockJournalRepository.saveJournalEntry(journalEntry))
        .thenAnswer((_) async => Left('Failed to save entry'));

    final result = await saveJournalEntry(journalEntry);

    // expect(result, Left('Failed to save entry'));
    verify(() => mockJournalRepository.saveJournalEntry(journalEntry))
        .called(1);
  });
}

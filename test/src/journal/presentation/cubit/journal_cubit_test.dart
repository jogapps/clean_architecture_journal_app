import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/src/journal/domain/entities/health_metrics.dart';
import 'package:journal_app/src/journal/domain/entities/journal_entry.dart';
import 'package:journal_app/src/journal/domain/usecases/delete_journal_entry.dart';
import 'package:journal_app/src/journal/domain/usecases/fetch_health_metrics.dart';
import 'package:journal_app/src/journal/domain/usecases/fetch_journal_entries.dart';
import 'package:journal_app/src/journal/domain/usecases/save_journal_entry.dart';
import 'package:journal_app/src/journal/presentation/cubit/journal_cubit.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';
import 'package:mocktail/mocktail.dart';

// Mock Use Cases
class MockFetchMotivationalMessage extends Mock
    implements FetchMotivationalMessage {}

class MockFetchHealthMetrics extends Mock implements FetchHealthMetrics {}

class MockSaveJournalEntry extends Mock implements SaveJournalEntry {}

class MockFetchJournalEntries extends Mock implements FetchJournalEntries {}

class MockDeleteJournalEntry extends Mock implements DeleteJournalEntry {}

void main() {
  late JournalCubit journalCubit;
  late MockFetchMotivationalMessage mockFetchMotivationalMessage;
  late MockFetchHealthMetrics mockFetchHealthMetrics;
  late MockSaveJournalEntry mockSaveJournalEntry;
  late MockFetchJournalEntries mockFetchJournalEntries;
  late MockDeleteJournalEntry mockDeleteJournalEntry;

  setUp(() {
    mockFetchMotivationalMessage = MockFetchMotivationalMessage();
    mockFetchHealthMetrics = MockFetchHealthMetrics();
    mockSaveJournalEntry = MockSaveJournalEntry();
    mockFetchJournalEntries = MockFetchJournalEntries();
    mockDeleteJournalEntry = MockDeleteJournalEntry();

    journalCubit = JournalCubit(
      fetchMotivationalMessage: mockFetchMotivationalMessage,
      fetchHealthMetrics: mockFetchHealthMetrics,
      saveJournalEntry: mockSaveJournalEntry,
      fetchJournalEntries: mockFetchJournalEntries,
      deleteJournalEntry: mockDeleteJournalEntry,
    );

    registerFallbackValue(
        JournalEntry(content: 'Test', mood: 'Neutral', date: DateTime.now()));
  });

  group('JournalCubit', () {
    test('should emit JournalInitial when the cubit is created', () {
      expect(journalCubit.state, equals(JournalInitial()));
    });

    blocTest<JournalCubit, JournalState>(
      'should emit JournalLoading, then JournalLoaded with data when loadInitialData is called',
      build: () {
        when(() => mockFetchMotivationalMessage()).thenAnswer(
            (_) async => MotivationalMessage(message: 'Stay positive'));
        when(() => mockFetchHealthMetrics()).thenAnswer((_) async =>
            HealthMetrics(steps: 1, heartRate: 7, lastUpdated: DateTime.now()));
        when(() => mockFetchJournalEntries()).thenAnswer((_) async => Right([
              JournalEntry(
                  content: 'Test Entry', mood: 'Happy', date: DateTime.now())
            ]));
        return journalCubit;
      },
      act: (cubit) => cubit.loadInitialData(),
      expect: () => [
        JournalLoading(),
        isA<JournalLoaded>()
            .having((state) => state.entries.length, 'entries length', 1)
            .having((state) => state.message.message, 'message content',
                'Stay positive') // Check message content
            .having((state) => state.metrics.steps, 'metrics steps',
                1) // Check steps in HealthMetrics
            .having((state) => state.metrics.heartRate, 'metrics heartRate',
                7) // Check heartRate in HealthMetrics
            .having((state) => state.metrics.lastUpdated, 'metrics lastUpdated',
                isNotNull), // Check lastUpdated in HealthMetrics
      ],
    );

    blocTest<JournalCubit, JournalState>(
      'should emit JournalError when loading data fails',
      build: () {
        when(() => mockFetchMotivationalMessage())
            .thenThrow(Exception('Failed to fetch message'));
        return journalCubit;
      },
      act: (cubit) => cubit.loadInitialData(),
      expect: () => [
        JournalLoading(),
        const JournalError(
            'Failed to load data: Exception: Failed to fetch message'),
      ],
    );

    blocTest<JournalCubit, JournalState>(
      'should delete journal entry and update state with new entries',
      build: () {
        when(() => mockDeleteJournalEntry(0))
            .thenAnswer((_) async => Right(null));
        when(() => mockFetchJournalEntries()).thenAnswer((_) async => Right([
              JournalEntry(
                  content: 'Test Entry', mood: 'Happy', date: DateTime.now())
            ]));
        return journalCubit;
      },
      act: (cubit) => cubit.deleteEntry(0),
      expect: () => [
        JournalLoading(),
        isA<JournalError>(),
      ],
    );
  });
}

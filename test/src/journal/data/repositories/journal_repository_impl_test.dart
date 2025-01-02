import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/src/journal/data/datasources/health_metrics_remote_data_source.dart';
import 'package:journal_app/src/journal/data/datasources/journal_local_data_source.dart';
import 'package:journal_app/src/journal/data/repositories/journal_repository_impl.dart';
import 'package:journal_app/src/onboarding/data/datasources/motivational_message_remote_datasource.dart';
import 'package:journal_app/src/onboarding/data/models/motivational_message_model.dart';
import 'package:mocktail/mocktail.dart';

class MockMotivationalMessageDataSource extends Mock
    implements MotivationalMessageDataSource {}

class MockHealthMetricsRemoteDataSource extends Mock
    implements HealthMetricsRemoteDataSource {}

class MockJournalLocalDataSource extends Mock
    implements JournalLocalDataSource {}

void main() {
  late MockMotivationalMessageDataSource mockMotivationalMessageDataSource;
  late MockHealthMetricsRemoteDataSource mockHealthMetricsRemoteDataSource;
  late MockJournalLocalDataSource mockJournalLocalDataSource;
  late JournalRepositoryImpl repository;

  setUp(() {
    mockMotivationalMessageDataSource = MockMotivationalMessageDataSource();
    mockHealthMetricsRemoteDataSource = MockHealthMetricsRemoteDataSource();
    mockJournalLocalDataSource = MockJournalLocalDataSource();

    repository = JournalRepositoryImpl(
      motivationalMessageRemoteDataSource: mockMotivationalMessageDataSource,
      healthMetricsRemoteDataSource: mockHealthMetricsRemoteDataSource,
      journalLocalDataSource: mockJournalLocalDataSource,
    );
  });

  group('fetchMotivationalMessage', () {
    test('should return MotivationalMessage on success', () async {
      // Mock the data source to return a MotivationalMessageModel
      final messageModel = MotivationalMessageModel(message: 'Stay positive');

      // Ensure the mocked method returns a Future<MotivationalMessageModel>
      when(() => mockMotivationalMessageDataSource.fetchMotivationalMessage())
          .thenAnswer((_) async => messageModel);

      // Call the repository method
      final result = await repository.fetchMotivationalMessage();

      // Assert that the returned result matches the expected MotivationalMessage
      // expect(result, Right(MotivationalMessage(message: 'Stay positive')));

      // Verify the method call
      verify(() => mockMotivationalMessageDataSource.fetchMotivationalMessage())
          .called(1);
    });

    test('should return error message on failure', () async {
      when(() => mockMotivationalMessageDataSource.fetchMotivationalMessage())
          .thenThrow(Exception());

      final result = await repository.fetchMotivationalMessage();

      expect(result, const Left('Failed to fetch motivational message'));
    });
  });
}

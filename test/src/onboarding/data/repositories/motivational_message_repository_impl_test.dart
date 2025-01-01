import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/src/onboarding/data/datasources/motivational_message_remote_datasource.dart';
import 'package:journal_app/src/onboarding/data/repositories/motivational_message_repository_impl.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:mocktail/mocktail.dart';

class MockMotivationalMessageDataSource extends Mock
    implements MotivationalMessageDataSource {}

void main() {
  late MotivationalMessageRepositoryImpl repository;
  late MockMotivationalMessageDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockMotivationalMessageDataSource();
    repository = MotivationalMessageRepositoryImpl(mockDataSource);
  });

  test(
      'fetchMotivationalMessage calls data source and returns a valid MotivationalMessage',
      () async {
    when(() => mockDataSource.fetchMotivationalMessage()).thenAnswer(
        (_) async =>
            MotivationalMessage(message: "You're doing great! Keep it up!")
                .call());

    final result = await repository.fetchMotivationalMessage();

    expect(result.message, "You're doing great! Keep it up!");
    verify(() => mockDataSource.fetchMotivationalMessage()).called(1);
  });
}

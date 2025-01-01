import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/repositories/motivational_message_repository.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';
import 'package:mocktail/mocktail.dart';

class MockMotivationalMessageRepository extends Mock
    implements MotivationalMessageRepository {}

void main() {
  late FetchMotivationalMessage useCase;
  late MockMotivationalMessageRepository mockRepository;

  setUp(() {
    mockRepository = MockMotivationalMessageRepository();
    useCase = FetchMotivationalMessage(mockRepository);
  });

  test(
      'FetchMotivationalMessage calls repository and returns a MotivationalMessage',
      () async {
    when(() => mockRepository.fetchMotivationalMessage()).thenAnswer(
        (_) async =>
            MotivationalMessage(message: "You're doing great! Keep it up!"));

    final result = await useCase();

    expect(result.message, "You're doing great! Keep it up!");
    verify(() => mockRepository.fetchMotivationalMessage()).called(1);
  });
}

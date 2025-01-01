import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';
import 'package:journal_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchMotivationalMessage extends Mock
    implements FetchMotivationalMessage {}

void main() {
  late MockFetchMotivationalMessage mockFetchMotivationalMessage;
  late OnBoardingCubit cubit;

  setUp(() {
    mockFetchMotivationalMessage = MockFetchMotivationalMessage();
    cubit = OnBoardingCubit(mockFetchMotivationalMessage);
  });

  blocTest<OnBoardingCubit, OnBoardingState>(
    'emits [OnboardingLoading, OnboardingLoaded] when getMotivationalMessage succeeds',
    build: () {
      // Wrap the return value in a lambda function
      when(() => mockFetchMotivationalMessage.call()).thenAnswer(
        (_) async =>
            MotivationalMessage(message: "You're doing great! Keep it up!"),
      );
      return cubit;
    },
    act: (cubit) => cubit.getMotivationalMessage(),
    expect: () => [
      const OnboardingLoading(),
      OnboardingLoaded(
          MotivationalMessage(message: "You're doing great! Keep it up!")),
    ],
  );

  blocTest<OnBoardingCubit, OnBoardingState>(
    'emits [OnboardingLoading, OnboardingError] when getMotivationalMessage fails',
    build: () {
      // Wrap the return value in a lambda function
      when(() => mockFetchMotivationalMessage.call()).thenThrow(
        Exception('Failed to fetch message'),
      );
      return cubit;
    },
    act: (cubit) => cubit.getMotivationalMessage(),
    expect: () => [
      const OnboardingLoading(),
      const OnboardingError('Failed to fetch motivational message'),
    ],
  );
}

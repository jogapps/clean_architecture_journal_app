import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/core/common/views/loading_views.dart';
import 'package:journal_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:journal_app/src/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingCubit extends Mock implements OnBoardingCubit {}

void main() {
  late MockOnBoardingCubit mockOnBoardingCubit;

  setUp(() {
    // Initialize the mock cubit
    mockOnBoardingCubit = MockOnBoardingCubit();

// Mock the getMotivationalMessage method to return a completed Future
    when(() => mockOnBoardingCubit.getMotivationalMessage())
        .thenAnswer((_) async => null);

    // Mock the state property to return a valid initial state
    when(() => mockOnBoardingCubit.state).thenReturn(OnboardingLoading());
  });

  testWidgets('Displays loading indicator when state is OnboardingLoading',
      (tester) async {
    // Set the cubit to emit OnboardingLoading state
    when(() => mockOnBoardingCubit.stream)
        .thenAnswer((_) => Stream.value(const OnboardingLoading()));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<OnBoardingCubit>.value(
          value: mockOnBoardingCubit,
          child: OnBoardingScreen(),
        ),
      ),
    );

    // Ensure the CircularProgressIndicator is displayed
    expect(find.byType(LoadingView), findsOneWidget);
  });

  testWidgets('Displays error message when state is OnboardingError',
      (tester) async {
    // Set the cubit to emit OnboardingError state
    when(() => mockOnBoardingCubit.stream).thenAnswer(
      (_) => Stream.value(const OnboardingError('An error occurred')),
    );

    await tester.pumpWidget(
      BlocProvider<OnBoardingCubit>.value(
        value: mockOnBoardingCubit,
        child: MaterialApp(
          home: OnBoardingScreen(), // Replace with your actual widget
        ),
      ),
    );

    // Wait for the widget tree to settle after the state change
    await tester.pumpAndSettle();

    // Ensure the error message is displayed
    expect(find.text('An error occurred'), findsOneWidget);
  });
}

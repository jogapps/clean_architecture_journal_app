part of 'on_boarding_cubit.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial();
}

class OnboardingLoading extends OnBoardingState {
  const OnboardingLoading();
}

class OnboardingLoaded extends OnBoardingState {
  const OnboardingLoaded(this.message);

  final MotivationalMessage message;

  @override
  List<Object> get props => [message];
}

class OnboardingError extends OnBoardingState {
  const OnboardingError(this.error);
  final String error;

  @override
  List<String> get props => [error];
}

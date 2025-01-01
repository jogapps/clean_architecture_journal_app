import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(this.fetchMotivationalMessage)
      : super(const OnBoardingInitial());

  final FetchMotivationalMessage fetchMotivationalMessage;

  Future<void> getMotivationalMessage() async {
    emit(const OnboardingLoading());
    try {
      final message = await fetchMotivationalMessage();
      debugPrint('message $message');
      emit(OnboardingLoaded(message));
    } catch (e) {
      debugPrint(e.toString());
      emit(const OnboardingError('Failed to fetch motivational message'));
    }
  }
}

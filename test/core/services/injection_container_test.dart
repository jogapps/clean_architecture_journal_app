import 'package:flutter_test/flutter_test.dart';
import 'package:journal_app/core/services/injection_container.dart';
import 'package:journal_app/src/onboarding/domain/usecases/fetch_motivational_message.dart';
import 'package:journal_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';

void main() {
  setUp(() async {
    await init(); // Initialize dependencies
  });

  test('Dependencies are registered', () {
    expect(sl.isRegistered<FetchMotivationalMessage>(), true);
    expect(sl.isRegistered<OnBoardingCubit>(), true);
  });
}

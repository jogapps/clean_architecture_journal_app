import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';

abstract class MotivationalMessageRepository {
  Future<MotivationalMessage> fetchMotivationalMessage();
}

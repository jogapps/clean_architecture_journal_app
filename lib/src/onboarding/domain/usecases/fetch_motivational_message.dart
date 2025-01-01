import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/repositories/motivational_message_repository.dart';

class FetchMotivationalMessage {
  FetchMotivationalMessage(this.repository);
  final MotivationalMessageRepository repository;

  Future<MotivationalMessage> call() async {
    return await repository.fetchMotivationalMessage();
  }
}

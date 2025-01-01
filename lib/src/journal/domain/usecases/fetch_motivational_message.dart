import 'package:journal_app/src/journal/domain/repositories/journal_repository.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/repositories/motivational_message_repository.dart';

class FetchMotivationalMessage {
  FetchMotivationalMessage(this.repository, this.motivationRepository);
  final JournalRepository repository;
  final MotivationalMessageRepository motivationRepository;

  Future<MotivationalMessage> call() async {
    return await motivationRepository.fetchMotivationalMessage();
  }
}

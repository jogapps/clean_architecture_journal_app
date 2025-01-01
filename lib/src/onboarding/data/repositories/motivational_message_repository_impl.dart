import 'package:journal_app/src/onboarding/data/datasources/motivational_message_remote_datasource.dart';
import 'package:journal_app/src/onboarding/domain/entities/motivational_message.dart';
import 'package:journal_app/src/onboarding/domain/repositories/motivational_message_repository.dart';

class MotivationalMessageRepositoryImpl
    implements MotivationalMessageRepository {
  MotivationalMessageRepositoryImpl(this.dataSource);

  final MotivationalMessageDataSource dataSource;

  @override
  Future<MotivationalMessage> fetchMotivationalMessage() async {
    final model = await dataSource.fetchMotivationalMessage();
    return MotivationalMessage(message: model.message);
  }
}

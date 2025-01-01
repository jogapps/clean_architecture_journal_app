import 'package:dio/dio.dart';
import 'package:journal_app/src/onboarding/data/models/motivational_message_model.dart';

abstract class MotivationalMessageDataSource {
  Future<MotivationalMessageModel> fetchMotivationalMessage();
}

class MotivationalMessageDataSourceImpl
    implements MotivationalMessageDataSource {
  MotivationalMessageDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<MotivationalMessageModel> fetchMotivationalMessage() async {
    // Simulate API response
    // final response = await dioClient.get(Constants.motivationalMessageUrl);
    // return MotivationalMessageModel.fromJson(response.data);
    await Future<void>.delayed(const Duration(seconds: 3));
    final response = {'message': "You're doing great! Keep it up!"};
    return MotivationalMessageModel.fromJson(response);
  }
}

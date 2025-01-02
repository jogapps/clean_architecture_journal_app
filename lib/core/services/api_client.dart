import 'package:dio/dio.dart';

class ApiClient {
  ApiClient(this.dio);
  final Dio dio;

  Future<Response> get(String url) async {
    return await dio.get(url);
  }
}

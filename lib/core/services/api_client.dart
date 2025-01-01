import 'package:dio/dio.dart';

// class ApiClient {
//   ApiClient(this.dio);
//   final Dio dio;
//
//   Future<Response> get(String url) async {
//     return await dio.get(url);
//   }
// }

class DioClient {
  static Dio get rawClient => Dio();

  static Dio request() {
    Dio dio = Dio();
    return dio;
  }
}

final dioClient = DioClient.request();

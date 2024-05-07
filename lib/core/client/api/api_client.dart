import 'package:dio/dio.dart';

class AppApiClient {
  Dio appDio() {
    final Dio dio = Dio(
      BaseOptions(baseUrl: 'https://blockchain.info'),
    );
    return dio;
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      response = await appDio().get(url);
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
    return response;
  }
}

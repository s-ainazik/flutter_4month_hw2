import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<String> fetchCatImageUrl() async {
    try {
      // images/search добавляется к baseUrl
      final response = await _dio.get('images/search');

      if (response.statusCode == 200) {
        final List data = response.data;
        return data[0]['url'];
      }
      throw Exception('Не удалось загрузить котика');
    } catch (e) {
      throw Exception('Ошибка сети: $e');
    }
  }
}

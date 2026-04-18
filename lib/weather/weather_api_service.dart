import 'package:dio/dio.dart';
import 'package:hw2/weather/weather_model.dart';
import 'package:hw2/weather/weather_params.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.open-meteo.com/v1/"));

  Future<WeatherModel> getWeather(WeatherParams params) async {
    final Response response = await _dio.get(
      "forecast ",
      queryParameters: params.toJson(),
    );
    return WeatherModel.fromJson(response.data);
  }
}

//   Future<String> getCatImage() async {
//     final Response response = await _dio.get(
//       "https://api.thecatapi.com/v1/images/search",
//     );
//     final String img = response.data[0]['url'];
//     return img;
//   }

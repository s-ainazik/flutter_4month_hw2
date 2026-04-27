import 'package:dio/dio.dart';
import 'package:hw2/weather/country_model.dart';
import 'package:hw2/weather/weather_model.dart';
import 'package:hw2/weather/weather_params.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ""));
  ApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<List<CountryModel>> searchCountries(String nameCountry) async {
    final Response response = await _dio.get(
      "https://nominatim.openstreetmap.org/search",
      options: Options(headers: {"User-Agent": "weather_app"}),
      queryParameters: {"q": nameCountry, "format": 'json'},
    );
    List<CountryModel> list = [];
    response.data.forEach((country) {
      list.add(CountryModel.fromJson(country));
    });
    return list;
  }

  Future<WeatherModel> getWeather(WeatherParams params) async {
    final Response response = await _dio.get(
      "https://api.open-meteo.com/v1/forecast",
      queryParameters: params.toJson(),
    );
    return WeatherModel.fromJson(response.data);
  }
}
//"https://nominatim.openstreetmap.org/search?q=New York&format=json
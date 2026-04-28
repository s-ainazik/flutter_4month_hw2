import 'package:equatable/equatable.dart';
import 'package:hw2/models/weather_model.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class LoadingWeatherState extends WeatherState {}

final class LoadedWeatherState extends WeatherState {
  const LoadedWeatherState({required this.weatherModel});

  final WeatherModel weatherModel;

   @override
  List<Object> get props => [weatherModel];
}

final class ErrorWeatherState extends WeatherState {}

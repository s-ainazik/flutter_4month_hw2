import 'package:equatable/equatable.dart';
import 'package:hw2/weather/weather_params.dart';

sealed class WeatherEvent extends Equatable{
  const WeatherEvent();
}

final class LoadWeatherEvent extends WeatherEvent{
 const LoadWeatherEvent({required this.params});

 final WeatherParams params;
 
  @override
  List<Object?> get props =>[params];

 }
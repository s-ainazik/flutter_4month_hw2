import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/weather/bloc/weather_event.dart';
import 'package:hw2/weather/bloc/weather_state.dart';
import 'package:hw2/apiServices/weather_api_service.dart';
import 'package:hw2/models/weather_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final ApiService apiService = ApiService();
  WeatherBloc() : super (WeatherInitial()){
    on<LoadWeatherEvent>((event,emit)async{
      try{
        emit(LoadingWeatherState());
        final WeatherModel weather  = await apiService.getWeather(event.params);
        emit  (LoadedWeatherState(weatherModel: weather));
      }catch(e,s){
        final Talker talker = Talker();
        talker.handle(e,s);
        print (e);
        print(s);
        emit (ErrorWeatherState());
      };
    });
  }
}


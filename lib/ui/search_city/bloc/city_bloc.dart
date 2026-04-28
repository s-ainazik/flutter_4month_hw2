import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/ui/search_city/bloc/city_event.dart';
import 'package:hw2/ui/search_city/bloc/city_state.dart';
import 'package:hw2/apiServices/weather_api_service.dart';
import 'package:hw2/weather/weather_main.dart';


class CityBloc extends Bloc<CityEvent, CityState> {
  final apiService = ApiService();

  CityBloc() : super(CityInitial()) {
    on<SearchCityEvent>(_searchCountry);
  }

  Future<void> _searchCountry(
    SearchCityEvent event,
    Emitter<CityState> emit,
  ) async {
    try {
      emit(LoadingCityState());
      
      final cityModel = await apiService.searchCountries(event.nameCountry);
      emit(LoadedCityState(cityModel));
    } catch (e, s) {
      talker.handle;
      (e, s);
      emit(ErrorCityState());
    }
  }
}
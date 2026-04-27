import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/weather/search_city/settings/settingsBloc/theme_event.dart';
import 'package:hw2/weather/search_city/settings/settingsBloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>{
  ThemeBloc():super(ThemeInitial()){
    on<ChangeThemeEvent>((event,emit){
      emit(GetValueThemeState(value: event.value));
    });
  }
}
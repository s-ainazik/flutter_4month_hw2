import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/weather/bloc/weather_bloc.dart';
import 'package:hw2/weather/bloc/weather_event.dart';
import 'package:hw2/weather/bloc/weather_state.dart';
import 'package:hw2/weather/weather_params.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.weatherParams});
  final WeatherParams weatherParams;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherBloc _weatherBloc = WeatherBloc();

  @override
  void initState() {
    _weatherBloc.add(
      LoadWeatherEvent(
        params: widget.weatherParams
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: _weatherBloc,
          builder: (context, state) {
            if (state is LoadingWeatherState) {
              return CircularProgressIndicator();
            }
            if (state is LoadedWeatherState) {
              return Text(
                "${state.weatherModel.tem.temperature} ${state.weatherModel.temUnit.temperature}",
                style: TextStyle(fontSize: 50),
              );
            }
            if (state is ErrorWeatherState) {
              return Text("Ошибка");
            }
            return Text('Flutter 03');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        final Talker talker = Talker();
        talker.info("CLICK");
      }) ,
    );
  }
}

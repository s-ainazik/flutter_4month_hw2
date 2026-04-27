import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/router/app_router.dart';
import 'package:hw2/weather/search_city/bloc/city_bloc.dart';
import 'package:hw2/weather/search_city/bloc/city_event.dart';
import 'package:hw2/weather/search_city/bloc/city_state.dart';
import 'package:hw2/weather/weather_page.dart';
import 'package:hw2/weather/weather_params.dart';

@RoutePage()
class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  final CityBloc cityBloc = CityBloc();

  @override
  void initState() {
    cityBloc.add(SearchCityEvent(nameCountry: "A"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            context.router.push(SettingsRoute());
          }, icon: Icon(Icons.settings))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TextField(
              style: TextStyle(fontSize: 50),
              onChanged: (value) {
                cityBloc.add(SearchCityEvent(nameCountry: value));
              },
            ),
          ),
          BlocBuilder(
            bloc: cityBloc,
            builder: (context, state) {
              if (state is LoadedCityState) {
                return SliverList.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final double lat = double.parse(state.list[index].lat);
                        final double lon = double.parse(state.list[index].lon);
                        context.router.push(
                          WeatherRoute(
                            weatherParams: WeatherParams(
                              latitude: lat,
                              longitude: lon,
                              currentWeather: true,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            "${state.list[index].name}",
                            style: TextStyle(fontSize: 50),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "${state.list[index].displayName}",
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                );
              }
              if (state is ErrorCityState) {
                return SliverToBoxAdapter(child: Text("Flutter 04"));
              }
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hw2/weather/search_city/search_city_page.dart';
import 'package:hw2/weather/search_city/settings/settings_page.dart';
import 'package:hw2/weather/weather_page.dart';
import 'package:hw2/weather/weather_params.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()

class AppRouter extends RootStackRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SearchCityRoute.page, initial: true),
    AutoRoute(page: WeatherRoute.page),
    AutoRoute(page: SettingsRoute.page)


  ];
}
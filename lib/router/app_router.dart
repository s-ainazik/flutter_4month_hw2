import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hw2/ui/createPost/create_post_page.dart';
import 'package:hw2/ui/postDetail/post_detail_page.dart';
import 'package:hw2/ui/postList/posts_list_page.dart';
import 'package:hw2/ui/search_city/search_city_page.dart';
import 'package:hw2/ui/search_city/settings/settings_page.dart';
import 'package:hw2/ui/weather_page.dart';
import 'package:hw2/weather/weather_params.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SearchCityRoute.page),
    AutoRoute(page: WeatherRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: CreatePostRoute.page),
    AutoRoute(page: PostsListRoute.page, initial: true),
    AutoRoute(page: PostDetailRoute.page), 
    
  ];
  
  
}
 
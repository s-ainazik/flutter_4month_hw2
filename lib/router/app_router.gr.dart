// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [SearchCityPage]
class SearchCityRoute extends PageRouteInfo<void> {
  const SearchCityRoute({List<PageRouteInfo>? children})
    : super(SearchCityRoute.name, initialChildren: children);

  static const String name = 'SearchCityRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchCityPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [WeatherPage]
class WeatherRoute extends PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    Key? key,
    required WeatherParams weatherParams,
    List<PageRouteInfo>? children,
  }) : super(
         WeatherRoute.name,
         args: WeatherRouteArgs(key: key, weatherParams: weatherParams),
         initialChildren: children,
       );

  static const String name = 'WeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherRouteArgs>();
      return WeatherPage(key: args.key, weatherParams: args.weatherParams);
    },
  );
}

class WeatherRouteArgs {
  const WeatherRouteArgs({this.key, required this.weatherParams});

  final Key? key;

  final WeatherParams weatherParams;

  @override
  String toString() {
    return 'WeatherRouteArgs{key: $key, weatherParams: $weatherParams}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeatherRouteArgs) return false;
    return key == other.key && weatherParams == other.weatherParams;
  }

  @override
  int get hashCode => key.hashCode ^ weatherParams.hashCode;
}

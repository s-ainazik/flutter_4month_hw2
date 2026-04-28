// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CreatePostPage]
class CreatePostRoute extends PageRouteInfo<CreatePostRouteArgs> {
  CreatePostRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        CreatePostRoute.name,
        args: CreatePostRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'CreatePostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreatePostRouteArgs>(
        orElse: () => const CreatePostRouteArgs(),
      );
      return CreatePostPage(key: args.key);
    },
  );
}

class CreatePostRouteArgs {
  const CreatePostRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreatePostRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreatePostRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [PostDetailPage]
class PostDetailRoute extends PageRouteInfo<PostDetailRouteArgs> {
  PostDetailRoute({Key? key, required int id, List<PageRouteInfo>? children})
    : super(
        PostDetailRoute.name,
        args: PostDetailRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'PostDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostDetailRouteArgs>();
      return PostDetailPage(key: args.key, id: args.id);
    },
  );
}

class PostDetailRouteArgs {
  const PostDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'PostDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PostDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [PostsListPage]
class PostsListRoute extends PageRouteInfo<void> {
  const PostsListRoute({List<PageRouteInfo>? children})
    : super(PostsListRoute.name, initialChildren: children);

  static const String name = 'PostsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostsListPage();
    },
  );
}

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

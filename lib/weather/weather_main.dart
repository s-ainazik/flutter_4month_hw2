import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/router/app_router.dart';
import 'package:hw2/ui/search_city/settings/settingsBloc/theme_bloc.dart';
import 'package:hw2/ui/search_city/settings/settingsBloc/theme_state.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  runApp(MyApp());
}

final talker = Talker();

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          bool isDark = false;
          if (state is GetValueThemeState) {
            isDark = state.value;
          }
          return MaterialApp.router(
            routerConfig: _appRouter.config(),
            theme: isDark ? ThemeData.dark() : ThemeData.light(),
          );
        },
      ),
    );
  }
}

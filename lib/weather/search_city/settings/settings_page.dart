import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/weather/search_city/settings/settingsBloc/theme_bloc.dart';
import 'package:hw2/weather/search_city/settings/settingsBloc/theme_event.dart';
import 'package:hw2/weather/search_city/settings/settingsBloc/theme_state.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Тема'),
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    bool isDark = false;
                    if (state is GetValueThemeState) {
                      isDark = state.value;
                    }
                    return Switch(
                      value: isDark,
                      onChanged: (value) {
                        themeBloc.add(ChangeThemeEvent(value: value));
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_service.dart';
import 'bloc/cat_bloc.dart';
import 'bloc/cat_event.dart';
import 'cat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat API homework',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RepositoryProvider(
        create: (context) => ApiService(),
        child: BlocProvider(
          create: (context) =>
              CatBloc(context.read<ApiService>())..add(LoadCatEvent()),
          child: const CatPage(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'api_service.dart';
import 'bloc/cat_bloc.dart';
import 'cat_page.dart';

void main() {
  final apiService = ApiService();
  final catBloc = CatBloc(apiService);

  runApp(MyApp(catBloc: catBloc));
}

class MyApp extends StatelessWidget {
  final CatBloc catBloc;
  const MyApp({super.key, required this.catBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats',
      home: CatPage(catBloc: catBloc),
    );
  }
}
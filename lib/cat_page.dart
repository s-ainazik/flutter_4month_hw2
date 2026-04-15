import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cat_bloc.dart';
import 'bloc/cat_event.dart';
import 'bloc/cat_state.dart';

class CatPage extends StatelessWidget {
  final CatBloc catBloc;
  const CatPage({super.key, required this.catBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cats')),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          bloc: catBloc,
          builder: (context, state) {
            if (state is CatLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is CatLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(state.imageUrl),
              );
            }
            if (state is CatErrorState) {
      
              return Text('Ошибка!');
            }
            
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => catBloc.add(LoadCatEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
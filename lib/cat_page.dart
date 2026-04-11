import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cat_bloc.dart';
import 'bloc/cat_event.dart';
import 'bloc/cat_state.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cats')),
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          builder: (context, state) {
            if (state is CatLoadingState) {
              return const CircularProgressIndicator(); // крутилку
            }
            if (state is CatLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(state.imageUrl), // картинку
              );
            }
            if (state is CatErrorState) {
              return Text('Ошибка: ${state.message}'); // ошибку
            }
            // Это состояние Initial, когда еще ничего не загрузилось
            return ElevatedButton(
              onPressed: () => context.read<CatBloc>().add(LoadCatEvent()),
              child: const Text('Загрузить котика'),
            );
          },
        ),
      ),
      // Кнопка обновления кота, вызывает ивент
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CatBloc>().add(LoadCatEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

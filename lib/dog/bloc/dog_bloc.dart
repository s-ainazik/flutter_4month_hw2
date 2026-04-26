import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/dog/dog_model.dart';
import 'dog_event.dart';
import 'dog_state.dart';
import '../dog_api_service.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final ApiService apiService = ApiService();

  DogBloc() : super(DogInitialState()) {
    on<GetDogsEvent>((event, emit) async {
      try {
        emit(DogLoadingState());
        List<DogModel> listDogs = await apiService.getDogImages();

        emit(DogLoadedState(listDogs));
      } catch (error, _stackTrace) {
        emit(DogErrorState('Не удалось загрузить список собак'));
      }
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:hw2/dog/dog_model.dart';

sealed class DogState extends Equatable {
  const DogState();
  @override
  List<Object> get props => [];
}

final class DogInitialState extends DogState {}

final class DogLoadingState extends DogState {}

final class DogLoadedState extends DogState {
  const DogLoadedState(this.listDogs);
  final List<DogModel> listDogs;

  @override
  List<Object> get props => [listDogs];
}

class DogErrorState extends DogState {
  final String message;
  const DogErrorState(this.message);

  @override
  List<Object> get props => [message];
}

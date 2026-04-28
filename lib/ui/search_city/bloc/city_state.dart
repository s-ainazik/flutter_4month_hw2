import 'package:equatable/equatable.dart';
import 'package:hw2/models/country_model.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object?> get props => [];
}

final class CityInitial extends CityState {}

final class LoadingCityState extends CityState {}

final class LoadedCityState extends CityState {
  const LoadedCityState(this.list);

  final List<CountryModel> list;
  
  @override
  List<Object?> get props => [list];
}

final class ErrorCityState extends CityState {}

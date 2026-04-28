import 'package:equatable/equatable.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();
}

final class SearchCityEvent extends CityEvent {
  const SearchCityEvent({required this.nameCountry});
  final String nameCountry;

  @override
  List<Object?> get props => [nameCountry];
}

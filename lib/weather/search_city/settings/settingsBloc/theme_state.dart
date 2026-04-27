import 'package:equatable/equatable.dart';

sealed class ThemeState extends Equatable{
  const ThemeState();
}

final class ThemeInitial extends ThemeState{
  @override
  List<Object?> get props => [];

}

final class GetValueThemeState extends ThemeState{
  GetValueThemeState({required this.value});
  final bool value;
  @override
  List<Object?> get props =>[];

}
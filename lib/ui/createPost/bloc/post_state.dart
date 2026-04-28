import 'package:equatable/equatable.dart';
import 'package:hw2/models/post_response_model.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

final class LoadingPostState extends PostState {}

final class SuccessCreatedState extends PostState {
  const SuccessCreatedState(this.postResponseModel);
  final PostResponseModel postResponseModel;
  @override
  List<Object?> get props => [postResponseModel];
}

final class ErrorPostState extends PostState {}

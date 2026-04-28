import 'package:equatable/equatable.dart';
import 'package:hw2/models/post_response_model.dart';

sealed class PostDetailState extends Equatable {
  const PostDetailState();
  @override
  List<Object?> get props => [];
}

final class PostDetailInitial extends PostDetailState {}

final class PostDetailLoading extends PostDetailState {}

final class PostDetailLoaded extends PostDetailState {
  final PostResponseModel post;
  const PostDetailLoaded(this.post);
  @override
  List<Object?> get props => [post];
}

final class PostDetailDeleteSuccess extends PostDetailState {}

final class PostDetailError extends PostDetailState {}
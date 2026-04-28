import 'package:equatable/equatable.dart';
import 'package:hw2/models/post_response_model.dart';

sealed class PostsListState extends Equatable {
  const PostsListState();
  @override
  List<Object?> get props => [];
}

final class PostsListInitial extends PostsListState {}

final class PostsListLoading extends PostsListState {}

final class PostsListLoaded extends PostsListState {
  final List<PostResponseModel> posts;
  const PostsListLoaded(this.posts);
  @override
  List<Object?> get props => [posts];
}

final class PostsListError extends PostsListState {}
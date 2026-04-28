import 'package:equatable/equatable.dart';

sealed class PostsListEvent extends Equatable {
  const PostsListEvent();
}

final class FetchPostsEvent extends PostsListEvent {
  @override
  List<Object?> get props => [];
}
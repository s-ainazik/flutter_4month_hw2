import 'package:equatable/equatable.dart';
import 'package:hw2/models/post_response_model.dart';

sealed class PostEvent extends Equatable{
  const PostEvent();
}

final class CreatePostEvent extends PostEvent{
  const CreatePostEvent ({required this.createPost});

  final PostResponseModel createPost;

  @override
  List<Object?> get props => [createPost];
}
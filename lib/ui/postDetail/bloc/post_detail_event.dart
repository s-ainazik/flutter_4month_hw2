import 'package:equatable/equatable.dart';

sealed class PostDetailEvent extends Equatable {
  const PostDetailEvent();
}

final class FetchPostDetailEvent extends PostDetailEvent {
  final int id;
  const FetchPostDetailEvent(this.id);
  @override
  List<Object?> get props => [id];
}

final class DeletePostEvent extends PostDetailEvent {
  final int id;
  const DeletePostEvent(this.id);
  @override
  List<Object?> get props => [id];
}
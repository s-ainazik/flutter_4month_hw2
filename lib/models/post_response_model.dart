import 'package:equatable/equatable.dart';

class PostResponseModel extends Equatable {
  const PostResponseModel({
    required this.userId,
    this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int? id;
  final String title;
  final String body;

  factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'title': title, 'body': body};
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}

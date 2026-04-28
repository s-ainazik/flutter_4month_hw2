import 'package:dio/dio.dart';
import 'package:hw2/models/post_response_model.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class PostsApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"),
  );
  PostsApiService() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  Future<PostResponseModel> createPost(PostResponseModel createPost) async {
    final Response response = await _dio.post(
      '/posts',
      data: createPost.toJson(),
    );
    return PostResponseModel.fromJson(response.data);
  }

  Future<List<PostResponseModel>> getPosts() async {
    final Response response = await _dio.get('/posts');
    final List data = response.data;
    return data.map((json) => PostResponseModel.fromJson(json)).toList();
  }

  Future<PostResponseModel> getPostById(int id) async {
    final Response response = await _dio.get('/posts/$id');
    return PostResponseModel.fromJson(response.data);
  }

  Future<void> deletePost(int id) async {
    await _dio.delete('/posts/$id');
  }
}

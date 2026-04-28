import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/apiServices/posts_api_service.dart';
import 'package:hw2/ui/postDetail/bloc/post_detail_event.dart';
import 'package:hw2/ui/postDetail/bloc/post_detail_state.dart';
import 'package:hw2/weather/weather_main.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostsApiService _apiService = PostsApiService();

  PostDetailBloc() : super(PostDetailInitial()) {
    on<FetchPostDetailEvent>(_fetchPost);
    on<DeletePostEvent>(_deletePost);
  }

  Future<void> _fetchPost(FetchPostDetailEvent event, Emitter emit) async {
    try {
      emit(PostDetailLoading());
      final post = await _apiService.getPostById(event.id);
      emit(PostDetailLoaded(post));
    } catch (e, s) {
      talker.error("Ошибка загрузки поста", e, s);
      emit(PostDetailError());
    }
  }

  Future<void> _deletePost(DeletePostEvent event, Emitter emit) async {
    try {
      await _apiService.deletePost(event.id);
      emit(PostDetailDeleteSuccess());
    } catch (e, s) {
      talker.error("Ошибка удаления", e, s);
      emit(PostDetailError());
    }
  }
}
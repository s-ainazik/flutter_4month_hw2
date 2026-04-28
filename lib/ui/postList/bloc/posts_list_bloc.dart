import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/apiServices/posts_api_service.dart';
import 'package:hw2/ui/postList/bloc/posts_list_event.dart';
import 'package:hw2/ui/postList/bloc/posts_list_state.dart';
import 'package:hw2/weather/weather_main.dart';

class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  final PostsApiService _apiService = PostsApiService();

  PostsListBloc() : super(PostsListInitial()) {
    on<FetchPostsEvent>(_fetchPosts);
  }

  Future<void> _fetchPosts(FetchPostsEvent event, Emitter emit) async {
    try {
      emit(PostsListLoading());
      final posts = await _apiService.getPosts();
      emit(PostsListLoaded(posts));
    } catch (e, s) {
      talker.error("Ошибка загрузки списка", e, s);
      emit(PostsListError());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/apiServices/posts_api_service.dart';
import 'package:hw2/models/post_response_model.dart';
import 'package:hw2/ui/createPost/bloc/post_event.dart';
import 'package:hw2/ui/createPost/bloc/post_state.dart';
import 'package:hw2/weather/weather_main.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsApiService _apiService = PostsApiService();
  PostBloc() : super(PostInitial()) {
    on<CreatePostEvent>(_createPost);
  }

  Future<void> _createPost(CreatePostEvent event, Emitter emit) async {
    try {
      emit(LoadingPostState());
      final PostResponseModel response = await _apiService.createPost(
        event.createPost,
      );
      emit(SuccessCreatedState(response));
    } catch (e, s) {
      talker.error("Ошибка при создании", e, s);
      emit(ErrorPostState());
    }
  }
}

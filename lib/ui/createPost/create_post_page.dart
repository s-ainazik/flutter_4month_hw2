import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/models/post_response_model.dart';
import 'package:hw2/ui/createPost/bloc/post_bloc.dart';
import 'package:hw2/ui/createPost/bloc/post_event.dart';
import 'package:hw2/ui/createPost/bloc/post_state.dart';

@RoutePage()
class CreatePostPage extends StatelessWidget {
  CreatePostPage({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  // УБРАЛИ: final PostBloc _postBloc = PostBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hint: Text('Title')),
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(hint: Text('Body')),
            ),
            TextField(
              controller: _userIdController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hint: Text('_userId')),
            ),

            // Обернули твой BlocConsumer
            BlocProvider(
              create: (context) => PostBloc(),
              child: BlocConsumer<PostBloc, PostState>(
                // УБРАЛИ: bloc: _postBloc,
                listener: (context, state) {
                  if (state is SuccessCreatedState) {
                    _bodyController.clear();
                    _userIdController.clear();
                    _titleController.clear();
                  }
                  if (state is ErrorPostState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Error'),
                        duration: const Duration(seconds: 1),
                        action: SnackBarAction(label: 'Undo', onPressed: () {}),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  final bool isLoading = state is LoadingPostState;
                  return ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            // Читаем блок из контекста вместо переменной _postBloc
                            context.read<PostBloc>().add(
                              CreatePostEvent(
                                createPost: PostResponseModel(
                                  userId: int.parse(_userIdController.text),
                                  title: _titleController.text,
                                  body: _bodyController.text,
                                ),
                              ),
                            );
                          },
                    child: Text(isLoading ? 'Loading' : 'Save'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
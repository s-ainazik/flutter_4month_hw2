import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/ui/postDetail/bloc/post_detail_bloc.dart';
import 'package:hw2/ui/postDetail/bloc/post_detail_event.dart';
import 'package:hw2/ui/postDetail/bloc/post_detail_state.dart';

@RoutePage()
class PostDetailPage extends StatelessWidget {
  final int id;
  const PostDetailPage({super.key, required this.id});

  // УБРАЛИ: final PostDetailBloc _postDetailBloc = PostDetailBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали поста')),
      // Обернули твой BlocConsumer в BlocProvider
      body: BlocProvider(
        create: (context) => PostDetailBloc()..add(FetchPostDetailEvent(id)),
        child: BlocConsumer<PostDetailBloc, PostDetailState>(
          // УБРАЛИ: bloc: _postDetailBloc..add(FetchPostDetailEvent(id)),
          listener: (context, state) {
            if (state is PostDetailDeleteSuccess) {
              Navigator.pop(context); // Твой код остался на месте
            }
            if (state is PostDetailError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ошибка')),
              );
            }
          },
          builder: (context, state) {
            if (state is PostDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PostDetailLoaded) {
              final post = state.post;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${post.id}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('User ID: ${post.userId}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(post.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text(post.body, style: const TextStyle(fontSize: 16)),
                    const Spacer(),
                    ElevatedButton(
                      // Передаем bloc в метод, чтобы он был доступен в диалоге
                      onPressed: () => _showDeleteDialog(context, context.read<PostDetailBloc>()),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Удалить'),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  // Добавили второй параметр: PostDetailBloc bloc
  void _showDeleteDialog(BuildContext context, PostDetailBloc bloc) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить пост?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Отмена')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              bloc.add(DeletePostEvent(id)); // Вызываем event через переданный bloc
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
  }
}
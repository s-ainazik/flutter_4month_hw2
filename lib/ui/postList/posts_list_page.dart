import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw2/ui/postList/bloc/posts_list_bloc.dart';
import 'package:hw2/ui/postList/bloc/posts_list_event.dart';
import 'package:hw2/ui/postList/bloc/posts_list_state.dart';
import 'package:hw2/router/app_router.dart'; 

@RoutePage()
class PostsListPage extends StatelessWidget {
  const PostsListPage({super.key}); // Добавил const

  // УБРАЛИ: final PostsListBloc _postsListBloc = PostsListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Посты')),
      // Обернули твой BlocConsumer в BlocProvider
      body: BlocProvider(
        create: (context) => PostsListBloc()..add(FetchPostsEvent()),
        child: BlocConsumer<PostsListBloc, PostsListState>(
          // УБРАЛИ: bloc: _postsListBloc..add(FetchPostsEvent()),
          listener: (context, state) {
            if (state is PostsListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ошибка загрузки')),
              );
            }
          },
          builder: (context, state) {
            if (state is PostsListLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PostsListLoaded) {
              final posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text('User ID: ${post.userId}'),
                    onTap: () {
                      context.router.push(PostDetailRoute(id: post.id!));
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
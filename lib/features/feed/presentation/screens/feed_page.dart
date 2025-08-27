import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_event.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_state.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    context.read<FeedBloc>().add(FetchPostsRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
        ),
        body: BlocBuilder<FeedBloc, FeedState>(builder: (context, state) {
          if (state is FeedLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FeedLoaded) {
            final posts = state.posts;
            if (posts.isEmpty) {
              return const Center(
                child: Text('No posts founds'),
              );
            }
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.username),
                    subtitle: Text(post.content),
                    trailing: Text(
                      post.createdAt
                          .toLocal()
                          .toIso8601String()
                          .substring(0, 10),
                    ),
                  );
                });
          } else if (state is FeedFailure) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return SizedBox.shrink();
        }));
  }
}

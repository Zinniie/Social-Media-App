import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/feed/data/repository/mock_posts_repository.dart';
import 'package:social_media_app/features/feed/domain/usecases/create_posts_use_case.dart';
import 'package:social_media_app/features/feed/presentation/bloc/post/create_post_bloc.dart';
import 'package:social_media_app/features/feed/presentation/bloc/post/create_post_event.dart';
import 'package:social_media_app/features/feed/presentation/bloc/post/create_post_state.dart';

void main() {
  group('FeedBloc test', () {
    late CreatePostBloc feedBloc;
   late CreatePostBloc createPostBlocWithError;

    setUp(() {
      feedBloc = CreatePostBloc(
          createPostUseCase: CreatePostUseCase(
        postRepository: MockPostsRepository(),
      ));
      createPostBlocWithError = CreatePostBloc(
          createPostUseCase: CreatePostUseCase(
        postRepository: MockPostsWithErrorRepository(),
      ));
    });
    blocTest(
      'emit [CreatePostLoading, CreatePostSuccess] when post is created succesffully',
      build: () => feedBloc,
      act: (bloc) => bloc.add(
        CreatePostRequested(username: 'ezinne', content: 'software engineer', userId: '1234', imageUrl: '',),
      ),
      expect: () => [CreatePostLoading(), isA<CreatePostSuccess>()],
    );

    blocTest(
      'emit [CreatePostLoading, CreatePostFailure] when loaded posted failed',
      build: () => createPostBlocWithError,
      act: (bloc) => bloc.add(
    CreatePostRequested(
          username: 'ezinne',
          content: 'software engineer',
          userId: '1234',
          imageUrl: '',
        ),
      ),
      expect: () => [CreatePostLoading(), isA<CreatePostFailure>()],
    );
  });
}

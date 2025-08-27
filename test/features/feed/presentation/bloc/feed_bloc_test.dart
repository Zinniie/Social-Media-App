import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:social_media_app/features/feed/domain/usecases/fetch_posts_use_case.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_event.dart';
import 'package:social_media_app/features/feed/presentation/bloc/feed_state.dart';

import '../../data/repository/mock_posts_repository.dart';

void main() {
  group('FeedBloc test', () {
    late FeedBloc feedBloc;
     late FeedBloc feedBlocWithError;
    setUp(() {
     
      feedBloc = FeedBloc(
          fetchPostsUseCase: FetchPostsUseCase(
        postRepository: MockPostsRepository(),
      ));
       feedBlocWithError = FeedBloc(
          fetchPostsUseCase: FetchPostsUseCase(
        postRepository: MockPostsWithErrorRepository(),
      ));
    });
    blocTest(
      'emit [FeedLoading, FeedSuccess] when posts are fetched succesffully',
      build: () => feedBloc,
      act: (bloc) => bloc.add(
        FetchPostsRequested(),
      ),
      expect: () => [FeedLoading(), isA<FeedLoaded>()],
    );

     blocTest(
      'emit [FeedLoading, FeedFailure] when loaded posted failed',
      build: () => feedBlocWithError,
      act: (bloc) => bloc.add(
        FetchPostsRequested(),
      ),
      expect: () => [FeedLoading(), isA<FeedFailure>()],
    );
  });
}

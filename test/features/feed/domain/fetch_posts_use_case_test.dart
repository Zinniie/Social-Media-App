import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/feed/domain/entities/post_entity.dart';
import 'package:social_media_app/features/feed/domain/usecases/fetch_posts_use_case.dart';

void main() {
  group('FetchFeedUseCase test', () {
    test('Should return list of posts', () async {
      FetchPostsUseCase fetchPostsUseCase = FetchPostsUseCase();
      final result = await fetchPostsUseCase.call();

      expect(result, isA<List<PostEntity>>());
      expect(result.length, greaterThan(0));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/feed/data/repository/mock_posts_repository.dart';
import 'package:social_media_app/features/feed/domain/usecases/create_posts_use_case.dart';

void main() {
  group('CreatePostUseCase', () {
    test('Should create a post successfully', () async {
      String userId = '1234';
      String username = 'ezinne';
      String content = 'versatile software engineer';
      String imageUrl = '';

      MockPostsRepository mockPostsRepository = MockPostsRepository();
      CreatePostUseCase createPostUseCase =
          CreatePostUseCase(postRepository: mockPostsRepository);

      final result = await createPostUseCase.call(
          userId: userId,
          username: username,
          content: content,
          imageUrl: imageUrl);

      expect(result, isTrue);
    });
  });
}

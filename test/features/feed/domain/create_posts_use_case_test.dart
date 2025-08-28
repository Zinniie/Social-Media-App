import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/features/feed/data/repository/mock_posts_repository.dart';
import 'package:social_media_app/features/feed/domain/usecases/create_posts_use_case.dart';

void main() {
  group('CreatePostUseCase', () {
    late MockPostsRepository mockPostsRepository;
    late MockPostsWithErrorRepository mockPostsWithErrorRepository;
    //  late FetchPostsUseCase fetchPostsUseCase;
    setUp(() {
      mockPostsRepository = MockPostsRepository();
      mockPostsWithErrorRepository = MockPostsWithErrorRepository();
    });
    test('Should create a post successfully', () async {
      String userId = '1234';
      String username = 'ezinne';
      String content = 'versatile software engineer';
      String imageUrl = '';

      CreatePostUseCase createPostUseCase =
          CreatePostUseCase(postRepository: mockPostsRepository);

      final result = await createPostUseCase.call(
          userId: userId,
          username: username,
          content: content,
          imageUrl: imageUrl);

      expect(result, isTrue);
    });

    test('Should return an error if username or content are empty', () async {
      String userId = '1234';
      String username = '';
      String content = '';
      String imageUrl = '';

      CreatePostUseCase createPostUseCase =
          CreatePostUseCase(postRepository: mockPostsRepository);

      expect(
          () async => await createPostUseCase.call(
              userId: userId,
              username: username,
              content: content,
              imageUrl: imageUrl),
          throwsA(isA<Exception>));
    });

     test('Should return an exception if there is an error with the repo', () async {
      String userId = '1234';
     String username = 'ezinne';
      String content = 'versatile software engineer';
      String imageUrl = '';
      CreatePostUseCase createPostUseCase =
          CreatePostUseCase(postRepository: mockPostsWithErrorRepository);

      expect(
          () async => await createPostUseCase.call(
              userId: userId,
              username: username,
              content: content,
              imageUrl: imageUrl),
          throwsA(isA<Exception>));
    });
  });
}

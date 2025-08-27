import 'package:social_media_app/features/feed/domain/entities/post_entity.dart';
import 'package:social_media_app/features/feed/domain/repository/post_repository.dart';

class MockPostsRepository implements PostRepository {
  @override
  Future<List<PostEntity>> fetchPosts() async {
    return [
      PostEntity(
          userId: '123',
          username: 'ezinne',
          content: 'Big Zee',
          createdAt: DateTime.now()),
        
    ];
  }
}

class MockPostsWithErrorRepository implements PostRepository {
  @override
  Future<List<PostEntity>> fetchPosts() {
    throw Exception('Something broke');
  }
}

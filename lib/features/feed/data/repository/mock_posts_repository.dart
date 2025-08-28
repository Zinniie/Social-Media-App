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
           PostEntity(
          userId: '124',
          username: 'zinne',
          content: 'Software Dev',
          createdAt: DateTime.now()),
           PostEntity(
          userId: '125',
          username: 'zinny',
          content: 'Process Automation',
          createdAt: DateTime.now()),
           PostEntity(
          userId: '126',
          username: 'Zee',
          content: 'Goalgetter',
          createdAt: DateTime.now()),
    ];
  }
    @override
  Future<bool> createPost({required PostEntity post}) async {
    return true;
  }
}

class MockPostsWithErrorRepository implements PostRepository {
  @override
  Future<List<PostEntity>> fetchPosts() {
    throw Exception('Something broke');
  }
    @override
  Future<bool> createPost({required PostEntity post}) async {
    throw Exception('Something broke');
  }
}

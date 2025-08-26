import 'package:social_media_app/features/feed/domain/entities/post_entity.dart';

class FetchPostsUseCase {
  Future<List<PostEntity>> call() async {
    return [
      PostEntity(
        userId: '123',
        username: 'ezinne',
        content: 'Big Zee',
        createdAt: DateTime.now(),
      ),
    ];
  }
}

import 'package:social_media_app/features/feed/domain/entities/post_entity.dart';
import 'package:social_media_app/features/feed/domain/repository/post_repository.dart';

class FetchPostsUseCase {
  final PostRepository postRepository;

  FetchPostsUseCase({required this.postRepository});

  Future<List<PostEntity>> call() async {
    final result = postRepository.fetchPosts();
    return result;
  
  }
}

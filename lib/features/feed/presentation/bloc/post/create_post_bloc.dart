import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/utils.dart';
import 'package:social_media_app/features/feed/domain/usecases/create_posts_use_case.dart';
import 'package:social_media_app/features/feed/presentation/bloc/post/create_post_event.dart';
import 'package:social_media_app/features/feed/presentation/bloc/post/create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostUseCase createPostUseCase;

  CreatePostBloc({required this.createPostUseCase})
      : super(CreatePostInitial()) {
    on<CreatePostRequested>(_createPostRequested);
  }
  _createPostRequested(
      CreatePostRequested event, Emitter<CreatePostState> emit) async {
    emit(CreatePostLoading());
    try {
      await createPostUseCase.call(
        userId: event.userId,
        username: event.username,
        content: event.content,
        imageUrl: event.imageUrl,
      );

      emit(CreatePostSuccess());
    } catch (e) {
      emit(CreatePostFailure(message: formatError(e)));
    }
  }
}

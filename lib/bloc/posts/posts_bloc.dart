import 'package:bloc/bloc.dart';
import 'package:bloc_classes/model/posts_model.dart';
import 'package:bloc_classes/repository/post_repository.dart';
import 'package:bloc_classes/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(const PostsState()) {
    on<PostFetched>(_fetchPostApi);
  }

  void _fetchPostApi(PostFetched event, Emitter<PostsState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          status: PostStatus.success, postList: value, message: "sucess"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          status: PostStatus.success, message: error.toString()));
    });
  }
}

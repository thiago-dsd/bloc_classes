import 'package:bloc/bloc.dart';
import 'package:bloc_classes/model/posts_model.dart';
import 'package:bloc_classes/repository/post_repository.dart';
import 'package:bloc_classes/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostModel> temPostList = [];
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(const PostsState()) {
    on<PostFetched>(_fetchPostApi);
    on<SearchItem>(_searchItem);
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

  void _searchItem(SearchItem event, Emitter<PostsState> emit) async {
    if (event.strSearch.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMessage: ""));
    } else {
      // temPostList = state.postList
      //     .where((element) => element.id.toString() == event.strSearch)
      //     .toList();
      temPostList = state.postList
          .where((element) => element.email
              .toString()
              .toLowerCase()
              .contains(event.strSearch.toLowerCase()))
          .toList();

      if (temPostList.isEmpty) {
        emit(state.copyWith(
            temPostList: temPostList, searchMessage: "No data found"));
      } else {
        emit(state.copyWith(temPostList: temPostList));
      }
    }
  }
}

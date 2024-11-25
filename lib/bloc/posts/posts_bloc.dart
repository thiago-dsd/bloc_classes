import 'package:bloc/bloc.dart';
import 'package:bloc_classes/model/posts_model.dart';
import 'package:bloc_classes/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostFetched>((event, emit) {});
  }
}

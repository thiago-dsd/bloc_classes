part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostsState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.message = ""});

  PostsState copyWith(
      {PostStatus? status, List<PostModel>? postList, String? message}) {
    return PostsState(
        postStatus: status ?? postStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [postStatus, postList, message];
}

part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  final String searchMessage;

  const PostsState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.temPostList = const <PostModel>[],
      this.message = "",
      this.searchMessage = ""});

  PostsState copyWith(
      {PostStatus? status,
      List<PostModel>? postList,
      List<PostModel>? temPostList,
      String? message,
      String? searchMessage}) {
    return PostsState(
        postStatus: status ?? postStatus,
        postList: postList ?? this.postList,
        temPostList: temPostList ?? this.temPostList,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  List<Object> get props => [postStatus, postList, message, temPostList];
}

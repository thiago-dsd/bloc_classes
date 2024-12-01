part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class PostFetched extends PostsEvent {}

class SearchItem extends PostsEvent {
  final String strSearch;

  const SearchItem(this.strSearch);
}

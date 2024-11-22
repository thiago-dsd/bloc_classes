part of 'favourite_app_bloc.dart';

sealed class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class FavoriteItem extends FavouriteAppEvent {
  final FavouriteItemModel item;

  const FavoriteItem({required this.item});
}

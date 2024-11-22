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

class SelectedItem extends FavouriteAppEvent {
  final FavouriteItemModel item;

  const SelectedItem({required this.item});
}

class UnSelectedItem extends FavouriteAppEvent {
  final FavouriteItemModel item;

  const UnSelectedItem({required this.item});
}

class DelteItem extends FavouriteAppEvent {}

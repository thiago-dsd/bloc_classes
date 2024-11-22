part of 'favourite_app_bloc.dart';

enum ListStatus { loading, sucess, failure }

class FavouriteAppState extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temporaryFavouriteItemList;

  const FavouriteAppState(
      {this.listStatus = ListStatus.loading,
      this.favouriteItemList = const [],
      this.temporaryFavouriteItemList = const []});

  FavouriteAppState copyWith(
      {ListStatus? listStatus,
      List<FavouriteItemModel>? favouriteItemList,
      List<FavouriteItemModel>? temporaryFavouriteItemList}) {
    return FavouriteAppState(
      listStatus: listStatus ?? this.listStatus,
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      temporaryFavouriteItemList:
          temporaryFavouriteItemList ?? this.temporaryFavouriteItemList,
    );
  }

  @override
  List<Object> get props =>
      [listStatus, favouriteItemList, temporaryFavouriteItemList];
}

part of 'favourite_app_bloc.dart';

enum ListStatus { loading, sucess, failure }

class FavouriteAppState extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteItemModel> favouriteItemList;

  const FavouriteAppState(
      {this.listStatus = ListStatus.loading, this.favouriteItemList = const []});

  FavouriteAppState copyWith(
      {ListStatus? listStatus, List<FavouriteItemModel>? favouriteItemList}) {
    return FavouriteAppState(
        listStatus: listStatus ?? this.listStatus,
        favouriteItemList: favouriteItemList ?? this.favouriteItemList);
  }

  @override
  List<Object> get props => [listStatus, favouriteItemList];
}

final class FavouriteAppInitial extends FavouriteAppState {}

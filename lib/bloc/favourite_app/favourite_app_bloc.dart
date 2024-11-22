import 'package:bloc/bloc.dart';
import 'package:bloc_classes/model/favourite_item_model.dart';
import 'package:bloc_classes/repository/favourite_repository.dart';
import 'package:equatable/equatable.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  List<FavouriteItemModel> favouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteAppBloc(this.favouriteRepository)
      : super(const FavouriteAppState()) {
    on<FetchFavouriteList>(_fetchFavouriteList);
    on<FavoriteItem>(_favoriteItem);
  }

  void _fetchFavouriteList(
      FetchFavouriteList event, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.sucess));
  }

  void _favoriteItem(
      FavoriteItem event, Emitter<FavouriteAppState> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }
}

import 'package:bloc/bloc.dart';
import 'package:bloc_classes/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteAppBloc() : super(FavouriteAppInitial()) {
    on<FavouriteAppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

part of 'favourite_app_bloc.dart';

sealed class FavouriteAppState extends Equatable {
  const FavouriteAppState();
  
  @override
  List<Object> get props => [];
}

final class FavouriteAppInitial extends FavouriteAppState {}

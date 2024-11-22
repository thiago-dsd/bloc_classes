import 'package:bloc_classes/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_classes/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.sucess:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      final FavouriteItemModel currentItem =
                          state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          title: Text(currentItem.value),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel favouriteItemModel =
                                  FavouriteItemModel(
                                      id: currentItem.id,
                                      value: currentItem.value,
                                      isFavourite: currentItem.isFavourite
                                          ? false
                                          : true);
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(FavoriteItem(item: favouriteItemModel));
                            },
                            icon: Icon(currentItem.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline),
                          ),
                        ),
                      );
                    });
              case ListStatus.failure:
                return const Text("Something went wrong.");
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

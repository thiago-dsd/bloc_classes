import 'package:bloc_classes/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_classes/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_classes/bloc/images/images_bloc.dart';
import 'package:bloc_classes/bloc/posts/posts_bloc.dart';
import 'package:bloc_classes/bloc/switch/switch_bloc.dart';
import 'package:bloc_classes/bloc/todo/todo_bloc.dart';
import 'package:bloc_classes/repository/favourite_repository.dart';
import 'package:bloc_classes/ui/images/images_screen.dart';
import 'package:bloc_classes/ui/login/login_screen.dart';
import 'package:bloc_classes/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwitchBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (_) => TodoBloc(),
        ),
        BlocProvider(
          create: (_) => FavouriteAppBloc(FavouriteRepository()),
        ),
        BlocProvider(
          create: (_) => PostsBloc(),
        ),
        BlocProvider(
          create: (_) => ImagesBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const ImagesScreen(),
      ),
    );
  }
}

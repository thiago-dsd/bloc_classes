import 'package:bloc_classes/bloc/images/images_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  void initState() {
    // context.read<ImagesBloc>().add((GetImages()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random images"),
      ),
      floatingActionButton: IconButton(
          onPressed: () async {
            context.read<ImagesBloc>().add((GetImages()));
          },
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          )),
      body: BlocBuilder<ImagesBloc, ImagesState>(
        builder: (context, state) {
          return Visibility(
            visible: state.images.isNotEmpty,
            child: Column(
              children: [
                Text(
                  state.images[0].title.toString(),
                ),
                Text(
                  state.message,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

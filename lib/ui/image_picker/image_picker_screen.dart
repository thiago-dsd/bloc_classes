import 'dart:io';
import 'package:bloc_classes/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return state.file == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.photo_camera,
                          size: 40,
                        ),
                        onPressed: () => context
                            .read<ImagePickerBloc>()
                            .add(CameraCapture()),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.image_search,
                          size: 40,
                        ),
                        onPressed: () => context
                            .read<ImagePickerBloc>()
                            .add(GalleryImagePicker()),
                      )
                    ],
                  )
                : Image.file(File(state.file!.path));
          },
        ),
      ),
    );
  }
}

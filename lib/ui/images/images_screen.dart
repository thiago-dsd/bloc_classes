import 'package:flutter/material.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random images"),
      ),
      floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          )),
      body: Center(
        child: Image.network("https://via.placeholder.com/600/24f355"),
      ),
    );
  }
}

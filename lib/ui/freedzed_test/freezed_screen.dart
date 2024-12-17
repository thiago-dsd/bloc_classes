import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_classes/bloc/counter/counter_bloc.dart';
import 'package:bloc_classes/bloc/counter/counter_event.dart';
import 'package:bloc_classes/bloc/counter/counter_state.dart';

class FreezedScreen extends StatefulWidget {
  const FreezedScreen({super.key});

  @override
  State<FreezedScreen> createState() => _FreezedScreenState();
}

class _FreezedScreenState extends State<FreezedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Freezed example"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        PersonModel personModel = PersonModel("Thiago");
        PersonModel personModel1 = PersonModel("Thiago");
        print(personModel == personModel1);
      }),
      body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: []),
    );
  }
}

class PersonModel {
  String? name;

  PersonModel(this.name);
}

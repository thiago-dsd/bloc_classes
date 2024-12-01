import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_classes/bloc/counter/counter_bloc.dart';
import 'package:bloc_classes/bloc/counter/counter_event.dart';
import 'package:bloc_classes/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter example"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Center(
                    child: Text(
                      state.counter.toString(),
                      style: const TextStyle(fontSize: 60),
                    ),
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementCounter());
                          },
                          child: const Text("Increment"));
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementCounter());
                          },
                          child: const Text("Decrement"));
                    },
                  )
                ],
              )
            ]),
      ),
    );
  }
}

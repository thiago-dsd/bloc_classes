import 'package:bloc_classes/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.list.isEmpty) {
            return const Center(child: Text("No todo item"));
          } else if (state.list.isNotEmpty) {
            return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final String currentTask = state.list[index]!;
                  return ListTile(
                    title: Text(currentTask),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<TodoBloc>()
                              .add(RemoveTodoEvent(task: currentTask));
                        },
                        icon: const Icon(Icons.delete)),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context
                .read<TodoBloc>()
                .add(AddTodoEvent(task: "Task ${i.toString()}"));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final String task;

  const AddTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final String task;

  const RemoveTodoEvent({required this.task});

  @override
  List<Object> get props => [];
}

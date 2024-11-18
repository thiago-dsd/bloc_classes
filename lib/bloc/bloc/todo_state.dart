part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String?> list;

  const TodoState({this.list = const []});

  TodoState copyWith({List<String>? list}) {
    return TodoState(list: list ?? this.list);
  }

  @override
  List<Object> get props => [list];
}

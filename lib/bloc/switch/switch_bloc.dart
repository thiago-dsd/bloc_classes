import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial()) {
    on<SwitchEvent>((event, emit) {
      on<EnableOrDisableNotification>(_enableOrDisableNotification);
    });
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}

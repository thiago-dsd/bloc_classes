import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(const ImagesState()) {
    on<GetImages>(_getImages);
  }

  void _getImages(GetImages event, Emitter<ImagesState> emit) {
    // emit(state.copyWith(images: event.images));
  }
}

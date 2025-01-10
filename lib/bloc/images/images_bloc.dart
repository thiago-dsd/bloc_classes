import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_classes/model/image_model.dart';
import 'package:bloc_classes/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesBloc() : super(const ImagesState()) {
    on<GetImages>(_getImages);
  }

  void _getImages(GetImages event, Emitter<ImagesState> emit) async {
    emit(state.copyWith(imageStatus: ImagesStatus.loading));
    await http
        .post(Uri.parse("https://jsonplaceholder.typicode.com/photos"))
        .then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        final body = json.decode(value.body) as List;
        var aux = body.map((e) {
          return ImageModel(
            albumId: e["albumId"] as int,
            id: e["id"] as int,
            title: e["title"] as String,
            url: e["url"] as String,
            thumbnailUrl: e["thumbnailUrl"] as String,
          );
        }).toList();
        emit(state.copyWith(
            imageStatus: ImagesStatus.success,
            message: "Login sucessful.",
            images: aux));
      } else {
        log("não deu 200");
        log("deu ${value.statusCode}");
      }
    }).catchError((e, stackTrace) {
      emit(state.copyWith(
          imageStatus: ImagesStatus.failure,
          message: "Request error, ${e.toString()}",
          images: []));
      log("catched  error");
      log(e.toString());
    });
  }
}

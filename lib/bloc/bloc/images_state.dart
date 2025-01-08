part of 'images_bloc.dart';

class ImagesState extends Equatable {
  final List<String> images;

  const ImagesState({this.images = const []});

  ImagesState copyWith({List<String>? images}) {
    return ImagesState(images: images ?? this.images);
  }

  @override
  List<Object> get props => [images];
}

part of 'images_bloc.dart';

class ImagesState extends Equatable {
  final List<ImageModel> images;
  final String message;
  final ImagesStatus imageStatus;

  const ImagesState(
      {this.images = const [],
      this.message = "",
      this.imageStatus = ImagesStatus.initial});

  ImagesState copyWith(
      {List<ImageModel>? images, String? message, ImagesStatus? imageStatus}) {
    return ImagesState(
        images: images ?? this.images,
        message: message ?? this.message,
        imageStatus: imageStatus ?? this.imageStatus);
  }

  @override
  List<Object> get props => [images, message, imageStatus];
}

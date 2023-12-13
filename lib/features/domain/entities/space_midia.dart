import 'package:equatable/equatable.dart';

class SpaceMedia extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String mediaUrl;

  SpaceMedia(
      {required this.description,
      required this.mediaType,
      required this.title,
      required this.mediaUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [description, mediaType, title, mediaType];
}

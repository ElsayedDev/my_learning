import 'package:flutter/material.dart';

abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
}

class File extends StatelessWidget implements IFile {
  final String title;
  final IconData icon;

  @protected
  final int size;

  const File({
    super.key,
    required this.title,
    required this.size,
    required this.icon,
  });

  @override
  int getSize() => size;

  @override
  Widget render(BuildContext context) => ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text('$size bytes'),
      );

  @override
  Widget build(BuildContext context) => render(context);
}

class AudioFile extends File {
  const AudioFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.music_note);
}

class ImageFile extends File {
  const ImageFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.image);
}

class TextFile extends File {
  const TextFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.description);
}

class VideoFile extends File {
  const VideoFile({
    super.key,
    required super.title,
    required super.size,
  }) : super(icon: Icons.movie);
}

abstract class IFile {
  int getSize();
  void render();
  String accept(IVisitor visitor);
}

abstract class FileWidget implements IFile {
  final String title;
  final String fileExtension;
  final int size;

  FileWidget(this.title, this.fileExtension, this.size);

  @override
  int getSize() {
    return size;
  }

  @override
  void render() {
    print("Rendering $title");
  }
}

class TextFile extends FileWidget {
  TextFile(String title, String fileExtension, int size)
      : super(title, fileExtension, size);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitTextFile(this);
  }
}

class AudioFile extends FileWidget {
  AudioFile(String title, String fileExtension, int size)
      : super(title, fileExtension, size);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitAudioFile(this);
  }
}

class VideoFile extends FileWidget {
  VideoFile(String title, String fileExtension, int size)
      : super(title, fileExtension, size);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitVideoFile(this);
  }
}

abstract class IVisitor {
  String getTitle();
  String visitAudioFile(AudioFile file);
  String visitTextFile(TextFile file);
  String visitVideoFile(VideoFile file);
}

class HumanReadableVisitor implements IVisitor {
  @override
  String getTitle() => "Human Readable Visitor";

  @override
  String visitAudioFile(AudioFile file) {
    final fileInfo = <String, String>{
      'Type': 'Audio',
      'Album': "",
      'Extension': file.fileExtension,
      'Size': "",
    };

    return _formatFile(file.title, fileInfo);
  }

  @override
  String visitTextFile(TextFile file) {
    // TODO: implement visitTextFile
    throw UnimplementedError();
  }

  @override
  String visitVideoFile(VideoFile file) {
    // TODO: implement visitVideoFile
    throw UnimplementedError();
  }

  String _formatFile(String title, Map<String, String> fileInfo) {
    final buffer = StringBuffer();

    buffer.write('$title:\n');

    for (final entry in fileInfo.entries) {
      buffer.write('${entry.key}: ${entry.value}');
    }

    return buffer.toString();
  }
}

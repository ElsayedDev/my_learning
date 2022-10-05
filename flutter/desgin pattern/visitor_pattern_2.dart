abstract class IFIle {
  void doThis(IDoThisVisitor visitor);
}

class TextFile implements IFIle {
  final String title;
  final String fileExtension;
  final int size;

  TextFile(this.title, this.fileExtension, this.size);

  @override
  void doThis(IDoThisVisitor visitor) {
    visitor.doThisForTextFile(this);
  }
}

abstract class IDoThisVisitor {
  // should take a specific class not a abstract class
  void doThisForTextFile(TextFile file);
}

class DoXVisitor implements IDoThisVisitor {
  @override
  void doThisForTextFile(TextFile file) {
    print("Do X for ${file.title}");
  }
}

class DoYVisitor implements IDoThisVisitor {
  @override
  void doThisForTextFile(TextFile file) {
    print("Do X for ${file.title}");
  }
}

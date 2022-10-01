abstract class IWidgetFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}

abstract class ISlider {
  // Widget render();
}

abstract class ISwitch {}

abstract class IActivityIndicator {}

// Android
class AndroidWidgetFactory implements IWidgetFactory {
  @override
  String getTitle() {
    return "Android";
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }
}

class AndroidSlider implements ISlider {}

class AndroidSwitch implements ISwitch {}

class AndroidActivityIndicator implements IActivityIndicator {}

// Cupertino
class CupertinoWidgetsFactory implements IWidgetFactory {
  @override
  String getTitle() {
    return "Cupertino";
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return CupertinoActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return CupertinoSlider();
  }

  @override
  ISwitch createSwitch() {
    return CupertinoSwitch();
  }
}

class CupertinoSlider implements ISlider {}

class CupertinoSwitch implements ISwitch {}

class CupertinoActivityIndicator implements IActivityIndicator {}

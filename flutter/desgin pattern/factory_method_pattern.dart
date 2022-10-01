import 'package:flutter/material.dart';

abstract class CustomDialog {
  String getTitle();
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => create(context),
    );
  }
}

class AndroidAlertD extends CustomDialog {
  @override
  String getTitle() {
    return '';
  }

  @override
  Widget create(BuildContext context) {
    return const AlertDialog();
  }
}

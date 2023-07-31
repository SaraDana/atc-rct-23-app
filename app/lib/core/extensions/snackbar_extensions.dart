import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.green,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      key: UniqueKey(),
      content: Text(message),
      backgroundColor: backgroundColor,
    )).closed.then((_) {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
    });
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}

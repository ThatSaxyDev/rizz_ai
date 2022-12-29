import 'package:flutter/material.dart';

void showAlert(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: Text(text),
      ),
    );
}

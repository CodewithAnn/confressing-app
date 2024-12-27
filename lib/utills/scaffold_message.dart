import 'package:flutter/material.dart';

/// Displays a snack bar with the specified text.
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

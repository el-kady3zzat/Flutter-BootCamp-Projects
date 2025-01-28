import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Helper method to show a Snackbar
void mySnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          msg.tr(),
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.blue[900],
        duration: const Duration(seconds: 3),
      ),
    );
}

/// Helper method to show a Dialog
void myDialog(BuildContext context, String title, String content,
    void Function()? onTap, String actionTitle) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(
          content.tr(),
          textAlign: TextAlign.center,
        ),
        actions: [
          GestureDetector(
            onTap: onTap,
            child: Text(actionTitle.tr()),
          ),
        ],
      );
    },
  );
}

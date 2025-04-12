import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void>showMessageWithToast({required String message,required Color background,required Color textColor}) async {
  await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM, // Position at bottom
    backgroundColor: background,
    textColor: textColor,
  );
}
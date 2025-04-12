import 'package:flutter/material.dart';
Future<void> showLoadingDialog(BuildContext context) async{
  await showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        backgroundColor: Color(0xff141922),
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 14),
            Text("loading...",style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    },
    barrierDismissible: false,
  );
}
import 'package:flutter/material.dart';

class Dialog {
  static final Dialog _singleton = Dialog._internal();
  Dialog._internal();

  factory Dialog() {
    return _singleton;
  }

  static Widget questionStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi...',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'Please login before you start...',
          )
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: Text('Confirm'))],
    );
  }
}

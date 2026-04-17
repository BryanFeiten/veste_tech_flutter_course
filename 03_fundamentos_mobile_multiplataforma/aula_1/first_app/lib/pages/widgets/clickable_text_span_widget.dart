import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableTextSpan extends TextSpan {
  ClickableTextSpan(String text, {required void Function() onTap})
    : super(
        text: text,
        recognizer: TapGestureRecognizer()..onTap = onTap,
        style: TextStyle(color: Colors.blue),
      );
}

import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final String text;
  final TextAlign align;

  const H1(this.text, {this.align = .center, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: align,
    );
  }
}

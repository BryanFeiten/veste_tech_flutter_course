import 'dart:developer';

import 'package:flutter/material.dart';

class LinhaFixa extends StatelessWidget {
  final String text;
  const LinhaFixa({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    log('Build', name: 'TextoFixo');

    return Row(spacing: 12, children: [Icon(Icons.calendar_month), Text(text)]);
  }
}

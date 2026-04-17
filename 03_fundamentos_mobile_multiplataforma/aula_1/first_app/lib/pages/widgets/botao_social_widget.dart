import 'package:flutter/material.dart';

class BotaoSocial extends StatelessWidget {
  final String? imagePath;
  final String text;

  const BotaoSocial(this.text, {super.key}) : imagePath = null;
  const BotaoSocial.image(this.text, {required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          if (imagePath != null) Image.asset(imagePath!, width: 18, height: 18),
          Spacer(),
          Text(text),
          Spacer(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/widget/shared/character_image.widget.dart';

class CharacterGridCardWidget extends StatelessWidget {
  const CharacterGridCardWidget({
    super.key,
    required this.character,
    required this.cardColor,
  });

  final Character character;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                character.id.toString(),
                style: const TextStyle(fontSize: 14, color: Color(0xFF495960)),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: CharacterImageWidget(
                key: Key("imageGridCard"),
                character: character,
                width: double.infinity,
                height: double.infinity,
                borderRadius: BorderRadius.zero,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),

            Center(
              child: Text(
                character.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4B5C63),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

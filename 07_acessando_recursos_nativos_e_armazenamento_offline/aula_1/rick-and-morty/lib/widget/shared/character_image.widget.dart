import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.model.dart';

class CharacterImageWidget extends StatelessWidget {
  const CharacterImageWidget({
    super.key,
    required this.character,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  final Character character;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Hero(
        tag: ValueKey(character.id),
        child: CachedNetworkImage(
          imageUrl: character.imageUrl,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          errorWidget: (_, _, _) {
            return Container(
              color: const Color(0xFFE0E0E0),
              alignment: Alignment.center,
              child: const Icon(Icons.person, size: 40, color: Colors.black54),
            );
          },
        ),
      ),
    );
  }
}

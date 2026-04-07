import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/character.model.dart';
import '../stores/home.store.dart';

mixin LoadColor {
  Future<void> getPaletteColor({
    required HomeStore store,
    required Character character,
  }) async {
    final paletteGenerator = await ColorScheme.fromImageProvider(
      provider: CachedNetworkImageProvider(character.image),
    );

    store.updateCharacterColor(
      characterId: character.id,
      backgroundColor: paletteGenerator.surface,
      textColor: paletteGenerator.scrim,
    );
  }
}

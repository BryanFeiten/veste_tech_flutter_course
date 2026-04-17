import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

part 'card.store.g.dart';

class CardStore = CardStoreBase with _$CardStore;

abstract class CardStoreBase with Store {
  @observable
  Color? dominantColor;

  @action
  Future<void> loadDominantColor(String imageUrl) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(imageUrl),
      );
      if (palette.dominantColor != null) {
        dominantColor = palette.dominantColor!.color;
      } else {
        dominantColor = Colors.grey[850];
      }
    } catch (e) {
      dominantColor = Colors.grey[850];
    }
  }
}

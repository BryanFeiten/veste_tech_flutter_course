import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/character.model.dart';

part 'details.store.g.dart';

class DetailsStore = DetailsStoreBase with _$DetailsStore;

abstract class DetailsStoreBase with Store {
  @observable
  Color? dominantColor;

  @action
  Future<void> loadDominantColor(String imageUrl) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(imageUrl),
      );
      dominantColor = palette.dominantColor?.color;
    } catch (e) {
      dominantColor = Colors.grey[850];
    }
  }
}

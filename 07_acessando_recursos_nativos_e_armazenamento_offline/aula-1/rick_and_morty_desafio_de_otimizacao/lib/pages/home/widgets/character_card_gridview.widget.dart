import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/character.model.dart';
import '../mixins/load_color.mixin.dart';
import '../stores/home.store.dart';

class CharacterCardGridView extends StatelessWidget with LoadColor {
  late final Character _character;

  CharacterCardGridView({
    super.key,
    required Character character,
    required HomeStore homeStore,
  }) {
    _character = character;
    getPaletteColor(store: homeStore, character: character);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("gridCard"),
      decoration: BoxDecoration(
        color: _character.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _character.id.toString(),
            style: TextStyle(
              fontSize: 16,
              color: _character.textColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Hero(
            tag: Key(_character.id.toString()),
            child: CachedNetworkImage(
              key: Key("imageGridCard"),
              imageUrl: _character.image,
              height: 130,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            _character.name,
            style: TextStyle(
              color: _character.textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

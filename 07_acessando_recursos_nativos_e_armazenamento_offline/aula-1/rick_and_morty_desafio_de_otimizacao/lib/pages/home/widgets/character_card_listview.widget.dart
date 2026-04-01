import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/character.model.dart';
import '../mixins/load_color.mixin.dart';
import '../stores/home.store.dart';

class CharacterCardListView extends StatelessWidget with LoadColor {
  late final Character _character;

  CharacterCardListView({
    super.key,
    required Character character,
    required HomeStore homeStore,
  }) {
    _character = character;
    getPaletteColor(store: homeStore, character: _character);
  }

  MaterialColor get statusColor {
    final status = _character.status.toLowerCase();
    if (status == 'alive') {
      return Colors.green;
    } else if (status == 'dead') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      key: Key("listCard"),
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _character.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 155,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Hero(
              tag: Key(_character.id.toString()),
              child: CachedNetworkImage(imageUrl: _character.image),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    _character.name,
                    style: TextStyle(
                      color: _character.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.circle, color: statusColor, size: 16),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        "${_character.status} - ${_character.species}",
                        style: TextStyle(
                          color: _character.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  _character.gender,
                  style: TextStyle(color: _character.textColor, fontSize: 16),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _character.id.toString(),
                    style: TextStyle(color: _character.textColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

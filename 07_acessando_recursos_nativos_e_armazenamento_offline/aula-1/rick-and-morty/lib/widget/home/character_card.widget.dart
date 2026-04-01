import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/stores/home.store.dart';
import 'package:rick_and_morty/widget/home/character_grid_card.widget.dart';
import 'package:rick_and_morty/widget/home/character_list_card.widget.dart';

class CharacterCardWidget extends StatefulWidget {
  const CharacterCardWidget({
    super.key,
    required this.character,
    required this.store,
    required this.isGridView,
  });

  final Character character;
  final HomeStore store;
  final bool isGridView;

  @override
  State<CharacterCardWidget> createState() => _CharacterCardWidgetState();
}

class _CharacterCardWidgetState extends State<CharacterCardWidget> {
  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  @override
  void didUpdateWidget(covariant CharacterCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.character.id != widget.character.id) {
      getPaletteColor();
    }
  }

  Future<void> getPaletteColor() async {
    // Com a lib
    final palette = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(widget.character.imageUrl),
    );

    if (palette.dominantColor != null && mounted) {
      widget.store.updateCharacterColor(
        widget.character.id,
        color: palette.dominantColor!.color,
      );
    }

    // Com as opções do flutter
    // final palette = await ColorScheme.fromImageProvider(
    //   provider: NetworkImage(widget.character.imageUrl),
    // );

    // widget.store.updateCharacterColor(
    //   widget.character.id,
    //   color: palette.surface,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final character = widget.store.characters.firstWhere(
          (item) => item.id == widget.character.id,
          orElse: () => widget.character,
        );
        final cardColor = character.color!;

        return widget.isGridView
            ? CharacterGridCardWidget(
                key: Key("gridCard"),
                character: character,
                cardColor: cardColor,
              )
            : CharacterListCardWidget(
                key: Key("listCard"),
                character: character,
                cardColor: cardColor,
              );
      },
    );
  }
}

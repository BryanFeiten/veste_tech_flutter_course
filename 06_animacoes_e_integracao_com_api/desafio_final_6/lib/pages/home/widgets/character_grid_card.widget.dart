import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../models/character.model.dart';
import '../../details/details.page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'card.store.dart';

class CharacterGridCard extends StatefulWidget {
  final Character character;

  const CharacterGridCard({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterGridCard> createState() => _CharacterGridCardState();
}

class _CharacterGridCardState extends State<CharacterGridCard> {
  final CardStore store = CardStore();

  @override
  void initState() {
    super.initState();
    store.loadDominantColor(widget.character.image);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsPage(character: widget.character),
          ),
        );
      },
      child: Observer(
        builder: (_) {
          return Card(
            key: const Key("gridCard"),
            color: store.dominantColor ?? Colors.grey[850],
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    key: const Key("imageGridCard"),
                    imageUrl: widget.character.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.character.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

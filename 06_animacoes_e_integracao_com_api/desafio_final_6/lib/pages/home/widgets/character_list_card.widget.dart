import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../models/character.model.dart';
import '../../details/details.page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'card.store.dart';

class CharacterListCard extends StatefulWidget {
  final Character character;

  const CharacterListCard({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterListCard> createState() => _CharacterListCardState();
}

class _CharacterListCardState extends State<CharacterListCard> {
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
            key: const Key("listCard"),
            color: store.dominantColor ?? Colors.grey[850],
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                CachedNetworkImage(
                  key: const Key("imageListCard"),
                  imageUrl: widget.character.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const SizedBox(width: 120, height: 120, child: Center(child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.character.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.character.status} - ${widget.character.species}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
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

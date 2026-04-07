import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../detail/detail.page.dart';
import '../stores/home.store.dart';
import 'character_card_gridview.widget.dart';

class CharactersGridView extends StatelessWidget {
  final HomeStore _homeStore;
  final ScrollController _scrollController;

  const CharactersGridView({
    super.key,
    required HomeStore homeStore,
    required ScrollController scrollController,
  }) : _homeStore = homeStore,
       _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final filteredChars = _homeStore.filteredCharacters;
        return GridView.builder(
          key: Key("gridView"),
          controller: _scrollController,
          itemCount: filteredChars.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) {
            if (index < filteredChars.length) {
              final character = filteredChars[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(character: character),
                    ),
                  );
                },
                child: CharacterCardGridView(
                  character: character,
                  homeStore: _homeStore,
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}

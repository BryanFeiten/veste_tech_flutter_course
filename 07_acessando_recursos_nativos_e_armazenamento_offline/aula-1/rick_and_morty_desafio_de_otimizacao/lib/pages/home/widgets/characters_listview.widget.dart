import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../detail/detail.page.dart';
import '../stores/home.store.dart';
import 'character_card_listview.widget.dart';

class CharactersListView extends StatelessWidget {
  final HomeStore _homeStore;
  final ScrollController _scrollController;

  const CharactersListView({
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

        return ListView.builder(
          key: Key("listView"),
          controller: _scrollController,
          itemCount: filteredChars.length + 1,
          itemBuilder: (_, index) {
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
                child: CharacterCardListView(
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

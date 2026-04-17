import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'home.store.dart';
import 'widgets/character_list_card.widget.dart';
import 'widgets/character_grid_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = HomeStore();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.fetchCharacters(isInitial: true);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      store.fetchCharacters();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
        actions: [
          Observer(
            builder: (_) => IconButton(
              icon: Icon(store.isGrid ? Icons.list : Icons.grid_view),
              onPressed: store.toggleViewMode,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              key: const Key("Filtro"),
              decoration: InputDecoration(
                hintText: 'Pesquisar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: store.setSearchQuery,
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (store.isLoading && store.characters.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (store.filteredCharacters.isEmpty) {
                  return const Center(child: Text('Nenhum personagem encontrado.'));
                }

                if (store.isGrid) {
                  return GridView.builder(
                    key: const Key("gridView"),
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: store.filteredCharacters.length + (store.isLoading && store.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == store.filteredCharacters.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CharacterGridCard(
                        character: store.filteredCharacters[index],
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    key: const Key("listView"),
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: store.filteredCharacters.length + (store.isLoading && store.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == store.filteredCharacters.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      return CharacterListCard(
                        character: store.filteredCharacters[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

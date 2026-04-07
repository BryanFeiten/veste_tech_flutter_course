import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_and_morty/pages/person_detail/person_detail.page.dart';
import 'package:rick_and_morty/services/get_all_characters.service.dart';
import 'package:rick_and_morty/stores/home.store.dart';
import 'package:rick_and_morty/widget/home/character_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore(GetAllCharactersService());
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.loadCharacters();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (!scrollController.hasClients) {
      return;
    }

    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !store.isLoading) {
      store.loadCharacters();
    }
  }

  bool get isOnGridView => store.isOnGridView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rick and Morty',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16.0),

              const Text(
                'Procure pelo seu personagem',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16.0),

              TextField(
                key: Key("Filtro"),
                onChanged: store.writeSearchText,
                decoration: InputDecoration(
                  hintText: "Nome ou identificador",
                  hintStyle: const TextStyle(color: Color(0xFF5E5E5E)),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF888888),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: store.toggleViewMode,
                  icon: Icon(
                    isOnGridView ? Icons.list : Icons.grid_view,
                    color: Colors.white,
                  ),
                ),
              ),

              Observer(
                builder: (_) {
                  return Expanded(
                    child: GridView.builder(
                      key: Key("gridView"),
                      controller: scrollController,
                      itemCount:
                          store.filteredCharacters.length +
                          ((store.isLoading || store.hasNextPage) ? 1 : 0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isOnGridView ? 2 : 1,
                        crossAxisSpacing: isOnGridView ? 12 : 0,
                        mainAxisSpacing: 12,
                        childAspectRatio: isOnGridView ? 0.76 : 2.45,
                      ),
                      itemBuilder: (context, index) {
                        if (index < store.filteredCharacters.length) {
                          final character = store.filteredCharacters[index];

                          return InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PersonDetailPage(character: character),
                                ),
                              );
                            },
                            child: CharacterCardWidget(
                              character: character,
                              store: store,
                              isGridView: isOnGridView,
                            ),
                          );
                        }

                        return store.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

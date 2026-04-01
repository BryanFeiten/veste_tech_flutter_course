import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character.model.dart';
import 'package:rick_and_morty/widget/detail/detail_chip.widget.dart';
import 'package:rick_and_morty/widget/detail/detail_info_section.widget.dart';
import 'package:rick_and_morty/widget/shared/character_image.widget.dart';

class PersonDetailPage extends StatelessWidget {
  const PersonDetailPage({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final chipColor = Colors.black12;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            pinned: true,
            expandedHeight: 280,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CharacterImageWidget(
                key: Key("imageDetails"),
                character: character,
                width: double.infinity,
                height: double.infinity,
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${character.name.toUpperCase()} | #${character.id}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        DetailChipWidget(
                          label: character.status,
                          color: chipColor,
                        ),
                        DetailChipWidget(
                          label: character.species,
                          color: chipColor,
                        ),
                        DetailChipWidget(
                          label: character.gender,
                          color: chipColor,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  DetailInfoSectionWidget(
                    title: 'Ultima localizacao conhecida:',
                    value: character.lastLocationName,
                  ),

                  const SizedBox(height: 26),

                  DetailInfoSectionWidget(
                    title: 'Local de origem:',
                    value: character.originName,
                  ),

                  const SizedBox(height: 26),

                  DetailInfoSectionWidget(
                    title: 'Quantidade de vezes que apareceu:',
                    value:
                        '${character.qtyShowed} ${character.qtyShowed == 1 ? 'episodio' : 'episodios'}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

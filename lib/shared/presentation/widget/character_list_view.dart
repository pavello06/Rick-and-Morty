import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/presentation/widget/character_card.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({super.key, required this.characters});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.separated(
        itemBuilder: (_, index) => CharacterCard(character: characters[index]),
        separatorBuilder: (_, _) => const SizedBox(height: 16.0),
        itemCount: characters.length,
      ),
    );
  }
}

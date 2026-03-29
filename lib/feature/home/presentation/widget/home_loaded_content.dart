import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/presentation/widget/character_list_view.dart';

class HomeLoadedContent extends StatelessWidget {
  const HomeLoadedContent({super.key, required this.characters});

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return CharacterListView(characters: characters);
  }
}

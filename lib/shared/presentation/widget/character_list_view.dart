import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';
import 'package:rick_and_morty/shared/presentation/widget/character_card.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({
    super.key,
    required this.characters,
    this.afterWidget,
    required this.toggle,
  });

  final List<Character> characters;
  final Widget? afterWidget;
  final void Function(Character character) toggle;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.separated(
        itemBuilder: (_, index) =>
            afterWidget == null || index != characters.length
            ? CharacterCard(character: characters[index], toggle: toggle)
            : afterWidget,
        separatorBuilder: (_, _) => const SizedBox(height: 16.0),
        itemCount: characters.length + (afterWidget != null ? 1 : 0),
      ),
    );
  }
}

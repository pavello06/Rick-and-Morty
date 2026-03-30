import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/config/theme/t.dart';
import 'package:rick_and_morty/feature/character/presentation/page/character_page.dart';
import 'package:rick_and_morty/shared/domain/entity/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
    required this.toggle,
  });

  final Character character;
  final void Function(Character character) toggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CharacterPage.fullRoute(id: character.id));
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: T.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          spacing: 16.0,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: CachedNetworkImage(
                imageUrl: character.image,
                errorWidget: (_, _, _) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: T.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  width: 80.0,
                  height: 80.0,
                  child: const Icon(Icons.image),
                ),
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.0,
                children: [
                  Row(
                    spacing: 4.0,
                    children: [
                      Expanded(
                        child: Text(
                          character.name,
                          style: T
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(height: 0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(
                        width: 29.0,
                        height: 29.0,
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            toggle(character);
                          },
                          icon: character.isFavorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    character.status.name,
                    style: T
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(height: 0),
                  ),

                  Text(
                    '${character.species}${character.type.isEmpty ? '' : ' | ${character.type}'}',
                    style: T
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(height: 0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

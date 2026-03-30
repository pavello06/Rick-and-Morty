import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/l10n/s.dart';
import 'package:rick_and_morty/config/theme/t.dart';
import 'package:rick_and_morty/feature/character/presentation/bloc/character_state.dart';

class CharacterLoadedContent extends StatelessWidget {
  const CharacterLoadedContent({super.key, required this.state});

  final CharacterLoaded state;

  @override
  Widget build(BuildContext context) {
    final character = state.character;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ClipRRect(
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
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: const Icon(Icons.image),
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),

            SliverToBoxAdapter(
              child: Container(
                padding: const .all(16.0),
                decoration: BoxDecoration(
                  color: T.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16.0,
                  children: [
                    Text(
                      '${character.name} (${character.status.title(context)})',
                      style: T
                          .of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),

                    Text(
                      '${character.species} (${character.gender.title(context)})${character.type.isEmpty ? '' : ' | ${character.type}'}',
                      style: T.of(context).textTheme.titleMedium,
                    ),

                    Text(
                      S
                          .of(context)
                          .characterLoadedContentOrigin(character.origin.name),
                      style: T.of(context).textTheme.titleMedium,
                    ),

                    Text(
                      S
                          .of(context)
                          .characterLoadedContentLocation(
                            character.location.name,
                          ),
                      style: T.of(context).textTheme.titleMedium,
                    ),

                    Text(
                      S
                          .of(context)
                          .characterLoadedContentEpisode(
                            character.episode.length,
                          ),
                      style: T.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          ],
        ),
      ),
    );
  }
}

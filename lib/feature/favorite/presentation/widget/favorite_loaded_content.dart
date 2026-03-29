import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_cubit.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_state.dart';
import 'package:rick_and_morty/shared/presentation/widget/character_list_view.dart';

class FavoriteLoadedContent extends StatelessWidget {
  const FavoriteLoadedContent({super.key, required this.state});

  final FavoriteLoaded state;

  @override
  Widget build(BuildContext context) {
    return CharacterListView(
      characters: state.characters,
      toggle: (character) {
        context.read<FavoriteCubit>().toggleCharacter(character);
      },
    );
  }
}

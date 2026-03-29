import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_cubit.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_state.dart';
import 'package:rick_and_morty/shared/presentation/widget/character_list_view.dart';

class HomeLoadedContent extends StatelessWidget {
  const HomeLoadedContent({super.key, required this.state});

  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: CharacterListView(
        characters: state.characters,
        afterWidget: state.isLoading
            ? Container(
                alignment: Alignment.center,
                padding: const .all(2.0),
                child: const CircularProgressIndicator(),
              )
            : null,
        toggle: (character) {
          context.read<HomeCubit>().toggleCharacter(character);
        },
      ),
      onNotification: (notification) {
        final metrics = notification.metrics;

        const threshold = 200.0;

        if (metrics.pixels >= metrics.maxScrollExtent - threshold) {
          context.read<HomeCubit>().getNextCharacterPage();
          return true;
        }

        return false;
      },
    );
  }
}

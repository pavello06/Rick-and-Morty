import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/config/l10n/s.dart';
import 'package:rick_and_morty/feature/character/presentation/bloc/character_cubit.dart';
import 'package:rick_and_morty/feature/character/presentation/bloc/character_state.dart';
import 'package:rick_and_morty/feature/character/presentation/widget/character_loaded_content.dart';
import 'package:rick_and_morty/shared/presentation/widget/error_content.dart';
import 'package:rick_and_morty/shared/presentation/widget/loading_content.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  static const route = '/character/:id';

  static String fullRoute({required int id}) =>
      route.replaceFirst(':id', id.toString());

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).characterPageTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) {
              return IconButton(
                onPressed: state is CharacterLoaded
                    ? () {
                        context.read<CharacterCubit>().toggleCharacter(
                          state.character,
                        );
                      }
                    : null,
                icon: state is CharacterLoaded && state.character.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const .symmetric(vertical: 4.0, horizontal: 16.0),
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterInitial) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<CharacterCubit>().init();
              });

              return const LoadingContent();
            } else if (state is CharacterLoading) {
              return const LoadingContent();
            } else if (state is CharacterLoaded) {
              return CharacterLoadedContent(state: state);
            } else if (state is CharacterError) {
              return ErrorContent(
                onRetry: () {
                  context.read<CharacterCubit>().init();
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

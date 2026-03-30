import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_cubit.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_state.dart';
import 'package:rick_and_morty/feature/favorite/presentation/widget/favorite_loaded_content.dart';
import 'package:rick_and_morty/feature/favorite/presentation/widget/favorite_loaded_empty.dart';
import 'package:rick_and_morty/service/di/di.dart';
import 'package:rick_and_morty/shared/presentation/widget/error_content.dart';
import 'package:rick_and_morty/shared/presentation/widget/loading_content.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  static const route = '/favorite';

  static String fullRoute() => route;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>.value(
      value: DI.getIt()..update(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.read<FavoriteCubit>().init();
            });
      
            return LoadingContent();
          } else if (state is FavoriteLoading) {
            return LoadingContent();
          } else if (state is FavoriteLoaded) {
            if (state.characters.isEmpty) return const FavoriteLoadedEmpty();
      
            return FavoriteLoadedContent(state: state);
          } else if (state is FavoriteError) {
            return ErrorContent(
              onRetry: () {
                context.read<FavoriteCubit>().init();
              },
            );
          }
      
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

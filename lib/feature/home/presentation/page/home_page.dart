import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_cubit.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_state.dart';
import 'package:rick_and_morty/feature/home/presentation/widget/home_loaded_content.dart';
import 'package:rick_and_morty/service/di/di.dart';
import 'package:rick_and_morty/shared/presentation/widget/error_content.dart';
import 'package:rick_and_morty/shared/presentation/widget/error_snack_bar.dart';
import 'package:rick_and_morty/shared/presentation/widget/loading_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/';

  static String fullRoute() => route;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>.value(
      value: DI.getIt()..update(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              context.read<HomeCubit>().init();
            });
      
            return LoadingContent();
          } else if (state is HomeLoading) {
            return LoadingContent();
          } else if (state is HomeLoaded) {
            return HomeLoadedContent(state: state);
          } else if (state is HomeError) {
            return ErrorContent(
              onRetry: () {
                context.read<HomeCubit>().init();
              },
            );
          }
      
          return const SizedBox.shrink();
        },
        listener: (context, state) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: ErrorSnackBarContent()));
        },
        listenWhen: (previous, current) =>
            previous is HomeLoaded &&
            current is HomeLoaded &&
            previous.failure != current.failure &&
            current.failure != null,
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_cubit.dart';
import 'package:rick_and_morty/feature/home/presentation/page/home_page.dart';
import 'package:rick_and_morty/service/di/di.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.route,
      builder: (context, state) {
        return BlocProvider<HomeCubit>.value(
          value: DI.getIt(),
          child: const HomePage(),
        );
      },
    ),
  ],
  initialLocation: HomePage.route,
);

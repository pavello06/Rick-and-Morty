import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/feature/favorite/presentation/bloc/favorite_cubit.dart';
import 'package:rick_and_morty/feature/favorite/presentation/page/favorite_page.dart';
import 'package:rick_and_morty/feature/home/presentation/bloc/home_cubit.dart';
import 'package:rick_and_morty/feature/home/presentation/page/home_page.dart';
import 'package:rick_and_morty/service/di/di.dart';
import 'package:rick_and_morty/shared/presentation/widget/my_navigation_bar.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => ChangeNotifierProvider(
        create: (_) => MyNavigationBarProvider(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Rick and Morty',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          body: Padding(
            padding: const .symmetric(vertical: 4.0, horizontal: 16.0),
            child: child,
          ),

          bottomNavigationBar: const MyNavigationBar(),
        ),
      ),
      routes: [
        GoRoute(
          path: HomePage.route,
          builder: (context, state) {
            return BlocProvider<HomeCubit>.value(
              value: DI.getIt()..update(),
              child: const HomePage(),
            );
          },
        ),

        GoRoute(
          path: FavoritePage.route,
          builder: (context, state) {
            return BlocProvider<FavoriteCubit>.value(
              value: DI.getIt()..update(),
              child: const FavoritePage(),
            );
          },
        ),
      ],
    ),
  ],
  initialLocation: HomePage.route,
);

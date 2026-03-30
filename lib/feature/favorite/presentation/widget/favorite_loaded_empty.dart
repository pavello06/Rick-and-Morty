import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/l10n/s.dart';
import 'package:rick_and_morty/config/theme/t.dart';

class FavoriteLoadedEmpty extends StatelessWidget {
  const FavoriteLoadedEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).favoriteLoadedEmptyText,
        style: T.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

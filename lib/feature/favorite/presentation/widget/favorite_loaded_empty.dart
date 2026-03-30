import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/l10n/app_locale.dart';

class FavoriteLoadedEmpty extends StatelessWidget {
  const FavoriteLoadedEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocale.of(context).favoriteLoadedEmptyText,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

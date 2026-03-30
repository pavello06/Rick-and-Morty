import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/l10n/app_locale.dart';

class ErrorSnackBarContent extends StatelessWidget {
  const ErrorSnackBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        const Icon(Icons.error),

        Text(AppLocale.of(context).errorSnackBarText),
      ],
    );
  }
}

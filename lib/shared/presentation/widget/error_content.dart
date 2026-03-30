import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/l10n/app_locale.dart';

class ErrorContent extends StatelessWidget {
  const ErrorContent({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocale.of(context).errorContentText,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),

        TextButton(
          onPressed: onRetry,
          child: Text(
            AppLocale.of(context).errorContentButton,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

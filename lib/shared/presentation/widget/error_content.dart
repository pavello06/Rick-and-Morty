import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/l10n/s.dart';
import 'package:rick_and_morty/config/theme/t.dart';

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
          S.of(context).errorContentText,
          style: T.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),

        TextButton(
          onPressed: onRetry,
          child: Text(
            S.of(context).errorContentButton,
            style: T.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
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
        Center(
          child: Text(
            'Не удалось загрузить данные',
            style: T.of(context).textTheme.titleLarge,
          ),
        ),

        TextButton(
          onPressed: onRetry,
          child: Text('Повторить', style: T.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}

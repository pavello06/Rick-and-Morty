import 'package:flutter/material.dart';

class ErrorSnackBarContent extends StatelessWidget {
  const ErrorSnackBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.error, color: Colors.red),

        SizedBox(width: 16.0),

        Text('Произошла ошибка'),
      ],
    );
  }
}

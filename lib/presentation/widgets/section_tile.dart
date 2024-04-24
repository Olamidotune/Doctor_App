import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String text;
  final String? action;
  final VoidCallback? onPressed;
  const SectionTile(
      {super.key, required this.text, this.action, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
        ),
        if (action != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              action!,
              style: const TextTheme().bodyLarge,
            ),
          )
      ],
    );
  }
}

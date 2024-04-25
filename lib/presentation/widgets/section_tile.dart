import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String text;
  final String? action;
  final VoidCallback? onPressed;
  const SectionTile(
      {super.key, required this.text, this.action, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

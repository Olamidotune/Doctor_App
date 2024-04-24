import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomCircleAvatar({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        GestureDetector(
          child: Column(
            children: [
              CircleAvatar(
                foregroundColor: colorScheme.primary,
                backgroundColor: colorScheme.onPrimary,
                child: Icon(icon),
              ),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: colorScheme.secondary,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

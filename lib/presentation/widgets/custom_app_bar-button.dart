import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CustomAppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(icon),
      ),
    );
  }
}

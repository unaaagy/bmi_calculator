import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;

  const RoundedIconButton({
    required this.icon,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      color: Colors.white,
      iconSize: 32,
      icon: Icon(icon),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xFF4C4F5E)),
          padding: WidgetStatePropertyAll(EdgeInsets.all(16))),
    );
  }
}

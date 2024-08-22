import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget? cardChild;

  ReusableCard({
    this.cardColor = const Color(0XFF1D1E33),
    this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(16),
      child: cardChild,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardColor,
      ),
    );
  }
}

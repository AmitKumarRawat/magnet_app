import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class PageDots extends StatelessWidget {
  final int count;
  final int active;
  final Color activeColor;
  final Color inactiveColor;

  const PageDots({
    super.key,
    required this.count,
    required this.active,
    this.activeColor = AppColors.dotActive,
    this.inactiveColor = AppColors.dotInactive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == active ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}

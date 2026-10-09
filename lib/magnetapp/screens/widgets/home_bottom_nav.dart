import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SizedBox(
        height: 92,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            _buildBar(),
            _buildCenterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar() {
    return Container(
      height: 64,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            icon: Icons.fingerprint,
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavItem(
            icon: Icons.wifi_tethering,
            selected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          const SizedBox(width: 64),
          _NavItem(
            icon: Icons.person_outline,
            selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
          _NavItem(
            icon: Icons.more_horiz,
            selected: currentIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterButton() {
    return Positioned(
      bottom: 22,
      child: GestureDetector(
        onTap: () => onTap(2),
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome_mosaic_rounded,
            color: AppColors.red,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 44,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF1EBE6) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(
          icon,
          color: selected ? AppColors.red : AppColors.navy,
          size: 24,
        ),
      ),
    );
  }
}

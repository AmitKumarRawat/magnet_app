import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onChatTap;
  final VoidCallback? onNotificationTap;
  final int notificationCount;

  const HomeAppBar({
    super.key,
    this.onMenuTap,
    this.onChatTap,
    this.onNotificationTap,
    this.notificationCount = 0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBg,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      leadingWidth: 56,
      leading: IconButton(
        icon: const Icon(Icons.grid_view_rounded, color: AppColors.red),
        onPressed: onMenuTap,
      ),
      title: const Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'magnet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: AppColors.navy,
            ),
          ),
          Text(
            '.',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: AppColors.red,
              height: 1.0,
            ),
          ),
        ],
      ),
      actions: [
        _CircleAction(
          icon: Icons.chat_bubble_outline_rounded,
          onTap: onChatTap,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            _CircleAction(
              icon: Icons.notifications_none_rounded,
              onTap: onNotificationTap,
            ),
            if (notificationCount > 0)
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class _CircleAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _CircleAction({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: AppColors.navy, size: 18),
        onPressed: onTap,
      ),
    );
  }
}

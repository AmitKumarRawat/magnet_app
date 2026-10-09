import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildBanner(),
          _buildTypeChip(),
          _buildAvatar(),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: SizedBox(
        height: 78,
        width: double.infinity,
        child: Image.network(
          user['bannerImage'],
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBFD8E4), Color(0xFFE6C9C0)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeChip() {
    return Positioned(
      top: 10,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person_outline, size: 14, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              user['type'],
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Positioned(
      top: 40,
      left: 14,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: NetworkImage(user['profileImage']),
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Positioned.fill(
      top: 108,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user['name'],
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: AppColors.navy,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              user['designation'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.navy,
              ),
            ),
            Text(
              user['city'],
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 6),
            Container(height: 1.5, width: 28, color: Colors.grey.shade400),
            const Spacer(),
            Row(
              children: [
                ProfileStat(
                  icon: Icons.visibility_outlined,
                  iconColor: Colors.teal,
                  bg: const Color(0xFFE3F4F4),
                  value: '${user['totalviews']}',
                  label: 'Profile Views',
                ),
                const SizedBox(width: 28),
                ProfileStat(
                  icon: Icons.bookmark_border,
                  iconColor: Colors.deepOrange,
                  bg: const Color(0xFFFCE9E1),
                  value: '${user['totalBookmarks']}',
                  label: 'Profile Saved',
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bg;
  final String value;
  final String label;

  const ProfileStat({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bg,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: iconColor),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.navy,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }
}

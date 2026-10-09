import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'section_card.dart';

class SocialFeedCard extends StatelessWidget {
  const SocialFeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Social Feeds',
      children: [
        const SizedBox(height: 18),
        _buildAuthorRow(),
        const SizedBox(height: 16),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
          'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TextStyle(fontSize: 13, color: AppColors.navy, height: 1.4),
        ),
        const SizedBox(height: 12),
        const Text(
          '#tour  #business  #travel',
          style: TextStyle(fontSize: 13, color: AppColors.navy),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            'https://picsum.photos/seed/lake/800/500',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 150,
              color: Colors.grey.shade300,
              child: const Icon(Icons.image, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Row(
          children: [
            FeedAction(icon: Icons.favorite_border, label: '154'),
            SizedBox(width: 22),
            FeedAction(icon: Icons.chat_bubble_outline, label: '205'),
            SizedBox(width: 22),
            FeedAction(icon: Icons.share_outlined, label: '6'),
          ],
        ),
      ],
    );
  }

  Widget _buildAuthorRow() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=12'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vikas Singh',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              Text(
                'Professional . 2 hours ago',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        Icon(Icons.more_horiz, color: Colors.grey.shade500),
      ],
    );
  }
}

class FeedAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeedAction({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.navy),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13, color: AppColors.navy)),
      ],
    );
  }
}

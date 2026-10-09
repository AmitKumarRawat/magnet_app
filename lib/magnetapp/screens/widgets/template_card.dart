import 'package:flutter/material.dart';

class TemplateCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const TemplateCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = data['colors'] as List<Color>;
    return Container(
      width: 156,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.25),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: const Icon(Icons.bubble_chart,
                    size: 14, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  data['company'],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            data['name'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            data['role'],
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            data['desc'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}

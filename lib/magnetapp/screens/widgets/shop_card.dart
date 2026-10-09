import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'page_dots.dart';
import 'section_card.dart';

class ShopCard extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const ShopCard({super.key, required this.products});

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Shop',
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 262,
          child: PageView.builder(
            itemCount: widget.products.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, i) => _ProductItem(product: widget.products[i]),
          ),
        ),
        const SizedBox(height: 14),
        PageDots(count: widget.products.length, active: _page),
      ],
    );
  }
}

class _ProductItem extends StatelessWidget {
  final Map<String, dynamic> product;

  const _ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            product['image'],
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 150,
              color: const Color(0xFF3A3A3A),
              child: const Icon(Icons.credit_card,
                  color: Colors.white54, size: 48),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          product['name'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product['tagline'],
          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFDE8EC),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                product['price'],
                style: const TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            const Spacer(),
            const Icon(Icons.star_rounded, color: Color(0xFFF2A100), size: 18),
            const SizedBox(width: 4),
            Text(
              '${product['rating']} (${product['reviews']})',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}

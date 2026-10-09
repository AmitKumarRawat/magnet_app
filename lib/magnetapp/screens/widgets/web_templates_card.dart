import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'page_dots.dart';
import 'section_card.dart';
import 'template_card.dart';

class WebTemplatesCard extends StatefulWidget {
  final List<String> filters;
  final List<Map<String, dynamic>> templates;
  final String initialFilter;

  const WebTemplatesCard({
    super.key,
    required this.filters,
    required this.templates,
    this.initialFilter = 'All',
  });

  @override
  State<WebTemplatesCard> createState() => _WebTemplatesCardState();
}

class _WebTemplatesCardState extends State<WebTemplatesCard> {
  late String _selectedFilter = widget.initialFilter;
  int _page = 0;

  List<Map<String, dynamic>> get _filtered => _selectedFilter == 'All'
      ? widget.templates
      : widget.templates
          .where((t) => t['category'] == _selectedFilter)
          .toList();

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return SectionCard(
      title: 'Web Templates',
      children: [
        const SizedBox(height: 14),
        _buildFilters(),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: NotificationListener<ScrollNotification>(
            onNotification: (n) {
              final max = items.isEmpty ? 0 : items.length - 1;
              final page = (n.metrics.pixels / 166).round().clamp(0, max);
              if (page != _page) setState(() => _page = page);
              return false;
            },
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => TemplateCard(data: items[i]),
            ),
          ),
        ),
        const SizedBox(height: 14),
        PageDots(count: items.length, active: _page),
      ],
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.filters.map((f) {
          final selected = f == _selectedFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => setState(() {
                _selectedFilter = f;
                _page = 0;
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.chipSelected
                      : AppColors.chipUnselected,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  f,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: selected ? Colors.white : const Color(0xFF5B6275),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

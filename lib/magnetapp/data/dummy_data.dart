import 'package:flutter/material.dart';

final List<Map<String, dynamic>> userDetails = List.generate(
  4,
  (_) => {
    'profileImage': 'https://i.pravatar.cc/200?img=47',
    'bannerImage': 'https://picsum.photos/600/300?blur=2',
    'name': 'Rashmika Singh',
    'designation': 'Software Engineer at Troology Technologies',
    'city': 'Ahmedabad',
    'type': 'Personal',
    'totalviews': 1245,
    'totalBookmarks': 124,
  },
);

const List<double> chartData = [
  0.2, 0.35, 0.3, 0.6, 0.9, 0.7, 0.5, 0.45, 0.75, 0.85, 0.7, 0.8, 0.4,
];

const List<Map<String, dynamic>> products = [
  {
    'image': 'https://picsum.photos/seed/smartcard/800/400',
    'name': 'MAGNET Smart Card',
    'tagline': 'Tap. Share . Impress',
    'price': '₹749/year',
    'rating': 4.8,
    'reviews': 2541,
  },
  {
    'image': 'https://picsum.photos/seed/smartcard2/800/400',
    'name': 'MAGNET Smart Card Pro',
    'tagline': 'Premium metal finish',
    'price': '₹1,499/year',
    'rating': 4.9,
    'reviews': 1180,
  },
  {
    'image': 'https://picsum.photos/seed/smartcard3/800/400',
    'name': 'MAGNET Smart Tag',
    'tagline': 'Share anywhere',
    'price': '₹399/year',
    'rating': 4.6,
    'reviews': 860,
  },
  {
    'image': 'https://picsum.photos/seed/smartcard4/800/400',
    'name': 'MAGNET Team Pack',
    'tagline': 'For your whole team',
    'price': '₹3,999/year',
    'rating': 4.7,
    'reviews': 420,
  },
  {
    'image': 'https://picsum.photos/seed/smartcard5/800/400',
    'name': 'MAGNET Event Kit',
    'tagline': 'Network at scale',
    'price': '₹5,999/year',
    'rating': 4.5,
    'reviews': 215,
  },
];

const List<String> templateFilters = ['All', 'Professional', 'Creative', 'Tech'];

const List<Map<String, dynamic>> templates = [
  {
    'company': 'Vortex Labs',
    'name': 'Rohan Das',
    'role': 'Tech Lead',
    'desc': 'Building future-proof distributed architectures.',
    'category': 'Creative',
    'colors': [Color(0xFF3B1170), Color(0xFFB0207A)],
  },
  {
    'company': 'Teal Studio',
    'name': 'Ananya Sen',
    'role': 'Lead Artist',
    'desc': 'Visualising unseen worlds through digital painting.',
    'category': 'Creative',
    'colors': [Color(0xFF0B5D4A), Color(0xFF1E8C6E)],
  },
  {
    'company': 'Nimbus Corp',
    'name': 'Kabir Mehta',
    'role': 'Product Manager',
    'desc': 'Shipping products people love.',
    'category': 'Professional',
    'colors': [Color(0xFF1E2A5A), Color(0xFF3F5EC4)],
  },
  {
    'company': 'Byte Forge',
    'name': 'Isha Rao',
    'role': 'Full Stack Dev',
    'desc': 'Clean code, fast apps, happy users.',
    'category': 'Tech',
    'colors': [Color(0xFF111111), Color(0xFF444B5A)],
  },
  {
    'company': 'Pixel Hive',
    'name': 'Dev Patel',
    'role': 'UI Designer',
    'desc': 'Crafting delightful interfaces.',
    'category': 'Creative',
    'colors': [Color(0xFF7A2E0E), Color(0xFFE0813B)],
  },
];

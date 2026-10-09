import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../data/dummy_data.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/page_dots.dart';
import '../widgets/profile_card.dart';
import '../widgets/shop_card.dart';
import '../widgets/social_feed_card.dart';
import '../widgets/total_view_card.dart';
import '../widgets/web_templates_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _profileController = PageController(
    viewportFraction: 0.9,
  );
  int _navIndex = 0;

  @override
  void dispose() {
    _profileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: HomeAppBar(
        notificationCount: 4,
        onMenuTap: () {
          // handle menu tap here
        },
        onChatTap: () {
          // handle chat tap here
        },
        onNotificationTap: () {
          // handle notification tap here
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Column(
          children: [
            SizedBox(
              height: 232,
              child: PageView.builder(
                controller: _profileController,
                itemCount: userDetails.length,
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ProfileCard(user: userDetails[i]),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TotalViewCard(
              totalViews: 1245,
              growth: '+15%',
              chartData: chartData,
            ),
            const SizedBox(height: 8),
            const PageDots(
              count: 3,
              active: 0,
              activeColor: Color(0xFF757575),
              inactiveColor: Color(0xFFE0E0E0),
            ),
            const SizedBox(height: 16),
            const SocialFeedCard(),
            const SizedBox(height: 16),
            const ShopCard(products: products),
            const SizedBox(height: 16),
            const WebTemplatesCard(
              filters: templateFilters,
              templates: templates,
              initialFilter: 'Creative',
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

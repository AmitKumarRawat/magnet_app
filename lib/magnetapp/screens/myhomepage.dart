import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:magnet_app/magnetapp/controller/authentication/authcontroller.dart';
import 'package:magnet_app/magnetapp/screens/widgets/profile_card.dart';
import '../constants/app_colors.dart';
import '../data/dummy_data.dart';
import 'package:magnet_app/magnetapp/screens/widgets/home_app_bar.dart';
import 'package:magnet_app/magnetapp/screens/widgets/home_bottom_nav.dart';
import 'package:magnet_app/magnetapp/screens/widgets/page_dots.dart';
import 'package:magnet_app/magnetapp/screens/widgets/shop_card.dart';
import 'package:magnet_app/magnetapp/screens/widgets/social_feed_card.dart';
import 'package:magnet_app/magnetapp/screens/widgets/total_view_card.dart';
import 'package:magnet_app/magnetapp/screens/widgets/web_templates_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GoogleAuthController _authController = GoogleAuthController();
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetConnection = InternetConnection();
  final PageController _profileController = PageController(
    viewportFraction: 0.9,
  );
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  StreamSubscription<InternetStatus>? _internetSubscription;
  int _navIndex = 0;
  bool? _hasNetwork;
  String? _userEmail;
  String? _userPhotoUrl;

  @override
  void initState() {
    super.initState();
    _loadSavedProfile();
    _checkInternetAccess();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectivity,
    );
    _internetSubscription = _internetConnection.onStatusChange.listen(
      _updateInternetStatus,
    );
  }

  Future<void> _loadSavedProfile() async {
    final email = await _authController.getUserEmail();
    final photoUrl = await _authController.getUserPhoto();
    if (!mounted) return;
    setState(() {
      _userEmail = email;
      _userPhotoUrl = photoUrl;
    });
  }

  Future<void> _checkInternetAccess() async {
    try {
      final hasInternet = await _internetConnection.hasInternetAccess;
      if (mounted) setState(() => _hasNetwork = hasInternet);
    } catch (_) {
      if (mounted) setState(() => _hasNetwork = false);
    }
  }

  void _updateConnectivity(List<ConnectivityResult> results) {
    if (results.every((result) => result == ConnectivityResult.none)) {
      if (mounted) setState(() => _hasNetwork = false);
      return;
    }
    _checkInternetAccess();
  }

  void _updateInternetStatus(InternetStatus status) {
    if (!mounted) return;
    setState(() => _hasNetwork = status == InternetStatus.connected);
  }

  @override
  void dispose() {
    unawaited(_connectivitySubscription?.cancel());
    unawaited(_internetSubscription?.cancel());
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
      body: Column(
        children: [
          if (_hasNetwork == false)
            Container(
              width: double.infinity,
              color: const Color(0xFFFFE7E5),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: const Row(
                children: [
                  Icon(Icons.wifi_off, color: Color(0xFFB42318), size: 18),
                  SizedBox(width: 8),
                  Text(
                    'No internet connection - Disconnected',
                    style: TextStyle(
                      color: Color(0xFFB42318),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: Column(
                children: [
                  if (_userEmail != null || _userPhotoUrl != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child:
                                _userPhotoUrl == null || _userPhotoUrl!.isEmpty
                                ? const Icon(Icons.person_outline)
                                : ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: _userPhotoUrl!,
                                      width: 52,
                                      height: 52,
                                      fit: BoxFit.cover,
                                      placeholder: (_, _) => const Icon(
                                        Icons.person_outline,
                                        size: 28,
                                      ),
                                      errorWidget: (_, _, _) => const Icon(
                                        Icons.person_outline,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _userEmail ?? 'Google account',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}

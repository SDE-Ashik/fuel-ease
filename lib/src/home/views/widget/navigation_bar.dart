import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fuelease/common/color_extention.dart';
import 'package:fuelease/src/profile/views/profile_views.dart';

class NavigationBarWidget extends StatelessWidget {
  NavigationBarWidget({super.key});
  final List<Widget> _navigationItem = [
    GestureDetector(
      onTap: () => const ProfileViews(),
      child: const Icon(
        Icons.dashboard,
      ),
    ),
    const Icon(Icons.home),
    const Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    
    return CurvedNavigationBar(
      onTap: (value) {},
      animationCurve: Curves.bounceIn,
      backgroundColor: TColor.white,
      color: TColor.primary,
      items: _navigationItem,

      animationDuration: const Duration(microseconds: 300),
    );
  }
}

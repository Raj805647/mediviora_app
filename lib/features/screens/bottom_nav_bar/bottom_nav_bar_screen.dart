import 'package:flutter/material.dart';
import 'package:mediviora_app/routes/route_names.dart';
import 'package:provider/provider.dart';

import 'bottom_nav_bar_provider.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<BottomNavBarProvider>();

    return Scaffold(

      body: Stack(
        children: [

          /// SCREEN
          Positioned.fill(
            child: provider.screens[provider.currentIndex],
          ),

          /// CUSTOM NAVBAR INSIDE BODY
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,

            child: Container(
              height: 85,

              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),

                borderRadius: BorderRadius.circular(40),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,

                children: [

                  navItem(
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home,
                    label: "Home",
                    index: 0,
                    provider: provider,
                  ),

                  navItem(
                    icon: Icons.public_outlined,
                    activeIcon: Icons.public,
                    label: "Explore",
                    index: 1,
                    provider: provider,
                  ),

                  centerNavButton(context, provider),

                  navItem(
                    icon: Icons.calendar_today_outlined,
                    activeIcon: Icons.calendar_month,
                    label: "Schedule",
                    index: 2,
                    provider: provider,
                  ),

                  navItem(
                    icon: Icons.person_outline,
                    activeIcon: Icons.person,
                    label: "Profile",
                    index: 3,
                    provider: provider,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// NAV ITEM
  Widget navItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    required BottomNavBarProvider provider,
  }) {

    final isSelected =
        provider.currentIndex == index;

    return GestureDetector(
      onTap: () {
        provider.changeIndex(index);
      },

      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(
            isSelected ? activeIcon : icon,

            size: 26,

            color: isSelected
                ? const Color(0xFF00CFFF)
                : const Color(0xFF64748B),
          ),

          const SizedBox(height: 4),

          Text(
            label,

            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,

              color: isSelected
                  ? const Color(0xFF00CFFF)
                  : const Color(0xFF64748B),
            ),
          ),

          const SizedBox(height: 3),

          AnimatedContainer(
            duration:
            const Duration(milliseconds: 250),

            width: 5,
            height: 5,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: isSelected
                  ? const Color(0xFF00CFFF)
                  : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  /// CENTER BUTTON
  Widget centerNavButton(BuildContext context,
      BottomNavBarProvider provider,
      ) {

    return GestureDetector(
      onTap: () {
        provider.navigateTo(context, RouteNames.aiScreen);
      },

      child: Transform.translate(
        offset: const Offset(0, -22),

        child: Container(
          width: 70,
          height: 70,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            gradient: const LinearGradient(
              colors: [
                Color(0xFF00D1FF),
                Color(0xFF8B7CFF),
              ],
            ),

            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D1FF)
                    .withOpacity(0.35),

                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),

          child: const Icon(
            Icons.auto_awesome,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mediviora_app/features/screens/profile/profile_pprovider.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../widget/help_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF3F6FB),

          body: Stack(
            children: [
              appBackground(),

              SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      _profileHeader(),

                      spaceHeight(18),

                      _statsSection(),

                      spaceHeight(22),

                      _sectionTitle("Medical"),

                      spaceHeight(12),

                      _menuContainer(
                        children: [
                          _menuTile(
                            icon: Icons.description_outlined,
                            iconColor:
                            const Color(0xFF00D1FF),
                            title: "Medical Records",
                            trailingText: "12",
                          ),

                          _divider(),

                          _menuTile(
                            icon: Icons.favorite_border,
                            iconColor:
                            const Color(0xFF00C48C),
                            title: "Health Metrics",
                          ),

                          _divider(),

                          _menuTile(
                            icon: Icons.family_restroom,
                            iconColor:
                            const Color(0xFF8B7CFF),
                            title: "Family Members",
                            trailingText: "3",
                          ),
                        ],
                      ),

                      spaceHeight(24),

                      _sectionTitle("Account"),

                      spaceHeight(12),

                      _menuContainer(
                        children: [
                          _menuTile(
                            icon:
                            Icons.account_balance_wallet_outlined,
                            iconColor:
                            const Color(0xFFFFC857),
                            title: "Payment Methods",
                          ),

                          _divider(),

                          _menuTile(
                            icon:
                            Icons.shield_outlined,
                            iconColor:
                            const Color(0xFF4D96FF),
                            title: "Insurance",
                          ),

                          _divider(),

                          _menuTile(
                            icon: Icons.language,
                            iconColor:
                            const Color(0xFF0F172A),
                            title: "Language",
                            subtitle: "English",
                          ),
                        ],
                      ),

                      spaceHeight(24),

                      _sectionTitle("Preferences"),

                      spaceHeight(12),

                      _menuContainer(
                        children: [
                          _switchTile(
                            icon:
                            Icons.notifications_none,
                            iconColor:
                            const Color(0xFF8B7CFF),
                            title: "Notifications",
                            value: provider
                                .notificationEnabled,
                            onChanged: provider
                                .toggleNotification,
                          ),

                          _divider(),

                          _switchTile(
                            icon:
                            Icons.dark_mode_outlined,
                            iconColor:
                            const Color(0xFF0F172A),
                            title: "Dark Mode",
                            value:
                            provider.darkModeEnabled,
                            onChanged:
                            provider.toggleDarkMode,
                          ),

                          _divider(),

                          _menuTile(
                            icon:
                            Icons.lock_outline,
                            iconColor:
                            const Color(0xFFFF6B6B),
                            title:
                            "Privacy & Security",
                          ),
                        ],
                      ),

                      spaceHeight(24),

                      _sectionTitle("Support"),

                      spaceHeight(12),

                      _menuContainer(
                        children: [
                          _menuTile(
                            icon:
                            Icons.help_outline,
                            iconColor:
                            const Color(0xFF00D1FF),
                            title: "Help Center",
                          ),

                          _divider(),

                          _menuTile(
                            icon: Icons.settings,
                            iconColor:
                            const Color(0xFF64748B),
                            title: "Settings",
                          ),

                          _divider(),

                          _menuTile(
                            icon:
                            Icons.logout_outlined,
                            iconColor:
                            const Color(0xFFFF6B6B),
                            title: "Logout",
                          ),
                        ],
                      ),

                      spaceHeight(100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// PROFILE HEADER
  Widget _profileHeader() {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),

        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 72,
                height: 72,

                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(22),

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00D1FF),
                      Color(0xFF8B7CFF),
                    ],
                  ),
                ),

                child: const Center(
                  child: Text(
                    "🧑‍⚕️",
                    style: TextStyle(fontSize: 34),
                  ),
                ),
              ),

              spaceWidth(16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Sarah Anderson",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),

                    spaceHeight(4),

                    const Text(
                      "sarah.anderson@email.com",

                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 13,
                      ),
                    ),

                    spaceHeight(10),

                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,

                          decoration:
                          const BoxDecoration(
                            color: Color(0xFF00C48C),
                            shape: BoxShape.circle,
                          ),
                        ),

                        spaceWidth(6),

                        const Text(
                          "Edit Profile",

                          style: TextStyle(
                            color:
                            Color(0xFF00C48C),
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          spaceHeight(20),

          Divider(
            color: Colors.grey.shade200,
          ),

          spaceHeight(16),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,

            children: [
              _healthItem(
                emoji: "🩸",
                title: "Blood Type",
                value: "O+",
              ),

              _healthItem(
                emoji: "📏",
                title: "Height",
                value: "186 cm",
              ),

              _healthItem(
                emoji: "⚖️",
                title: "Weight",
                value: "65 kg",
              ),

              _healthItem(
                emoji: "🎂",
                title: "Age",
                value: "32 years",
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// STATS
  Widget _statsSection() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            "24",
            "Appointments",
            const Color(0xFF00D1FF),
          ),
        ),

        spaceWidth(12),

        Expanded(
          child: _statCard(
            "12",
            "Reports",
            const Color(0xFF00C48C),
          ),
        ),

        spaceWidth(12),

        Expanded(
          child: _statCard(
            "8",
            "Doctors",
            const Color(0xFF8B7CFF),
          ),
        ),
      ],
    );
  }

  Widget _statCard(
      String value,
      String title,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),

        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          spaceHeight(6),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _healthItem({
    required String emoji,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 22),
        ),

        spaceHeight(8),

        Text(
          title,

          style: const TextStyle(
            color: Color(0xFF64748B),
            fontSize: 12,
          ),
        ),

        spaceHeight(4),

        Text(
          value,

          style: const TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,

      style: const TextStyle(
        color: Color(0xFF64748B),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    );
  }

  Widget _menuContainer({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),

        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        children: children,
      ),
    );
  }

  Widget _menuTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    String? trailingText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 18,
      ),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.withOpacity(0.12),
            ),

            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),

          spaceWidth(14),

          Expanded(
            child: Text(
              title,

              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F172A),
              ),
            ),
          ),

          if (subtitle != null)
            Text(
              subtitle,

              style: const TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),

          if (trailingText != null)
            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFF00D1FF)
                    .withOpacity(0.15),

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Text(
                trailingText,

                style: const TextStyle(
                  color: Color(0xFF00D1FF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),

          spaceWidth(10),

          const Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF94A3B8),
          ),
        ],
      ),
    );
  }

  Widget _switchTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.85),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],

        border: Border.all(
          color: Colors.white.withOpacity(0.7),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),

        child: Row(
          children: [
            /// ICON CONTAINER
            Container(
              width: 42,
              height: 42,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.12),
              ),

              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),

            spaceWidth(16),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    value ? "Enabled" : "Disabled",

                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: value
                          ? const Color(0xFF00C48C)
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),

            /// CUSTOM SWITCH
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              width: 58,
              height: 32,

              padding: const EdgeInsets.all(4),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                gradient: value
                    ? const LinearGradient(
                  colors: [
                    Color(0xFF00D1FF),
                    Color(0xFF8B7CFF),
                  ],
                )
                    : null,

                color: value
                    ? null
                    : Colors.grey.shade300,
              ),

              child: InkWell(
                onTap: () => onChanged(!value),

                borderRadius: BorderRadius.circular(30),

                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 250),

                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,

                  child: Container(
                    width: 24,
                    height: 24,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      color: Colors.grey.shade200,
      indent: 18,
      endIndent: 18,
    );
  }
}
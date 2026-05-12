import 'package:flutter/material.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../widget/help_widget.dart';
import 'home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        appBackground(),
        Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
                bottom: 120,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  spaceHeight(24),

                  _searchField(),
                  spaceHeight(28),

                  _aiInsightCard(),
                  spaceHeight(28),

                  _sectionTitle("Quick Actions"),
                  spaceHeight(16),

                  _quickActions(),
                  spaceHeight(28),

                  _featuredHospitals(),
                  spaceHeight(28),

                  _appointmentCard(),
                  spaceHeight(28),

                  _recoveryCard(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // ================= HEADER =================

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),

              child: const Icon(Icons.menu, color: Color(0xFF0F172A)),
            ),

            spaceWidth(14),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [
                Text(
                  "Good Morning",
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                ),

                Text(
                  "Sarah Wilson",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ],
        ),

        Row(
          children: [
            _topIcon(Icons.account_balance_wallet_outlined),
            spaceWidth(10),
            _topIcon(Icons.notifications_none),
          ],
        ),
      ],
    );
  }

  Widget _topIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),

      child: Icon(icon, color: const Color(0xFF00D1FF)),
    );
  }

  // ================= SEARCH =================

  Widget _searchField() {
    return Container(
      height: 58,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,

          hintText: "Search hospitals, doctors...",

          hintStyle: const TextStyle(color: Color(0xFF94A3B8)),

          prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),

          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  // ================= AI CARD =================

  Widget _aiInsightCard() {
    return Container(
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),

        gradient: const LinearGradient(
          colors: [Color(0xFF00D1FF), Color(0xFF8B7CFF)],
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: const Icon(Icons.auto_awesome, color: Colors.white),
              ),

              spaceWidth(14),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "AI Health Insights",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    Text(
                      "Powered by Advanced AI",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),

          spaceHeight(24),

          const Text(
            "🎉 Excellent progress! Your recovery is 92% complete.",
            style: TextStyle(color: Colors.white, height: 1.5, fontSize: 16),
          ),

          spaceHeight(20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: 0.92,
              minHeight: 10,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            ),
          ),

          spaceHeight(26),

          SizedBox(
            width: double.infinity,
            height: 54,

            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),

              child: const Text(
                "View Full Report",
                style: TextStyle(
                  color: Color(0xFF00D1FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= QUICK ACTION =================

  Widget _quickActions() {
    final items = [
      {
        "icon": Icons.local_hospital,
        "title": "Hospitals",
        "color": const Color(0xFF00D1FF),
      },
      {
        "icon": Icons.calendar_month,
        "title": "Book",
        "color": const Color(0xFF00C48C),
      },
      {
        "icon": Icons.flight,
        "title": "Travel",
        "color": const Color(0xFF8B7CFF),
      },
      {
        "icon": Icons.shield_outlined,
        "title": "Insurance",
        "color": const Color(0xFFFF6B9D),
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: items.map((e) {
        return Column(
          children: [
            Container(
              width: 72,
              height: 72,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),

              child: Icon(
                e["icon"] as IconData,
                color: e["color"] as Color,
                size: 32,
              ),
            ),

            spaceHeight(10),

            Text(
              e["title"] as String,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        );
      }).toList(),
    );
  }

  // ================= HOSPITALS =================

  Widget _featuredHospitals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: const [
            Text(
              "Featured Hospitals",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Text(
              "View All",
              style: TextStyle(
                color: Color(0xFF00D1FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        spaceHeight(18),

        _hospitalCard(
          name: "Apollo Hospital",
          location: "New Delhi, India",
          rating: "4.9",
          price: "\$3,500",
        ),

        spaceHeight(16),

        _hospitalCard(
          name: "Bumrungrad Hospital",
          location: "Bangkok, Thailand",
          rating: "4.8",
          price: "\$2,800",
        ),
      ],
    );
  }

  Widget _hospitalCard({
    required String name,
    required String location,
    required String rating,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),

              gradient: const LinearGradient(
                colors: [Color(0xFF00D1FF), Color(0xFF8B7CFF)],
              ),
            ),

            child: const Center(
              child: Text("🏥", style: TextStyle(fontSize: 38)),
            ),
          ),

          spaceWidth(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                spaceHeight(6),

                Text(
                  location,
                  style: const TextStyle(color: Color(0xFF64748B)),
                ),

                spaceHeight(10),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),

                    spaceWidth(4),

                    Text(
                      rating,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const Spacer(),

                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF00D1FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= APPOINTMENT =================

  Widget _appointmentCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _sectionTitle("Next Appointment"),

        spaceHeight(18),

        Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),

          child: Row(
            children: [
              Container(
                width: 72,
                height: 72,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D1FF), Color(0xFF8B7CFF)],
                  ),
                ),

                child: const Center(
                  child: Text("👨‍⚕️", style: TextStyle(fontSize: 34)),
                ),
              ),

              spaceWidth(16),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Dr. James Chen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Senior Cardiologist",
                      style: TextStyle(color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                child: const Text(
                  "Join",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recoveryCard() {
    return Container(
      padding: const EdgeInsets.all(24),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recovery Progress",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "92%",
                    style: TextStyle(
                      color: Color(0xFF00C48C),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(Icons.trending_up, color: Colors.green, size: 35),
              ),
            ],
          ),
          spaceHeight(18),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),

            child: LinearProgressIndicator(
              value: 0.92,
              minHeight: 12,
              backgroundColor: const Color(0xFFF1F5F9),
              valueColor: const AlwaysStoppedAnimation(Color(0xFF00C48C)),
            ),
          ),
          spaceHeight(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              _subItemCard(
                Icons.directions_walk,
                const Color(0xFF00D1FF),
                const Color(0xFFE0F7FF),
                "Mobility",
                "95%",
              ),

              _subItemCard(
                Icons.favorite,
                const Color(0xFFFF6B9D),
                const Color(0xFFFFE8F0),
                "Medication",
                "88%",
              ),

              _subItemCard(
                Icons.trending_up,
                const Color(0xFF00C48C),
                const Color(0xFFE0FFF4),
                "Wellness",
                "93%",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _subItemCard(
    IconData icon,
    Color iconColor,
    Color iconBackgroundColor,
    String title,
    String percentage,
  ) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconBackgroundColor,
          ),

          child: Icon(icon, color: iconColor, size: 28),
        ),
        spaceHeight(10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF64748B),
          ),
        ),
        spaceHeight(4),
        Text(
          percentage,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Color(0xFF0F172A),
      ),
    );
  }
}

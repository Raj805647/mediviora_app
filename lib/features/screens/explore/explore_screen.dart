import 'package:flutter/material.dart';
import 'package:mediviora_app/widget/custom_button.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widget/help_widget.dart';
import '../../../widget/ui_design.dart';
import 'explore_provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            appBackground(),

            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 16,
                  bottom: 120,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    /// TITLE
                    const Text(
                      "Explore Treatments",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),

                    spaceHeight(24),

                    /// SEARCH
                    _searchField(),

                    spaceHeight(16),

                    /// FILTER BUTTON
                    _filterButton(),

                    spaceHeight(30),

                    /// CATEGORY TITLE
                    _sectionTitle("Treatment Categories"),

                    spaceHeight(18),

                    /// CATEGORY GRID
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      itemCount: provider.categories.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                            childAspectRatio: 0.9,
                          ),

                      itemBuilder: (context, index) {
                        final item = provider.categories[index];

                        return _categoryCard(
                          title: item["title"] as String,
                          emoji: item["emoji"] as String,
                          count: item["count"] as String,
                          isHot: item["hot"] as bool,
                        );
                      },
                    ),

                    spaceHeight(30),

                    /// DESTINATION TITLE
                    _sectionTitle("Popular Destinations"),

                    spaceHeight(18),

                    Column(
                      children: provider.destinations.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),

                          child: _destinationCard(
                            country: e["country"] as String,
                            flag: e["flag"] as String,
                            hospital: e["hospital"] as String,
                            save: e["save"] as String,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ================= SEARCH =================

  Widget _searchField() {
    return Container(
      height: 56,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,

          hintText: "Search treatments, specialties...",

          hintStyle: const TextStyle(color: Color(0xFF94A3B8)),

          prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
        ),
      ),
    );
  }

  Widget _filterButton() {
    return SizedBox(
      height: 48,
      width: 100,
      child: customGradientButton(icon: Icons.tune, text: 'filter', onTap: () {}),
    );
  }


  Widget _categoryCard({
    required String title,
    required String emoji,
    required String count,
    required bool isHot,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Align(
            alignment: Alignment.topRight,

            child: isHot
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6B9D), Color(0xFFFF9F40)],
                      ),
                    ),

                    child: const Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Icon(Icons.trending_up, color: Colors.white, size: 14),

                        SizedBox(width: 4),

                        Text(
                          "Hot",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),

          const Spacer(),

          Text(emoji, style: const TextStyle(fontSize: 46)),

          spaceHeight(14),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF0F172A),
            ),
          ),

          spaceHeight(6),

          Text(count, style: const TextStyle(color: Color(0xFF64748B))),
        ],
      ),
    );
  }

  // ================= DESTINATION CARD =================

  Widget _destinationCard({
    required String country,
    required String flag,
    required String hospital,
    required String save,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00D1FF).withOpacity(0.2),
                  const Color(0xFF8B7CFF).withOpacity(0.2),
                ],
              ),
            ),

            child: Center(
              child: Text(flag, style: const TextStyle(fontSize: 38)),
            ),
          ),

          spaceWidth(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  country,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF0F172A),
                  ),
                ),

                spaceHeight(8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Color(0xFF64748B),
                    ),

                    spaceWidth(4),

                    Text(
                      hospital,
                      style: const TextStyle(color: Color(0xFF64748B)),
                    ),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xFF00C48C).withOpacity(0.1),
                      ),

                      child: Text(
                        "Save $save",
                        style: const TextStyle(
                          color: Color(0xFF00C48C),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
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

  // ================= TITLE =================

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
    );
  }
}

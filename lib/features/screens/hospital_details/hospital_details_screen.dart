import 'package:flutter/material.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/help_widget.dart';

class HospitalDetailsScreen extends StatelessWidget {
  const HospitalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hospital = {
      "name": "Apollo Hospital",
      "location": "New Delhi, India",
      "rating": "4.9",
      "reviews": "2847",
      "description":
      "Apollo Hospital is one of Asia's leading integrated healthcare providers with advanced facilities and expert doctors.",
      "specialties": [
        "Cardiology",
        "Oncology",
        "Orthopedics",
        "Neurology",
      ],
      "facilities": [
        "24/7 Emergency",
        "ICU & NICU",
        "Diagnostics",
        "Patient Desk",
        "Pharmacy",
        "Rehabilitation",
      ],
      "doctors": [
        {
          "name": "Dr. Sarah Johnson",
          "specialty": "Cardiologist",
          "experience": "15 years",
          "rating": "4.9",
          "avatar": "👩‍⚕️",
        },
        {
          "name": "Dr. Michael Chen",
          "specialty": "Orthopedic Surgeon",
          "experience": "20 years",
          "rating": "4.8",
          "avatar": "👨‍⚕️",
        },
      ]
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// HERO
            Stack(
              children: [

                Container(
                  height: 280,
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00D1FF),
                        Color(0xFF8B7CFF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Opacity(
                    opacity: 0.08,
                    child: GridPaper(
                      color: Colors.white,
                      divisions: 2,
                      interval: 40,
                    ),
                  ),
                ),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Row(
                      children: [

                        /// BACK
                        GestureDetector(
                          onTap: () => Navigator.pop(context),

                          child: glassContainer(
                            padding: const EdgeInsets.all(12),

                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),

                        const Spacer(),

                        /// FAVORITE
                        glassContainer(
                          padding: const EdgeInsets.all(12),

                          child: const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 120,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.18),

                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "🏥",
                          style: TextStyle(fontSize: 60),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Transform.translate(
              offset: const Offset(0, -35),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  children: [

                    /// MAIN CARD
                    glassContainer(
                      radius: 28,
                      padding: const EdgeInsets.all(22),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// NAME
                          Text(
                            hospital["name"].toString(),

                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),

                          const SizedBox(height: 10),

                          /// LOCATION
                          Row(
                            children: [

                              Icon(
                                Icons.location_on_rounded,
                                size: 18,
                                color: Colors.grey.shade600,
                              ),

                              const SizedBox(width: 6),

                              Expanded(
                                child: Text(
                                  hospital["location"].toString(),

                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          /// RATING
                          Row(
                            children: [

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: const Color(0xFF00C48C)
                                      .withOpacity(0.12),

                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: Row(
                                  children: [

                                    const Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFF00C48C),
                                      size: 18,
                                    ),

                                    const SizedBox(width: 5),

                                    Text(
                                      hospital["rating"].toString(),

                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00C48C),
                                      ),
                                    ),

                                    const SizedBox(width: 5),

                                    Text(
                                      "(${hospital["reviews"]} reviews)",

                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 10),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: const Color(0xFF00D1FF)
                                      .withOpacity(0.12),

                                  borderRadius: BorderRadius.circular(16),
                                ),

                                child: const Row(
                                  children: [

                                    Icon(
                                      Icons.verified_rounded,
                                      color: Color(0xFF00D1FF),
                                      size: 18,
                                    ),

                                    SizedBox(width: 5),

                                    Text(
                                      "Verified",

                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00D1FF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          /// DESCRIPTION
                          Text(
                            hospital["description"].toString(),

                            style: TextStyle(
                              height: 1.5,
                              color: Colors.grey.shade700,
                            ),
                          ),

                          const SizedBox(height: 22),

                          /// SPECIALITIES
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,

                            children: (hospital["specialties"]
                            as List<String>)
                                .map(
                                  (e) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: const Color(0xFF8B7CFF)
                                      .withOpacity(0.12),
                                ),

                                child: Text(
                                  e,

                                  style: const TextStyle(
                                    color: Color(0xFF8B7CFF),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    /// STATS
                    Row(
                      children: [

                        Expanded(
                          child: _statCard(
                            icon: Icons.bed_rounded,
                            value: "500+",
                            title: "Beds",
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _statCard(
                            icon: Icons.people_alt_rounded,
                            value: "250+",
                            title: "Doctors",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [

                        Expanded(
                          child: _statCard(
                            icon: Icons.emoji_events_rounded,
                            value: "50+",
                            title: "Awards",
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: _statCard(
                            icon: Icons.favorite_rounded,
                            value: "98%",
                            title: "Success",
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// FACILITIES
                    glassContainer(
                      radius: 24,
                      padding: const EdgeInsets.all(22),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            "Facilities & Services",

                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),

                          const SizedBox(height: 18),

                          GridView.builder(
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),

                            itemCount:
                            (hospital["facilities"] as List).length,

                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 45,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),

                            itemBuilder: (_, index) {
                              final item =
                              (hospital["facilities"]
                              as List)[index];

                              return Row(
                                children: [

                                  Container(
                                    width: 10,
                                    height: 10,

                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF00C48C),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// DOCTORS
                    Align(
                      alignment: Alignment.centerLeft,

                      child: const Text(
                        "Top Doctors",

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    ...List.generate(
                      (hospital["doctors"] as List).length,
                          (index) {
                        final doctor =
                        (hospital["doctors"] as List)[index];

                        return Padding(
                          padding:
                          const EdgeInsets.only(bottom: 14),

                          child: glassContainer(
                            radius: 22,
                            padding: const EdgeInsets.all(18),

                            child: Row(
                              children: [

                                Container(
                                  width: 64,
                                  height: 64,

                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(18),

                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFF00D1FF)
                                            .withOpacity(0.15),
                                        const Color(0xFF8B7CFF)
                                            .withOpacity(0.15),
                                      ],
                                    ),
                                  ),

                                  child: Center(
                                    child: Text(
                                      doctor["avatar"].toString(),

                                      style: const TextStyle(
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 16),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        doctor["name"].toString(),

                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                          Color(0xFF0F172A),
                                        ),
                                      ),

                                      const SizedBox(height: 5),

                                      Text(
                                        doctor["specialty"]
                                            .toString(),

                                        style: TextStyle(
                                          color:
                                          Colors.grey.shade600,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      Row(
                                        children: [

                                          Text(
                                            doctor["experience"]
                                                .toString(),

                                            style: TextStyle(
                                              fontSize: 12,
                                              color:
                                              Colors.grey.shade600,
                                            ),
                                          ),

                                          const SizedBox(width: 14),

                                          const Icon(
                                            Icons.star_rounded,
                                            size: 16,
                                            color:
                                            Color(0xFF00C48C),
                                          ),

                                          const SizedBox(width: 4),

                                          Text(
                                            doctor["rating"]
                                                .toString(),

                                            style: const TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
                                              color:
                                              Color(0xFF00C48C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    /// BUTTONS
                    Row(
                      children: [

                        Expanded(
                          child: customGradientButton(
                            text: "Virtual Tour",
                            icon: Icons.videocam_rounded,
                            colors: const [
                              Colors.white,
                              Colors.white,
                            ],
                            onTap: () {},
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: customGradientButton(
                            text: "Book Now",
                            icon: Icons.calendar_month_rounded,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String title,
  }) {
    return glassContainer(
      radius: 22,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 22,
      ),

      child: Column(
        children: [

          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              gradient: LinearGradient(
                colors: [
                  const Color(0xFF00D1FF).withOpacity(0.15),
                  const Color(0xFF8B7CFF).withOpacity(0.15),
                ],
              ),
            ),

            child: Icon(
              icon,
              color: const Color(0xFF00D1FF),
            ),
          ),

          const SizedBox(height: 14),

          Text(
            value,

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,

            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
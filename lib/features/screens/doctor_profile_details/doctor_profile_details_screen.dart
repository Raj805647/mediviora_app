import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'doctor_profile_details_provider.dart';

class DoctorProfileDetailsScreen extends StatelessWidget{
  const DoctorProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorProfileDetailsProvider>(
      builder: (context, provider, child) {
        final doctor = provider.doctor;

        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),

          /// BOTTOM BAR
          bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.92),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 20,
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text("Chat"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF00D1FF),
                        side: const BorderSide(
                          color: Color(0xFF00D1FF),
                        ),
                        minimumSize: const Size(double.infinity, 58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: const Size(double.infinity, 58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00D1FF),
                              Color(0xFF8B7CFF),
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Book Appointment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          body: CustomScrollView(
            slivers: [
              /// APP BAR
              SliverAppBar(
                expandedHeight: 420,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,

                leading: IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF0F172A),
                  ),
                ),

                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: provider.toggleFavorite,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: provider.isFavorite
                              ? const Color(0xFFFF6B9D).withOpacity(.18)
                              : Colors.white,
                          border: Border.all(
                            color: provider.isFavorite
                                ? const Color(0xFFFF6B9D)
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Icon(
                          provider.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: const Color(0xFFFF6B9D),
                        ),
                      ),
                    ),
                  ),
                ],

                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFD9F3FF),
                              Color(0xFFF3F0FF),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 120, 24, 30),
                        child: Column(
                          children: [
                            /// AVATAR
                            Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF00D1FF),
                                        Color(0xFF8B7CFF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(38),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF00D1FF)
                                            .withOpacity(.25),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(34),
                                    child: Image.network(
                                      doctor.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF00C48C),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 4,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.workspace_premium,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            Text(
                              doctor.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              doctor.specialty,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: Color(0xFF64748B),
                                ),

                                const SizedBox(width: 4),

                                Flexible(
                                  child: Text(
                                    doctor.hospital,
                                    style: const TextStyle(
                                      color: Color(0xFF64748B),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _ratingCard(
                                  value: doctor.rating.toString(),
                                  subtitle:
                                  "(${doctor.reviews} Reviews)",
                                ),

                                const SizedBox(width: 12),

                                _badge(
                                  "${doctor.experience} exp.",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// BODY
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// STATS
                      Row(
                        children: [
                          Expanded(
                            child: _statCard(
                              icon: Icons.trending_up,
                              title: "Patients",
                              value: doctor.patients,
                              color: const Color(0xFF00D1FF),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: _statCard(
                              icon: Icons.verified,
                              title: "Success",
                              value: "${doctor.successRate}%",
                              color: const Color(0xFF00C48C),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: _statCard(
                              icon: Icons.calendar_month,
                              title: "Fee",
                              value: doctor.consultationFee,
                              color: const Color(0xFF8B7CFF),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      /// ABOUT
                      _title("About"),

                      const SizedBox(height: 12),

                      _glassCard(
                        child: Text(
                          doctor.about,
                          style: TextStyle(
                            height: 1.7,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      /// SPECIALIZATIONS
                      _title("Specializations"),

                      const SizedBox(height: 14),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: doctor.specializations.map((e) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF8B7CFF)
                                  .withOpacity(.12),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              e,
                              style: const TextStyle(
                                color: Color(0xFF8B7CFF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 28),

                      /// AVAILABLE SLOTS
                      _title("Next Available Slots"),

                      const SizedBox(height: 14),

                      Column(
                        children:
                        List.generate(doctor.availableSlots.length, (i) {
                          final slot = doctor.availableSlots[i];

                          final isSelected =
                              provider.selectedSlot == i;

                          return GestureDetector(
                            onTap: () => provider.selectSlot(i),
                            child: AnimatedContainer(
                              duration:
                              const Duration(milliseconds: 250),
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(22),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF00D1FF)
                                      : Colors.grey.shade200,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.04),
                                    blurRadius: 14,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 54,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(18),
                                      color: slot.type == "Video"
                                          ? const Color(0xFF00D1FF)
                                          .withOpacity(.12)
                                          : const Color(0xFF00C48C)
                                          .withOpacity(.12),
                                    ),
                                    child: Icon(
                                      slot.type == "Video"
                                          ? Icons.videocam_outlined
                                          : Icons.location_on_outlined,
                                      color: slot.type == "Video"
                                          ? const Color(0xFF00D1FF)
                                          : const Color(0xFF00C48C),
                                    ),
                                  ),

                                  const SizedBox(width: 14),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          slot.date,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time,
                                              size: 15,
                                              color: Color(0xFF64748B),
                                            ),

                                            const SizedBox(width: 4),

                                            Text(
                                              slot.time,
                                              style: const TextStyle(
                                                color:
                                                Color(0xFF64748B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    padding:
                                    const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: const Color(0xFF8B7CFF)
                                          .withOpacity(.12),
                                    ),
                                    child: Text(
                                      slot.type,
                                      style: const TextStyle(
                                        color: Color(0xFF8B7CFF),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 120),
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

  static Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
    );
  }

  static Widget _glassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.92),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 14,
          ),
        ],
      ),
      child: child,
    );
  }

  static Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF00D1FF).withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF00D1FF),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget _ratingCard({
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF00C48C).withOpacity(.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            size: 16,
            color: Color(0xFF00C48C),
          ),

          const SizedBox(width: 4),

          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF00C48C),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 4),

          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 14,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: color.withOpacity(.12),
            ),
            child: Icon(icon, color: color),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

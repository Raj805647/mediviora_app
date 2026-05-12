import 'package:flutter/material.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../../../widget/help_widget.dart';
import 'book_appointment_provider.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (_, provider, __) {
        return Scaffold(
          body: Stack(
            children: [

              /// BACKGROUND
              appBackground(),

              SafeArea(
                child: Column(
                  children: [

                    /// HEADER
                    _header(context),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// CONSULTATION TYPE
                            _sectionTitle("Consultation Type"),

                            Row(
                              children: [
                                Expanded(
                                  child: _consultationCard(
                                    title: "Video Call",
                                    icon: Icons.videocam_rounded,
                                    price: "\$150",
                                    isSelected:
                                    provider.isVideoConsultation,
                                    onTap: () {
                                      provider.toggleConsultation(true);
                                    },
                                  ),
                                ),

                                spaceWidth(14),

                                Expanded(
                                  child: _consultationCard(
                                    title: "In-Person",
                                    icon: Icons.location_on_rounded,
                                    price: "\$200",
                                    isSelected:
                                    !provider.isVideoConsultation,
                                    onTap: () {
                                      provider.toggleConsultation(false);
                                    },
                                  ),
                                ),
                              ],
                            ),

                            spaceHeight(28),

                            /// DATE
                            _sectionTitle("Select Date"),

                            Container(
                              padding: const EdgeInsets.all(18),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(24),
                              ),

                              child: Column(
                                children: [

                                  /// MONTH
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                    children: [
                                      const Text(
                                        "May 2026",

                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          _calendarButton(
                                            Icons.chevron_left,
                                          ),

                                          spaceWidth(8),

                                          _calendarButton(
                                            Icons.chevron_right,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  spaceHeight(20),

                                  /// DAYS
                                  GridView.builder(
                                    itemCount: 31,
                                    shrinkWrap: true,
                                    physics:
                                    const NeverScrollableScrollPhysics(),

                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 7,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),

                                    itemBuilder: (_, index) {
                                      final day = index + 1;

                                      final selected =
                                          provider.selectedDate == day;

                                      return GestureDetector(
                                        onTap: () {
                                          provider.selectDate(day);
                                        },

                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(14),

                                            gradient: selected
                                                ? const LinearGradient(
                                              colors: [
                                                Color(0xFF00D1FF),
                                                Color(0xFF8B7CFF),
                                              ],
                                            )
                                                : null,

                                            color: selected
                                                ? null
                                                : Colors.grey.shade100,
                                          ),

                                          child: Center(
                                            child: Text(
                                              "$day",

                                              style: TextStyle(
                                                color: selected
                                                    ? Colors.white
                                                    : const Color(0xFF0F172A),

                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            spaceHeight(28),

                            /// TIME
                            _sectionTitle("Select Time"),

                            Wrap(
                              spacing: 12,
                              runSpacing: 12,

                              children: provider.timeSlots.map((slot) {
                                final selected =
                                    provider.selectedTime ==
                                        slot["time"];

                                return GestureDetector(
                                  onTap: slot["available"]
                                      ? () {
                                    provider.selectTime(
                                      slot["time"],
                                    );
                                  }
                                      : null,

                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 14,
                                    ),

                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(16),

                                      gradient: selected
                                          ? const LinearGradient(
                                        colors: [
                                          Color(0xFF00D1FF),
                                          Color(0xFF8B7CFF),
                                        ],
                                      )
                                          : null,

                                      color: selected
                                          ? null
                                          : slot["available"]
                                          ? Colors.white
                                          : Colors.grey.shade200,
                                    ),

                                    child: Text(
                                      slot["time"],

                                      style: TextStyle(
                                        color: selected
                                            ? Colors.white
                                            : slot["available"]
                                            ? const Color(0xFF0F172A)
                                            : Colors.grey,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                            spaceHeight(28),

                            /// PATIENT DETAILS
                            _sectionTitle("Patient Details"),

                            glassContainer(
                              padding: const EdgeInsets.all(18),

                              child: Column(
                                children: [

                                  customTextField(
                                    label: "Full Name",
                                    hintText: "Sarah Wilson",
                                    prefixIcon: Icons.person_outline,
                                    controller:
                                    provider.nameController,
                                  ),

                                  spaceHeight(18),

                                  customTextField(
                                    label: "Phone Number",
                                    hintText: "+1 000 000 000",
                                    prefixIcon: Icons.phone_outlined,
                                    controller:
                                    provider.phoneController,
                                  ),

                                  spaceHeight(18),

                                  customTextField(
                                    label: "Additional Notes",
                                    hintText: "Write here...",
                                    prefixIcon: Icons.note_alt_outlined,
                                    controller:
                                    provider.notesController,
                                    // maxLines: 4,
                                  ),
                                ],
                              ),
                            ),

                            spaceHeight(28),

                            /// SUMMARY
                            _bookingSummary(provider),

                            spaceHeight(120),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// BOTTOM BUTTON
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,

                child: customGradientButton(
                  text: "Proceed to Payment",

                  icon: Icons.arrow_forward_rounded,

                  onTap: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Row(
        children: [

          GestureDetector(
            onTap: () => Navigator.pop(context),

            child: Container(
              width: 46,
              height: 46,

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(14),
              ),

              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),

          spaceWidth(16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              Text(
                "Book Appointment",

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),

              SizedBox(height: 4),

              Text(
                "Dr. Sarah Johnson",

                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Text(
        title,

        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0F172A),
        ),
      ),
    );
  }

  Widget _consultationCard({
    required String title,
    required IconData icon,
    required String price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),

          gradient: isSelected
              ? const LinearGradient(
            colors: [
              Color(0x2200D1FF),
              Color(0x228B7CFF),
            ],
          )
              : null,

          color: isSelected ? null : Colors.white.withOpacity(0.9),

          border: Border.all(
            color: isSelected
                ? const Color(0xFF00D1FF)
                : Colors.white,
            width: 2,
          ),
        ),

        child: Column(
          children: [

            Container(
              width: 56,
              height: 56,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF00D1FF).withOpacity(0.12),
              ),

              child: Icon(
                icon,
                color: const Color(0xFF00D1FF),
                size: 28,
              ),
            ),

            spaceHeight(14),

            Text(
              title,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            spaceHeight(6),

            Text(
              price,

              style: const TextStyle(
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calendarButton(IconData icon) {
    return Container(
      width: 34,
      height: 34,

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Icon(
        icon,
        size: 18,
      ),
    );
  }

  Widget _bookingSummary(BookingProvider provider) {
    return glassContainer(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Booking Summary",

            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          spaceHeight(18),

          _summaryRow(
            "Consultation",
            provider.isVideoConsultation
                ? "Video Call"
                : "In-Person",
          ),

          _summaryRow(
            "Date",
            "May ${provider.selectedDate}, 2026",
          ),

          _summaryRow(
            "Time",
            provider.selectedTime,
          ),

          const Divider(height: 30),

          _summaryRow(
            "Total",
            provider.isVideoConsultation
                ? "\$150"
                : "\$200",

            isPrice: true,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
      String title,
      String value, {
        bool isPrice = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,

            style: const TextStyle(
              color: Color(0xFF64748B),
            ),
          ),

          Text(
            value,

            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isPrice
                  ? const Color(0xFF00D1FF)
                  : const Color(0xFF0F172A),

              fontSize: isPrice ? 18 : 15,
            ),
          ),
        ],
      ),
    );
  }
}
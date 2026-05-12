import 'package:flutter/material.dart';
import 'package:mediviora_app/features/screens/book_appointment/book_appointment_provider.dart';
import 'package:mediviora_app/features/screens/schedule/schedule_provider.dart';
import 'package:mediviora_app/routes/route_names.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../widget/custom_button.dart';
import '../../../widget/help_widget.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),

          body: Stack(
            children: [
              appBackground(),

              SafeArea(
                child: Column(
                  children: [
                    _header(provider),

                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: provider.appointments.length,
                        separatorBuilder: (_, __) => spaceHeight(16),

                        itemBuilder: (context, index) {
                          final appointment = provider.appointments[index];

                          return _appointmentCard(context, appointment, provider);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// HEADER
  Widget _header(ScheduleProvider provider) {
    return Container(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Appointments",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),

                    spaceHeight(4),

                    Text(
                      "${provider.appointments.length} scheduled",
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D1FF), Color(0xFF8B7CFF)],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00D1FF).withOpacity(0.25),
                      blurRadius: 12,
                    ),
                  ],
                ),

                child: const Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ],
          ),

          spaceHeight(20),

          /// TABS
          Row(
            children: List.generate(provider.tabs.length, (index) {
              final isSelected = provider.selectedTab == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () => provider.changeTab(index),

                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),

                    padding: const EdgeInsets.symmetric(vertical: 12),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),

                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [Color(0xFF00D1FF), Color(0xFF8B7CFF)],
                            )
                          : null,

                      color: isSelected ? null : Colors.white,
                    ),

                    child: Center(
                      child: Text(
                        provider.tabs[index],

                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// APPOINTMENT CARD
  Widget _appointmentCard(BuildContext context, Map<String, dynamic> appointment, ScheduleProvider provider) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),

        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          /// TOP
          Row(
            children: [
              Container(
                width: 60,
                height: 60,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),

                  color: (appointment["color"] as Color).withOpacity(0.15),
                ),

                child: Center(
                  child: Text(
                    appointment["avatar"],
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),

              spaceWidth(14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      appointment["doctor"],

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF0F172A),
                      ),
                    ),

                    spaceHeight(4),

                    Text(
                      appointment["specialty"],

                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                  color: (appointment["color"] as Color).withOpacity(0.15),
                ),

                child: Text(
                  appointment["status"],

                  style: TextStyle(
                    color: appointment["color"],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          spaceHeight(18),

          /// HOSPITAL
          _infoContainer(
            icon: Icons.location_on_outlined,
            text: appointment["hospital"],
          ),

          spaceHeight(14),

          /// DATE & TIME
          Row(
            children: [
              Expanded(
                child: _dateTimeBox(
                  icon: Icons.calendar_month,
                  text: appointment["date"],
                  color: const Color(0xFF00D1FF),
                ),
              ),

              spaceWidth(12),

              Expanded(
                child: _dateTimeBox(
                  icon: Icons.access_time,
                  text: appointment["time"],
                  color: const Color(0xFF00C48C),
                ),
              ),
            ],
          ),

          spaceHeight(18),

          /// BUTTONS
          Row(
            children: [
              Expanded(
                child: customGradientButton(
                  text: appointment["type"] == "Video Consultation"
                      ? "Join Video Call"
                      : "Get Directions",

                  onTap: ()=> provider.navigateTo(context, RouteNames.bookAppointmentScreen),

                  height: 50,

                  colors: appointment["type"] == "Video Consultation"
                      ? const [Color(0xFF00D1FF), Color(0xFF8B7CFF)]
                      : const [Color(0xFF00C48C), Color(0xFF00D1FF)],

                  icon:
                    appointment["type"] == "Video Consultation"
                        ? Icons.videocam_outlined
                        : Icons.location_on_outlined,

                ),
              ),

              spaceWidth(12),

              Container(
                width: 50,
                height: 50,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),

                  color: Colors.white,

                  border: Border.all(color: Colors.grey.shade200),
                ),

                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoContainer({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF64748B)),

          spaceWidth(10),

          Expanded(
            child: Text(text, style: const TextStyle(color: Color(0xFF64748B))),
          ),
        ],
      ),
    );
  }

  Widget _dateTimeBox({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color.withOpacity(0.12),
      ),

      child: Row(
        children: [
          Icon(icon, size: 18, color: color),

          spaceWidth(8),

          Expanded(
            child: Text(
              text,

              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

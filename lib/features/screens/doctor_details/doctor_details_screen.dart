import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _avatarController;

  final doctor = {
    "name": "Dr. Sarah Johnson",
    "specialty": "Senior Cardiologist",
    "hospital": "Apollo Hospital, New Delhi",
    "rating": "4.9",
    "reviews": "1234",
    "experience": "15 years",
    "patients": "5000+",
    "successRate": "98%",
    "fee": "\$150",
  };

  final List<String> specializations = [
    "Interventional Cardiology",
    "Heart Failure",
    "Preventive Cardiology",
    "Cardiac Imaging",
  ];

  final List<String> education = [
    "MD - Cardiology, Harvard Medical School",
    "MBBS - AIIMS",
  ];

  final List<String> certifications = [
    "Board Certified Cardiologist",
    "Fellow of American College of Cardiology",
    "Advanced Cardiac Life Support Certified",
  ];

  final List<String> languages = [
    "English",
    "Hindi",
    "Spanish",
  ];

  final List<Map<String, dynamic>> slots = [
    {
      "date": "Today",
      "time": "2:00 PM",
      "type": "Video",
      "icon": Icons.videocam_rounded,
      "color": Color(0xFF00D1FF),
    },
    {
      "date": "Tomorrow",
      "time": "10:30 AM",
      "type": "Clinic",
      "icon": Icons.location_on_rounded,
      "color": Color(0xFF00C48C),
    },
    {
      "date": "May 12",
      "time": "3:00 PM",
      "type": "Video",
      "icon": Icons.videocam_rounded,
      "color": Color(0xFF8B7CFF),
    },
  ];

  @override
  void initState() {
    super.initState();

    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FBFF),

      body: Stack(
        children: [
          /// TOP GRADIENT
          Container(
            height: 360,

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

          SafeArea(
            child: Column(
              children: [
                /// BODY
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 12,
                      bottom: 120,
                    ),

                    child: Column(
                      children: [
                        /// HEADER
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [
                            _glassButton(
                              icon: Icons.arrow_back_ios_new_rounded,
                              onTap: () => Navigator.pop(context),
                            ),

                            _glassButton(
                              icon: Icons.favorite_border_rounded,
                              iconColor: const Color(0xFFFF5C93),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        /// PROFILE
                        _profileHeader(),

                        const SizedBox(height: 24),

                        /// STATS
                        Row(
                          children: [
                            Expanded(
                              child: _statCard(
                                title: "Patients",
                                value: doctor["patients"]!,
                                icon: Icons.trending_up_rounded,
                                color: const Color(0xFF00D1FF),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: _statCard(
                                title: "Success",
                                value: doctor["successRate"]!,
                                icon: Icons.workspace_premium_rounded,
                                color: const Color(0xFF00C48C),
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: _statCard(
                                title: "Fee",
                                value: doctor["fee"]!,
                                icon: Icons.calendar_month_rounded,
                                color: const Color(0xFF8B7CFF),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 22),

                        _sectionTitle("About"),
                        _glassContainer(
                          child: Text(
                            "Dr. Sarah Johnson is a highly experienced cardiologist with over 15 years of clinical practice. She specializes in advanced cardiac care and has successfully treated thousands of patients worldwide.",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              height: 1.6,
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        _sectionTitle("Specializations"),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,

                          children: specializations
                              .map(
                                (e) => _chip(
                              text: e,
                              color: const Color(0xFF8B7CFF),
                            ),
                          )
                              .toList(),
                        ),

                        const SizedBox(height: 22),

                        _sectionTitle("Education"),

                        _glassContainer(
                          child: Column(
                            children: education
                                .map(
                                  (e) => Padding(
                                padding:
                                const EdgeInsets.only(bottom: 14),

                                child: Row(
                                  children: [
                                    Container(
                                      width: 42,
                                      height: 42,

                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(14),

                                        color: const Color(
                                          0xFF00D1FF,
                                        ).withOpacity(.12),
                                      ),

                                      child: const Icon(
                                        Icons.school_rounded,
                                        color: Color(0xFF00D1FF),
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    Expanded(
                                      child: Text(
                                        e,

                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0F172A),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ),

                        const SizedBox(height: 22),

                        _sectionTitle("Certifications"),

                        _glassContainer(
                          child: Column(
                            children: certifications
                                .map(
                                  (e) => Padding(
                                padding:
                                const EdgeInsets.only(bottom: 14),

                                child: Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,

                                      decoration: const BoxDecoration(
                                        color: Color(0xFF00C48C),
                                        shape: BoxShape.circle,
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    Expanded(
                                      child: Text(
                                        e,

                                        style: const TextStyle(
                                          color: Color(0xFF0F172A),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ),

                        const SizedBox(height: 22),

                        _sectionTitle("Languages"),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,

                          children: languages
                              .map(
                                (e) => _chip(
                              text: e,
                              color: Colors.white,
                              textColor: const Color(0xFF0F172A),
                            ),
                          )
                              .toList(),
                        ),

                        const SizedBox(height: 22),

                        _sectionTitle("Available Slots"),

                        Column(
                          children: slots
                              .map(
                                (slot) => Padding(
                              padding:
                              const EdgeInsets.only(bottom: 14),

                              child: _slotCard(slot),
                            ),
                          )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM ACTIONS
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 26),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),

                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 20,
                  ),
                ],
              ),

              child: Row(
                children: [
                  Expanded(
                    child: _outlineButton(),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: _gradientButton(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileHeader() {
    return Column(
      children: [
        /// AVATAR
        AnimatedBuilder(
          animation: _avatarController,

          builder: (_, child) {
            return Transform(
              alignment: Alignment.center,

              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_avatarController.value * 6.28),

              child: child,
            );
          },

          child: Stack(
            children: [
              Container(
                width: 110,
                height: 110,
                padding: const EdgeInsets.all(4),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00D1FF),
                      Color(0xFF8B7CFF),
                    ],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00D1FF)
                          .withOpacity(.25),
                      blurRadius: 25,
                      spreadRadius: 4,
                    ),
                  ],
                ),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),

                  child: const Center(
                    child: Text(
                      "👩‍⚕️",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,

                child: Container(
                  width: 32,
                  height: 32,

                  decoration: BoxDecoration(
                    color: const Color(0xFF00C48C),
                    shape: BoxShape.circle,

                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),

                  child: const Icon(
                    Icons.workspace_premium_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Text(
          doctor["name"]!,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          doctor["specialty"]!,
          style: TextStyle(
            color: Colors.white.withOpacity(.9),
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_rounded,
              color: Colors.white,
              size: 18,
            ),

            const SizedBox(width: 6),

            Text(
              doctor["hospital"]!,
              style: TextStyle(
                color: Colors.white.withOpacity(.9),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.15),
            borderRadius: BorderRadius.circular(18),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                color: Color(0xFF00FFB2),
                size: 20,
              ),

              const SizedBox(width: 6),

              Text(
                doctor["rating"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 6),

              Text(
                "(${doctor["reviews"]})",
                style: TextStyle(
                  color: Colors.white.withOpacity(.8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _slotCard(Map<String, dynamic> slot) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: (slot["color"] as Color).withOpacity(.12),
            ),

            child: Icon(
              slot["icon"],
              color: slot["color"],
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slot["date"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  slot["time"],
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFF00D1FF).withOpacity(.12),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Text(
              "Book",

              style: const TextStyle(
                color: Color(0xFF00D1FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.9),
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: color.withOpacity(.12),
            ),

            child: Icon(icon, color: color, size: 20),
          ),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color(0xFF0F172A),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _glassContainer({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.85),
        borderRadius: BorderRadius.circular(24),

        border: Border.all(
          color: Colors.white,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
          ),
        ],
      ),

      child: child,
    );
  }

  Widget _chip({
    required String text,
    required Color color,
    Color textColor = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(14),

        border: Border.all(
          color: color.withOpacity(.15),
        ),
      ),

      child: Text(
        text,

        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          title,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ),
    );
  }

  Widget _glassButton({
    required IconData icon,
    VoidCallback? onTap,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 48,
        height: 48,

        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.16),
          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: Colors.white.withOpacity(.25),
          ),
        ),

        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }

  Widget _outlineButton() {
    return Container(
      height: 56,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: const Color(0xFF00D1FF),
          width: 1.5,
        ),
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            color: Color(0xFF00D1FF),
          ),

          SizedBox(width: 10),

          Text(
            "Chat",

            style: TextStyle(
              color: Color(0xFF00D1FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _gradientButton() {
    return Container(
      height: 56,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        gradient: const LinearGradient(
          colors: [
            Color(0xFF00D1FF),
            Color(0xFF8B7CFF),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D1FF).withOpacity(.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: const Center(
        child: Text(
          "Book Appointment",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
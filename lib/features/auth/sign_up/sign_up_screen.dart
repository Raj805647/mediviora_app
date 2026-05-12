import 'package:flutter/material.dart';
import 'package:mediviora_app/features/auth/sign_up/sign_up_provider.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_images.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_textfield.dart';
import '../../../widget/help_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpProvider>();

    return Scaffold(
      body: Stack(
        children: [
appBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// BACK
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Color(0xFF64748B),
                      ),

                      Text(
                        "Back",

                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                spaceHeight(30),

                /// LOGO
                Center(
                  child: Column(
                    children: [
                      Image.asset(AppImages.appLogo, width: 150),

                      spaceHeight(20),

                      const Text(
                        "Create Account",

                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),

                      spaceHeight(10),

                      const Text(
                        "Join thousands of patients finding world-class care",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),

                spaceHeight(30),

                /// PROGRESS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: List.generate(2, (index) {
                    final isActive = index + 1 <= provider.currentStep;

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),

                      width: 70,
                      height: 6,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        gradient: isActive
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF00D1FF),
                                  Color(0xFF8B7CFF),
                                ],
                              )
                            : null,

                        color: isActive ? null : Colors.grey.shade300,
                      ),
                    );
                  }),
                ),

                spaceHeight(30),

                /// FORM CARD
                Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),

                    borderRadius: BorderRadius.circular(32),

                    border: Border.all(color: Colors.white),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),

                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: provider.currentStep == 1
                      ? _stepOne(provider)
                      : _stepTwo(provider, context),
                ),

                spaceHeight(30),

                /// LOGIN
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text(
                          "Sign In",

                          style: TextStyle(
                            color: Color(0xFF00D1FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// STEP 1
  Widget _stepOne(SignUpProvider provider) {
    return Column(
      children: [
        customTextField(
          label: 'Full Name',
          hintText: 'John Doe',

          prefixIcon: Icons.person_outline,

          controller: provider.fullNameController,
        ),

        spaceHeight(20),

        customTextField(
          label: 'Email Address',
          hintText: 'you@example.com',

          prefixIcon: Icons.mail_outline,

          controller: provider.emailController,
        ),

        spaceHeight(20),

        customTextField(
          label: 'Phone Number',
          hintText: '+1 (555) 000-0000',

          prefixIcon: Icons.phone_outlined,

          controller: provider.phoneController,
        ),

        spaceHeight(30),

        customGradientButton(text: "Continue", onTap: provider.nextStep),
      ],
    );
  }

  /// STEP 2
  Widget _stepTwo(SignUpProvider provider, BuildContext context) {
    return Column(
      children: [
        /// COUNTRY
        DropdownButtonFormField<String>(
          value: provider.selectedCountry.isEmpty
              ? null
              : provider.selectedCountry,

          decoration: InputDecoration(
            labelText: "Country",

            filled: true,
            fillColor: Colors.white.withOpacity(0.8),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),

              borderSide: BorderSide.none,
            ),
          ),

          items: provider.countries.map((country) {
            final value = "${country['flag']} ${country['name']}";

            return DropdownMenuItem(value: value, child: Text(value));
          }).toList(),

          onChanged: (value) {
            provider.selectCountry(value ?? '');
          },
        ),

        spaceHeight(20),

        /// PASSWORD
        customTextField(
          label: 'Password',
          hintText: 'Create strong password',

          prefixIcon: Icons.lock_outline,

          controller: provider.passwordController,

          obscureText: provider.obscurePassword,

          suffixIcon: IconButton(
            onPressed: provider.togglePassword,

            icon: Icon(
              provider.obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
        ),

        spaceHeight(20),

        /// CONFIRM PASSWORD
        customTextField(
          label: 'Confirm Password',
          hintText: 'Confirm password',

          prefixIcon: Icons.lock_outline,

          controller: provider.confirmPasswordController,

          obscureText: provider.obscureConfirmPassword,

          suffixIcon: IconButton(
            onPressed: provider.toggleConfirmPassword,

            icon: Icon(
              provider.obscureConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          ),
        ),

        spaceHeight(20),

        /// TERMS
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Checkbox(
              value: provider.acceptTerms,

              onChanged: (value) {
                provider.toggleTerms(value ?? false);
              },
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),

                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 13),

                    children: [
                      TextSpan(text: "I agree to the "),

                      TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                          color: Color(0xFF00D1FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(text: " and "),

                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: Color(0xFF00D1FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        spaceHeight(30),

        /// CREATE ACCOUNT
        customGradientButton(
          text: "Create Account",

          isLoading: provider.isLoading,

          colors: const [Color(0xFF00C48C), Color(0xFF00D1FF)],

          onTap: () {
            provider.signUp(context);
          },
        ),
      ],
    );
  }
}

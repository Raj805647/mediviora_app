import 'package:flutter/material.dart';
import 'package:mediviora_app/features/auth/sign_in/sign_in_provider.dart';
import 'package:mediviora_app/routes/route_names.dart';
import 'package:mediviora_app/widget/custom_button.dart';
import 'package:mediviora_app/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_images.dart';
import '../../../widget/help_widget.dart';
import '../../../widget/ui_design.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  late final AnimationController backgroundController;

  @override
  void initState() {
    super.initState();

    backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignInProvider>();

    return Scaffold(
      body: Stack(
        children: [
          appBackground(),
          _animatedGlow(),
          _floatingEmoji(emoji: "🏥", top: 100, right: 20),
          _floatingEmoji(emoji: "💊", top: 220, left: 20),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),

                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.9, end: 1.0),

                  duration: const Duration(milliseconds: 700),

                  curve: Curves.easeOutBack,

                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,

                      child: Opacity(
                        opacity: value.clamp(0.0, 1.0),
                        child: child,
                      ),
                    );
                  },

                  child: Column(
                    children: [
                      /// Logo
                      _logoSection(),

                      spaceHeight(30),

                      /// Form Card
                      _formCard(provider),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animatedGlow() {
    return AnimatedBuilder(
      animation: backgroundController,

      builder: (_, __) {
        return Stack(
          children: [
            Positioned(
              top: 50,
              right: -80,

              child: Container(
                width: 320,
                height: 320,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(
                    0xFF00D1FF,
                  ).withOpacity(0.15 + backgroundController.value * 0.1),
                ),
              ),
            ),

            Positioned(
              bottom: -100,
              left: -100,

              child: Container(
                width: 320,
                height: 320,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: const Color(
                    0xFF8B7CFF,
                  ).withOpacity(0.15 + backgroundController.value * 0.1),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _floatingEmoji({
    required String emoji,
    double? top,
    double? left,
    double? right,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),

      duration: const Duration(seconds: 2),

      curve: Curves.easeInOut,

      builder: (_, value, child) {
        return Positioned(
          top: top != null ? top - (value * 20) : null,

          left: left,

          right: right,

          child: Transform.rotate(
            angle: value * 0.1,

            child: Text(emoji, style: const TextStyle(fontSize: 60)),
          ),
        );
      },
    );
  }

  Widget _logoSection() {
    return Column(
      children: [
        Image.asset(AppImages.appLogo, width: 180),

        spaceHeight(20),

        const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),

        spaceHeight(10),

        const Text(
          "Sign in to continue your health journey",
          style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
        ),
      ],
    );
  }

  Widget _formCard(SignInProvider provider) {
    return Container(
      padding: const EdgeInsets.all(28),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),

        borderRadius: BorderRadius.circular(32),

        border: Border.all(color: Colors.white.withOpacity(0.5)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        children: [
          customTextField(
            label: "Email Address",
            hintText: "you@example.com",
            prefixIcon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
            controller: provider.emailController,
          ),

          spaceHeight(20),

          customTextField(
            label: 'Password',
            hintText: 'Enter Password',
            prefixIcon: Icons.lock_outline,
            controller: provider.passwordController,
            obscureText: provider.obscurePassword,
            suffixIcon: IconButton(
              onPressed: () => provider.togglePassword,
              icon: Icon(
                provider.obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),

          spaceHeight(14),

          Align(
            alignment: Alignment.centerRight,

            child: TextButton(
              onPressed: () {},

              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xFF00D1FF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          spaceHeight(10),
          _loginButton(provider),

          spaceHeight(28),
          _divider(),

          spaceHeight(24),
          _socialButtons(),

          spaceHeight(30),
          _signupText(provider),
        ],
      ),
    );
  }

  Widget _loginButton(SignInProvider provider) {
    return customGradientButton(
      onTap: provider.isLoading ? null : () => provider.login(context),
      text: 'Sign In',
    );
  }

  Widget _divider() {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: Text(
            "Or continue with",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),

        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }

  Widget _socialButtons() {
    return Row(
      children: [
        Expanded(
          child: socialButton(icon: "G", text: "Google"),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: socialButton(icon: "📱", text: "Face ID"),
        ),
      ],
    );
  }

  Widget _signupText(SignInProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Color(0xFF64748B)),
        ),

        TextButton(
          onPressed: () => provider.navigateTo(context, RouteNames.signUpScreen),

          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFF00D1FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

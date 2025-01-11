import 'package:dnd_app/core/config/assets/app_images.dart';
import 'package:dnd_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          ///* Background image
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/rogue-background.png',
                  height: size.height * 0.7,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: size.height * 0.3),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 1],
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),

          ///* help button
          Positioned(
            top: size.height * 0.07,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                width: size.width * 0.6,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    'Need help? Contact our support',
                    style: textStyles.bodyMedium,
                  ),
                ),
              ),
            ),
          ),

          ///* Title and buttons
          const _ButtonsAndMore(),
        ],
      ),
    );
  }
}

class _ButtonsAndMore extends StatelessWidget {
  const _ButtonsAndMore();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    const height = 45.0;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.45),
              Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
                height: 80,
              ),
              const SizedBox(height: 10),
              Text(
                'Create and manage characters, purchase and read books, make dice rolls',
                textAlign: TextAlign.center,
                style: textStyles.bodyMedium,
              ),
              const SizedBox(height: 20),
              MyButtonLarge(
                color: const Color(0xFF6d64d8),
                svg: 'assets/svgs/mail-svgrepo-com.svg',
                text: 'Continue with email',
                onTap: () => context.push('/login'),
                height: height,
              ),
              const SizedBox(height: 20),
              const MyButtonLarge(
                color: Color.fromARGB(255, 4, 153, 233),
                svg: 'assets/svgs/google-color-svgrepo-com.svg',
                text: 'Continue with Google',
                height: height,
              ),
              const SizedBox(height: 20),
              const MyButtonLarge(
                color: Colors.deepPurple,
                svg: 'assets/svgs/twitch-svgrepo-com.svg',
                text: 'Continue with email',
                height: height,
              ),
            ],
          ),
        ),
        const Spacer(),
        const Divider(endIndent: 0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(
                'By continuing, you agree to our Terms of Use and Provacy Policy',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 12),
              ),
              Text(
                'Do Not Sell or Share My info',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:safeguide/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/data/homepage.png'),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xff050505),
                    Color(0xff050505),
                    Color(0xff050505),
                    Color(0xff050505),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(40),
                  const Text(
                    'Jaga Kesehatan dan Keselamatan anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: Color(0xffFFFFFF),
                      height: 1.5,
                    ),
                  ),
                  const Gap(8),
                  const Text(
                    'Selamat datang di SafeGuide, aplikasi yang akan membantu dalam menjaga kesehatan dan keselamatan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Color(0xffA2A2A2),
                    ),
                  ),
                  const Gap(30),
                  ButtonPrimary(
                    title: 'Mulai',
                    onTap: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

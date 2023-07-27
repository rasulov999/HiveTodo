import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_db/screens/home/home_screen.dart';
import 'package:todo_db/screens/option/option_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OptionScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: SvgPicture.asset(
          "assets/svg/splash_logo.svg",
          width: 140,
          height: 180,
        ),
      ),
    );
  }
}

import 'package:bywulan/day9/day11/tugasflutter6.dart';
import 'package:bywulan/day_13/bottomnav13.dart';
import 'package:bywulan/day_17/service/preference_handler.dart';
import 'package:bywulan/extension/navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    goToLogin();
  }

  void goToLogin() async {
    await PreferenceHandler.logout();

    if (!context.mounted) return;

    await Future.delayed(const Duration(seconds: 3));
    if (PreferenceHandler.isLogin == true) {
      context.push(const Bottomnav13());
    } else {
      context.push(const tugasflutter6());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/animation/Error.json")),
    );
  }
}

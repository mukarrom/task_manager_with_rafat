import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_with_rafat/ui/screens/auth/login_screen.dart';
import 'package:task_manager_with_rafat/ui/utils/assets_utils.dart';
import 'package:task_manager_with_rafat/ui/widgets/background_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goIntoLoginScreen();
  }

  void goIntoLoginScreen() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
        return const LoginScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: BackgroundScreen(
        child: Center(
          child: SvgPicture.asset(AssetsUtils.logo),
        ),
      ),
    );
  }
}

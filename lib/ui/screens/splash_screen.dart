import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_app/data/models/auth_utility.dart';
import 'package:task_manager_app/ui/screens/auth/login_screen.dart';
import 'package:task_manager_app/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager_app/ui/utils/assets_utils.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  /// navigate to login screen automatically after 3 seconds
  /// by using Future.delayed
  Future<void> navigateToLogin() async {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
      // log(isLoggedIn.toString());
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => isLoggedIn
                  ? const BottomNavBaseScreen()
                  : const LoginScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: Center(
        child: SvgPicture.asset(AssetsUtils.logoSVG),
      ),
    ));
  }
}

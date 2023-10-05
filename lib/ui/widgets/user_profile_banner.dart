import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/auth_utility.dart';
import 'package:task_manager_app/ui/screens/auth/login_screen.dart';

class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      tileColor: Colors.green,
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(AuthUtility.userInfo.data?.photo ?? ""),
        onBackgroundImageError: (_, __) {
          const Icon(Icons.people);
        },
      ),
      title: Text(
        "${AuthUtility.userInfo.data?.firstName ?? 'Name'} ${AuthUtility.userInfo.data?.lastName ?? 'not found'}",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        AuthUtility.userInfo.data?.email ?? 'email not found',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      //---- logout button
      trailing: IconButton(
        onPressed: () async {
          await AuthUtility.clearUserInfo();
          if (mounted) {
            setState(() {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            });
          }
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager_with_rafat/data/models/auth_utility.dart';
import 'package:task_manager_with_rafat/ui/screens/auth/login_screen.dart';

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
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          AuthUtility.userInfo.data?.photo ?? '',
        ),
        onBackgroundImageError: (_, __) {
          const Icon(Icons.image);
        },
      ),
      title: Text(
        '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        AuthUtility.userInfo.data?.email ?? '',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: () async {
          await AuthUtility.clearUserInfo();
          if (mounted) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          }
        },
        icon: const Icon(Icons.logout, color: Colors.white),
      ),
      tileColor: Colors.green,
      focusColor: Colors.green,
    );
  }
}

//
// ListTile(
// leading: UserProfileBanner(),
// title: Text(
// 'Name',
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.bold,
// color: Colors.white,
// ),
// ),
// subtitle: Text(
// 'Email',
// style: TextStyle(
// fontSize: 12,
// color: Colors.white,
// ),
// ),
// tileColor: Colors.green,
// focusColor: Colors.green,
// )

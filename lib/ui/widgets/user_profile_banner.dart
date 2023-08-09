import 'package:flutter/material.dart';
import 'package:task_manager_with_rafat/data/models/auth_utility.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

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
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        AuthUtility.userInfo.data?.email ?? '',
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
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

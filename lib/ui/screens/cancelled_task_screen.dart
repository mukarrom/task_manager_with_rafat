import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/user_profile_banner.dart';

class CancelledTaskScreen extends StatelessWidget {
  const CancelledTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            //----- list view -------
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const Center(
                    child: Text('Cancelled Tasks'),
                  );
                  // return const TaskListTile(
                  //   badge: 'Cancelled',
                  // );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager_with_rafat/ui/widgets/background_screen.dart';
import 'package:task_manager_with_rafat/ui/widgets/summary_card.dart';
import 'package:task_manager_with_rafat/ui/widgets/task_list_tile.dart';
import 'package:task_manager_with_rafat/ui/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ListTile(
              leading: UserProfileBanner(),
              title: Text(
                'Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'Email',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              tileColor: Colors.green,
              focusColor: Colors.green,
            ),
            const Row(
              children: [
                Expanded(
                  child: SummaryCard(number: 09, title: 'New'),
                ),
                Expanded(
                  child: SummaryCard(number: 09, title: 'Progress'),
                ),
                Expanded(
                  child: SummaryCard(number: 09, title: 'Cancelled'),
                ),
                Expanded(
                  child: SummaryCard(number: 09, title: 'Complete'),
                ),
              ],
            ),
            Expanded(
                child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const TaskListTile();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 4,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

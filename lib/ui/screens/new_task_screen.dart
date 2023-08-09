import 'package:flutter/material.dart';
import 'package:task_manager_with_rafat/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_with_rafat/ui/widgets/summary_card.dart';
import 'package:task_manager_with_rafat/ui/widgets/task_list_tile.dart';
import 'package:task_manager_with_rafat/ui/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
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

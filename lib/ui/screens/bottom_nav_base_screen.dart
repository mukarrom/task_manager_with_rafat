import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/add_new_task_screen.dart';
import 'package:task_manager_app/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager_app/ui/screens/completed_task_screen.dart';
import 'package:task_manager_app/ui/screens/inprogress_task_screen.dart';
import 'package:task_manager_app/ui/screens/new_task_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  final List _screens = const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
    CompletedTaskScreen(),
  ];
  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          _selectedScreenIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases_outlined), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined), label: 'In Progress'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_outlined), label: 'Cancel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_outlined), label: 'Complete'),
        ],
      ),
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
    );
  }
}

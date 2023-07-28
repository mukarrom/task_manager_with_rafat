import 'package:flutter/material.dart';
import 'package:task_manager_with_rafat/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager_with_rafat/ui/screens/completed_task_screen.dart';
import 'package:task_manager_with_rafat/ui/screens/in_progress_task_screen.dart';
import 'package:task_manager_with_rafat/ui/screens/new_task_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _currentScreenIndex = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    InProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        showUnselectedLabels: true,
        currentIndex: _currentScreenIndex,
        onTap: (index) {
          _currentScreenIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task_outlined), label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_outlined), label: 'Canceled'),
          BottomNavigationBarItem(
              icon: Icon(Icons.run_circle_outlined), label: 'Progress'),
        ],
      ),
    );
  }
}

 /// We takes Matarial App widget in the separete file
 /// because we work all kink of them related work in this file.
 /// Dark and light theme selected.

import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: TaskManagerApp.globalKey,
      title: 'Task Manager',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        // -------- Text Theme ------------
        textTheme: const TextTheme(
          // ---- titleLarge
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.6,
          ),

        ),
        //----------- Input Decoration ---------
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        // Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(), // we will make ui codes separate in 'ui' folder
    );
  }
}

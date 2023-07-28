import 'package:flutter/material.dart';
import 'package:task_manager_with_rafat/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(

        brightness: Brightness.light,
        primarySwatch: Colors.green,
        /// Text Theme
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )
          ),
        /// Input Decoration
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        /// Elevated button Style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
               Radius.circular(8),
              )
            )
          ),
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}

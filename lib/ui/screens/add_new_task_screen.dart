import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();
  bool isLoading = false;

  Future<void> addNewTask() async {
    isLoading = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "title": titleTEController.text.trim(),
      "description": descriptionTEController.text.trim(),
      "status": "New",
    };
    NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, requestBody);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
    // log(response.statusCode.toString());
    // log(response.body.toString());

    if (response.isSuccess) {
      titleTEController.clear();
      descriptionTEController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task Added Successful')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task Added failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 68,
                  ),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: titleTEController,
                    decoration: const InputDecoration(hintText: 'Subject'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: descriptionTEController,
                    maxLines: 8,
                    decoration: const InputDecoration(hintText: 'Details'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: !isLoading,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          addNewTask();
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

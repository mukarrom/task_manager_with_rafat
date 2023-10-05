import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_model.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';

class UpdateTaskBottomSheet extends StatefulWidget {
  final TaskData task;
  final VoidCallback onUpdate;


  const UpdateTaskBottomSheet({
    super.key,
    required this.task, required this.onUpdate,
  });


  @override
  State<UpdateTaskBottomSheet> createState() => _UpdateTaskBottomSheetState();
}

class _UpdateTaskBottomSheetState extends State<UpdateTaskBottomSheet> {
  late final TextEditingController titleTEController;
  late final TextEditingController descriptionTEController;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleTEController = TextEditingController(text: widget.task.title);
    descriptionTEController =
        TextEditingController(text: widget.task.description);
  }

  Future<void> addNewTask() async {
    _isLoading = true;
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
    _isLoading = false;
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
            const SnackBar(content: Text('Task Updated Successfully')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task updating failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Edit Task',
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
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
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


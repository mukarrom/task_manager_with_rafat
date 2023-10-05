import 'package:flutter/material.dart';
import 'package:task_manager_app/data/models/summary_count_model.dart';
import 'package:task_manager_app/data/models/network_response.dart';
import 'package:task_manager_app/data/models/task_list_model.dart';
import 'package:task_manager_app/data/services/network_caller.dart';
import 'package:task_manager_app/data/utils/urls.dart';
import 'package:task_manager_app/ui/screens/update_task_bottom_sheet.dart';
import 'package:task_manager_app/ui/widgets/summary_card.dart';
import 'package:task_manager_app/ui/widgets/task_list_tile.dart';
import 'package:task_manager_app/ui/widgets/user_profile_banner.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  // in progress loading state
  bool _getCountSummaryInProgress = false,
      _getNewTaskInProgress = false;

  // summary count model object
  SummaryCountModel _summaryCountModel = SummaryCountModel();

  // task list model
  TaskListModel _taskListModel = TaskListModel();

  @override
  void initState() {
    super.initState();
    // call functions after widget binding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummary();
      getNewTask();
    });
  }

  Future<void> getCountSummary() async {
    _getCountSummaryInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.taskStatusCount);

    // log(response.statusCode.toString());
    // log(response.body.toString());

    if (response.isSuccess) {
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Summary Data get failed!')));
      }
    }

    _getCountSummaryInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getNewTask() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.newTasks);

    // log(response.statusCode.toString());
    // log(response.body.toString());

    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Summary Data get failed!')));
      }
    }

    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future deleteTask(String taskId) async {
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.deleteTask(taskId));
    if (response.isSuccess) {
      /// Remove data from taskListModel
      _taskListModel.data!.removeWhere((element) => element.sId == taskId);
      if (mounted) {
        setState(() {});
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Delete of task has failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            _getCountSummaryInProgress
                ? const LinearProgressIndicator()
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _summaryCountModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return SummaryCard(
                        title:
                        _summaryCountModel.data?[index].sId ?? 'New',
                        number: _summaryCountModel.data![index].sum ?? 0,
                      );
                    }),
              ),
            ),
            //----- list view -------
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  getNewTask();
                },
                child: _getNewTaskInProgress
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.separated(
                  itemCount: _taskListModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return TaskListTile(
                      data: _taskListModel.data![index],
                      onDeleteTap: () {
                        deleteTask(_taskListModel.data![index].sId!);
                      },
                      onEditTap: () {
                        showEditBottomSheet(_taskListModel.data![index]);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 4,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEditBottomSheet(TaskData task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return UpdateTaskBottomSheet(
          task: task, onUpdate: () {
          getNewTask();
        },
        );
      },
    );
  }
}

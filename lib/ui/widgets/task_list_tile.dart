import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Title is here'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Subtitle is here'),
          const Text('date is here'),
          Row(
            children: [
              const Chip(
                label: Text('New'),
                labelPadding: EdgeInsets.symmetric(horizontal: 40),
                backgroundColor: Colors.blue,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_note,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

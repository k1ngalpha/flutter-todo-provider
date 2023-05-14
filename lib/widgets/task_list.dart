import 'package:flutter/material.dart';
import 'package:to_do/widgets/task_tile.dart';
//import 'package:to_do/models/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';

class TaskList extends StatelessWidget {
  // late List<Task> tasks;
  // TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = TaskData.tasks[index];
            return TaskTile(
              //taskTitle: widget.tasks[index].name,
              //isChecked: widget.tasks[index].isDone,
              //taskTitle: Provider.of<TaskData>(context).tasks[index].name,
              //isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                // setState(() {
                //   Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
                TaskData.updateTask(task);
              },
              longPressCallback: () {
                TaskData.deleteTask(task);
              },
            );
          },
          itemCount: TaskData.taskCount,
        );
      },
    );
  }
}

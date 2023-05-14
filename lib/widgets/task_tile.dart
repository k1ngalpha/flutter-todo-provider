import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  late bool isChecked = false;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final void Function() longPressCallback;

  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            //Passthrough line
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),

      //The check box
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}

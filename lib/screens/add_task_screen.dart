import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';

//This is the bottomsheet
class AddTaskScreen extends StatelessWidget {
  late String newTaskTitle;
  //late Function addTaskCallback;

  //AddTaskScreen(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(padding: EdgeInsets.all(5.0)),

          //Add text title
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),

          //TextField to input data
          TextField(
            //Enable the text field as soon as it is opened
            autofocus: true,
            //To bring the cursor at the centre
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          //SizedBox(),
          //Button to add tasks
          ElevatedButton(
            // style:
            //     TextButton.styleFrom(foregroundColor: Colors.lightBlueAccent),
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),

            onPressed: () {
              //addTaskCallback(newTaskTitle);
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle);
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}

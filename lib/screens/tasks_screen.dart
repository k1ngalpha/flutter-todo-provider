import 'package:flutter/material.dart';
import 'package:to_do/widgets/task_list.dart';
import 'package:to_do/screens/add_task_screen.dart';
import 'package:to_do/models/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';

class TaskScreen extends StatelessWidget {
  // //Function for the bottom sheet which is a required field

  //Same as above
  @override
  Widget build(BuildContext context) {
    //The blue background
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,

      //adding task button
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          //The plus sigh
          child: Icon(Icons.add),
          onPressed: () {
            //Slide up new page to input a new tasks i,e, new container
            //Bottonsheet
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              )),
            );
          }),
      //Widgets stacked vertically
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //Padding for the column i.e, Icons
            padding:
                EdgeInsets.only(top: 60.0, left: 30.0, right: 30, bottom: 30.0),

            child: Column(
              //To make the icon and text to be at the left --- USE OUTlINE ----
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //To-Do list Icon            ----- ICON ------

                //Circle Avatar for the list Icon to make them enlosed in circle
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                //Spac between the icon and the text -----Sized Box--------
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To-Do',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Task text
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          //Bottom card
          //To Expand bottom continer to take all the length of its child
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                //To round the corners only on top of the bottom cards
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),

              //List View to add the tasks
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}

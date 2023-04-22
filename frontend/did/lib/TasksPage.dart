import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  TasksPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: "two",// Use a vibrant color for the title
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Title',
                    prefixIcon: Icon(Icons.work),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Set Timer',
                          prefixIcon: Icon(Icons.timer),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement add task functionality
                      },
                      child: Text('Add Task'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Use a vibrant color for the button
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // Build task list items from profile.tasks
                // You can customize the task card layout and contents here
                return Card(
                  color: Colors.lightBlue, // Use a different background color for the cards
                  child: ListTile(
                    title: Text(
                      "Title",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "three",// Use a different font color for the title
                      ),
                    ),
                    subtitle: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: "three",// Use a different font color for the description
                      ),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white, // Use a different color for the edit icon
                    ),
                    onTap: () {
                      // Navigate to task detail/edit page
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


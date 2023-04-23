import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
class JournalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Journals Page'),
            floating: true, // Make the app bar float and disappear when scrolling up
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Add Entry',
                      prefixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Date',
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter description',
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add entry button callback
                      // Add entry to journal logic here
                    },
                    child: Text('Add Entry'),
                  ),
                  SizedBox(height: 16.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      // Builder for list view items
                      // Render date and description separately for each entry
                      return Card(
                        elevation: 100.0,
                        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                        color: Colors.orangeAccent, // Set card background color to a vibrant color
                        child: ListTile(
                          title: Text("Title", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36,fontFamily: "three")),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 4.0),
                              Text("Date", style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: "three")), // Set text color to white
                              SizedBox(height: 4.0),
                              Text("Today was a rollercoaster of emotions. I woke up feeling anxious about an upcoming presentation at work, but I managed to calm my nerves by practicing my speech multiple times. At lunch, I received some disappointing news about a close friend moving away, which left me feeling sad and nostalgic. However, in the evening, I received a surprise visit from my sister, whom I haven't seen in months, and it instantly lifted my spirits. We spent quality time together, reminiscing about old memories and making new ones. Overall, today reminded me that life is full of ups and downs, but moments of joy can come when you least expect them.", style: TextStyle(color: Colors.brown,fontSize: 20,fontFamily: "three")), // Set text color to white
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Keep track of the current text and selection position
    String newText = newValue.text;
    int newTextLength = newText.length;
    int selectionIndex = newValue.selection.end;

    // Only allow digits and slashes in the input
    String filteredText = newText.replaceAll(RegExp(r'[^0-9/]'), '');

    // Add slashes at the correct positions for date format dd/MM/yyyy
    if (filteredText.length >= 3 && !filteredText.substring(2, 3).contains('/')) {
      filteredText = filteredText.replaceRange(2, 2, '/');
      if (selectionIndex > 2) {
        selectionIndex++;
      }
    }
    if (filteredText.length >= 6 && !filteredText.substring(5, 6).contains('/')) {
      filteredText = filteredText.replaceRange(5, 5, '/');
      if (selectionIndex > 5) {
        selectionIndex++;
      }
    }

    // Limit the input to 10 characters (dd/MM/yyyy)
    if (filteredText.length > 10) {
      filteredText = filteredText.substring(0, 10);
      if (selectionIndex > 10) {
        selectionIndex = 10;
      }
    }

    // Update the text and selection
    return TextEditingValue(
      text: filteredText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

import 'package:flutter/material.dart';

class CommunicationsPage extends StatefulWidget {
  @override
  _CommunicationsPageState createState() => _CommunicationsPageState();
}

class _CommunicationsPageState extends State<CommunicationsPage> {
  bool _isMessagesVisible = true;
  Color _cardBackgroundColor = Colors.blueAccent;

  void _toggleMessagesVisibility() {
    setState(() {
      _isMessagesVisible = !_isMessagesVisible;
    });
  }

  void _changeCardBackgroundColor() {
    setState(() {
      _cardBackgroundColor = _cardBackgroundColor == Colors.blueAccent
          ? Colors.orangeAccent
          : Colors.blueAccent;
    });
  }

  void _showInfoDialog(String fromUser, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.yellow,
          title: Text(
            'Info Card',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Text(
                  'From:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  fromUser,
                  style: TextStyle(fontSize: 20, color: Colors.brown,fontFamily: "three"),
                ),
                SizedBox(height: 16.0),
                Divider(color: Colors.grey),
                SizedBox(height: 16.0),
                Text(
                  'Message:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 18, color: Colors.brown,fontFamily: "three"),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text('Communications Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter message',
                    prefixIcon: Icon(Icons.message_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select user:',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      onChanged: (value) {
                        // Handle user selection
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'user1',
                          child: Text('User 1'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'user2',
                          child: Text('User 2'),
                        ),
                        // Add more dropdown items as needed
                      ],
                    ),
                    IconButton(
                      onPressed: _changeCardBackgroundColor,
                      icon: Icon(Icons.refresh),
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle add message button press
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add Message'),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _toggleMessagesVisibility,
                  child: _isMessagesVisible ? Text('Hide Messages') : Text(
                      'Show Messages'),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: _isMessagesVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  // Replace with actual message list item widget
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    color: _cardBackgroundColor,
                    margin: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        'From: Protector',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: "three"
                        ),
                      ),
                      subtitle: Text(
                        'protection',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontFamily: "three",
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          _showInfoDialog("Protector", "the page would be divided on top would be add entry while below it the list of entries would appear. in the add task portion on top would be a blank text box with text hint stating add entry, there are optional parameters below it such as enter date .below them would be an add entry button that will add the entry to the journal. in the list of entries portion the list of entries will appear with their title ");// Handle right arrow button press
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                      leading: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
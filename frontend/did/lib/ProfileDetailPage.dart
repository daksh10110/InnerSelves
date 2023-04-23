import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CommunicationsPage.dart' as CommunicationsPage;
import 'JournalsPage.dart' as JournalsPage;
import 'TasksPage.dart' as TasksPage;
import 'Profile.dart';


class ProfileDetailPage extends StatelessWidget {
  final Profile profile;

  ProfileDetailPage({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text('Profile Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20 ),
            Text(
              profile.name,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'one',
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Age: ${profile.age}',
              style: TextStyle(
                  fontSize: 30,
                fontFamily: 'three',
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Personality Type: ${profile.personalityType}',
              style: TextStyle(
                  fontSize: 30,
                fontFamily: 'three',
              ),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                // Navigate to tasks page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasksPage.TasksPage()),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Tasks',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'three',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                // Navigate to journals page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JournalsPage.JournalsPage()),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'Journals',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'three',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                // Navigate to instructions page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunicationsPage.CommunicationsPage()),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'Communications',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'three',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AddProfileDetailPage.dart' as AddProfileDetailPage;
import 'ProfileDetailPage.dart' as ProfileDetailPage;




class Profile {
  final String name;
  final String image;
  final int age;
  final String personalityType;

  Profile({required this.name, required this.image,required this.age,required this.personalityType});
}

class ProfileSelectionPage extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  List<Profile> _profiles = []; // List to hold the profiles data
  @override
  void initState() {
    super.initState();
    // Load profiles data from JSON file
    _loadProfilesData();
  }


  void _loadProfilesData() async {
    String jsonContent =
    await rootBundle.loadString('assets/profiles.json'); // Load JSON file
    if (jsonContent != null && jsonContent.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(
          jsonContent); // Parse JSON data


      setState(() {
        // Update the state with the loaded profiles data
        List<dynamic> personalitiesData = jsonData["Personalities"];
        _profiles = personalitiesData
            .map((profileData) =>
            Profile(
              name: profileData['Name'],
              image: profileData['image'],
              age: profileData['Age'],
              personalityType: profileData['Type'],
            )).toList();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(// Set background color to black
      backgroundColor: Colors.lightGreenAccent,
      body: Column(
        children: [
          SizedBox(height: 75),
          Text('InnerSelves',
            style: TextStyle(fontFamily: "seven",fontWeight: FontWeight.bold,fontSize: 75,color:Colors.brown ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Text(
              "Who's Here?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'four',

              ),
            ),
          ),
          SizedBox(height:20),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Show two cards in a row
                childAspectRatio: 1, // Make the cards square in shape
              ),
              itemCount: _profiles.length + 1, // Add one for the "Add" button
              itemBuilder: (context, index) {
                if (index < _profiles.length) {
                  // Render profile cards
                  return _buildProfileCard(_profiles[index]);
                } else {
                  // Render "Add" button card
                  return _buildAddProfileCard(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(Profile profile) {
    return GestureDetector(
      onTap: () {
        // Navigate to profile detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailPage.ProfileDetailPage(profile: profile),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Card(
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  profile.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            profile.name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
  Widget _buildAddProfileCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to profile detail page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddProfileDetailPage.AddProfileDetailPage()
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Card(
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "name",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Add Profile",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

}
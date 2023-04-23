import 'package:flutter/material.dart';
import 'package:did/LoginPage.dart' as login_page;
import 'Profile.dart' as home_page;
import 'dart:convert';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup',
      home: SignupPage1(),
    );
  }
}

class SignupPage1 extends StatefulWidget {
  @override
  _SignupPage1State createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  TextEditingController emailController = TextEditingController();

  bool _isEmailValid = false;

  @override

  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void validateEmail() {
    String email = emailController.text.trim();
    setState(() {
      _isEmailValid = email.isNotEmpty;
    });
  }


  void _nextPage() {
    if (_isEmailValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OTPVerificationPage(email : emailController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InnerSelves"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Text(
                'Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: _isEmailValid
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: _nextPage,

                  child: Text('Next'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login_page.LoginPage()),
                    );
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPVerificationPage extends StatefulWidget {

  final String email;

  OTPVerificationPage({required this.email});
  @override

  _OTPVerificationPageState createState() => _OTPVerificationPageState();


}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  String? _emailOTP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Please enter the OTP sent to your email and phone',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email OTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email OTP';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _emailOTP = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage2(email: widget.email)),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






class SignupPage2 extends StatefulWidget {
  final String email;
  SignupPage2({required this.email});
  @override
  _SignupPage2State createState() => _SignupPage2State();

}

class _SignupPage2State extends State<SignupPage2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Create Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Legal Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    hintText: 'Legal Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (!isNumeric(_ageController as String)) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    hintText: 'Legal Gender',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return 'Please enter your Gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Sign Up'),
                  onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (
                            context) => home_page.ProfileSelectionPage()),
                      );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}








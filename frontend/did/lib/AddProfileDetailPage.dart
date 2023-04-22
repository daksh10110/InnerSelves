import 'package:flutter/material.dart';

class AddProfileDetailPage extends StatefulWidget {
  @override
  _AddProfileDetailPageState createState() => _AddProfileDetailPageState();
}

class _AddProfileDetailPageState extends State<AddProfileDetailPage> {
  String _name = '';
  String _age = '';
  String _type = '';
  String _id = '';
  String _nameError = '';
  String _ageError = '';
  String _typeError = '';
  String _idError = '';

  void _validateForm() {
    setState(() {
      // Reset error messages
      _nameError = '';
      _ageError = '';
      _typeError = '';
      _idError = '';

      // Validate name
      if (_name.isEmpty) {
        _nameError = 'Name is required';
      }

      // Validate age
      if (_age.isEmpty && !isNumeric(_age)) {
        _ageError = 'Age is required';
      } else {
        int? age = int.tryParse(_age);
        if (age == null || age <= 0) {
          _ageError = 'Invalid age';
        }
      }

      // Validate type
      if (_type.isEmpty) {
        _typeError = 'Type is required';
      }

      // Validate ID
      if (_id.isEmpty && !isNumeric(_age)) {
        _idError = 'ID is required';
      } else {
        int? id = int.tryParse(_id);
        if (id == null || id <= 0) {
          _idError = 'Invalid ID';
        }
      }

      // Check if there are any errors
      if (_nameError.isEmpty &&
          _ageError.isEmpty &&
          _typeError.isEmpty &&
          _idError.isEmpty) {
        // Submit form data or perform further actions
        // when the form is valid
        print('Form is valid');
      }
    });
  }
  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text('Add Profile Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                    _nameError = '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: (_name.isNotEmpty && !isNumeric(_name))
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  errorText: _nameError,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _age = value;
                    _ageError = '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Age',
                  prefixIcon: Icon(Icons.calendar_today),
                  suffixIcon: _age.isNotEmpty && isNumeric(_age)
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  errorText: _ageError,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _type = value;
                    _typeError = '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Type',
                  prefixIcon: Icon(Icons.label),
                  suffixIcon: _type.isNotEmpty && !isNumeric(_type)
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  errorText: _typeError,
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _id = value;
                    _idError = '';
                  });
                },
                decoration: InputDecoration(
                  labelText: 'ID',
                  prefixIcon: Icon(Icons.credit_card),
                  suffixIcon: _id.isNotEmpty && isNumeric(_id)
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  errorText: _idError,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _validateForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


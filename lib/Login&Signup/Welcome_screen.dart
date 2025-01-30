import 'package:flutter/material.dart';

void main() {
  runApp(WelcomeScreen());
}

class WelcomeScreen extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<WelcomeScreen> {
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Help us know you better !",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            buildTextField("Full Name", "Your full name"),
            buildTextField("Email Address(Optional)", "Your full name"),
            SizedBox(height: 10),
            Text(
              "Gender",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio(
                  value: "Male",
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String?;
                    });
                  },
                ),
                Text("Male"),
                Radio(
                  value: "Female",
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String?;
                    });
                  },
                ),
                Text("Female"),
              ],
            ),
            buildTextField("Date of Birth", "DD / MM / YYYY"),
            buildTextField("Anniversary", "DD / MM / YYYY"),
            buildTextField("Referral Code", "Enter referral code"),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD64658),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: TextStyle(color: Color(0xFFE8C431), fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

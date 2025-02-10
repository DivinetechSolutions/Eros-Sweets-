import 'package:flutter/material.dart';
import 'Choose_City.dart';
import 'package:intl/intl.dart';

import 'Loading_Screen.dart';

void main() {
  runApp(MaterialApp(
    home: WelcomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _anniversaryController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  String? _gender;

  void _submitForm() {
    if (_formKey.currentState!.validate())
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Form Submitted Successfully!")),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loading_Screen()),
      );
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text("Welcome", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                Text("Help us know you better!", style: TextStyle(fontSize: 24, color: Colors.black45)),
                SizedBox(height: 20),
                buildTextField("Full Name", "Your full name", _nameController, (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                }),
                buildTextField("Email Address", "Your email address", _emailController, (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email address";
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                }),
                SizedBox(height: 10),
                Text("Gender (Optional)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                    Text("Male", style: TextStyle(fontSize: 18)),
                    Radio(
                      value: "Female",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value as String?;
                        });
                      },
                    ),
                    Text("Female", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 15),
                buildDateField("Date of Birth (Optional)", "DD / MM / YYYY", _dobController),
                buildDateField("Anniversary (Optional)", "DD / MM / YYYY", _anniversaryController),
                buildTextField("Referral Code (Optional)", "Enter referral code", _referralController, null),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD64658),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _submitForm,
                    child: Text("Submit", style: TextStyle(color: Color(0xFFE8C431), fontWeight: FontWeight.bold, fontSize: 22)),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, TextEditingController controller, String? Function(String?)? validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(hintText: hint, hintStyle: TextStyle(color: Colors.grey, fontSize: 18), border: UnderlineInputBorder()),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget buildDateField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () => _selectDate(context, controller),
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(hintText: hint, hintStyle: TextStyle(color: Colors.grey, fontSize: 18), border: UnderlineInputBorder()),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}



/*
^ → Start of the string
[a-zA-Z0-9._%+-]+ → Matches the local part (before @), allowing letters, numbers, dots, underscores, percent, plus, and minus signs
@ → The @ symbol
[a-zA-Z0-9.-]+ → Matches the domain name (allows letters, numbers, dots, and hyphens)
\. → A dot before the domain extension
[a-zA-Z]{2,} → Matches the domain extension (e.g., com, net, org with at least 2 characters)
$ → End of the string*/

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'OTP_screen.dart';
 // Required for input formatters

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  // Function to validate phone number
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes content apart
        children: [
          SizedBox(height: 100), // Moves content slightly down

          Column(
            children: [
              // Logo at the top
              Image.asset(
                'assest/sweets_Logo.png', // Replace with your logo
                height: 100,
              ),
              SizedBox(height: 20),

              // Main container
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey, // Assigning the form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign in to your account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "We'll send you a verification code to help us keep your account safe",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 20),

                        // Phone Number Input with Validation
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly, // Allow only numbers
                            LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "+91",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(minWidth: 40),
                            hintText: "Enter Phone number",
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: validatePhoneNumber, // Applying validation
                        ),

                        SizedBox(height: 20),

                        // Send OTP Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If validation is successful
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sending OTP...')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OTPScreen()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Send OTP',
                            style: TextStyle(
                              color: Color(0xFFE8C431), // Gold text
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        // OR Divider
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.black)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Or', style: TextStyle(color: Colors.black)),
                            ),
                            Expanded(child: Divider(color: Colors.black)),
                          ],
                        ),

                        SizedBox(height: 15),

                        // Google Sign-In Button
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Google Sign-In
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4285F4),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: Icon(Icons.g_mobiledata, color: Colors.white),
                          label: Text(
                            'CONNECT WITH GOOGLE',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Spacer(), // Pushes everything up

          // Terms and Privacy (Fixed at Bottom)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.grey[300], // Light grey background
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 17, color: Colors.black54),
                children: [
                  TextSpan(text: "By Registering, you confirm that you accept our "),
                  TextSpan(
                    text: "terms of use",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Terms of Use click
                      },
                  ),
                  TextSpan(text: " and "),
                  TextSpan(
                    text: "privacy policy",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Privacy Policy click
                      },
                  ),
                  TextSpan(text: "."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

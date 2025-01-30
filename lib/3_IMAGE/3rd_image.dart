import 'package:flutter/material.dart';

import '../Login&Signup/Signin.dart';
import '2nd_image.dart';

void main() {
  runApp(const Page3());
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              "assest/3rd_image.png", // Update with actual image path
              height: 300,
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Choose your food",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Easily find your type of food craving and you'll get delivery in wide range.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),

          const SizedBox(height: 30),

          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD64658),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Next Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD64658),
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("GET STARTED", style: TextStyle(color:  Color(0xFFE8C431),
                  fontSize: 20,
                )),
              ),
            ),
          ),
          /*const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              // Handle skip button action
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),*/
        ],
      ),
    );
  }
}

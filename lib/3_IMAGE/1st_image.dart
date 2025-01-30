import 'package:flutter/material.dart';

import '2nd_image.dart';
import '3rd_image.dart';

void main() {
  runApp(const Page1());
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
              "assest/image.1.png", // Update with actual image path
              height: 300,
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "All your favorites",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Order from the best local restaurants with easy, on-demand delivery.",
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
                  color: Color(0xFFD64658),
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
                  color: Colors.grey,
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
                    MaterialPageRoute(builder: (context) => Page2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD64658),
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("NEXT", style: TextStyle(color:  Color(0xFFE8C431),
                fontSize: 20,
                )),
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

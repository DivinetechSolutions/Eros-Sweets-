import 'package:flutter/material.dart';

import '3_IMAGE/1st_image.dart';
import '3_IMAGE/2nd_image.dart';
import 'App_Screens/Delivery.dart';
import 'App_Screens/Home_Page.dart';
import 'App_Screens/Search_icon_screen.dart';
import 'Demo.dart';
import 'Login&Signup/Choose_City.dart';
import 'Login&Signup/Loading_Screen.dart';
import 'Login&Signup/OTP_screen.dart';
import 'Login&Signup/Signin.dart';
import 'Login&Signup/Welcome_screen.dart';
import 'Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:PickupScreen(/*phoneNumber: '',*/),
    );
  }
}
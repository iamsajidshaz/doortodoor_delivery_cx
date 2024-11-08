import 'package:doortodoor_delivery_cx/constants/colors.dart';
import 'package:doortodoor_delivery_cx/controllers/auth_service.dart';
import 'package:doortodoor_delivery_cx/firebase_options.dart';
import 'package:doortodoor_delivery_cx/pages/home_page.dart';
import 'package:doortodoor_delivery_cx/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodCart',
      color: tPrimaryColor,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      AuthService.isLoggedIn().then((value) {
        if (value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()));
        }
      });

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffEAB864),
      backgroundColor: const Color(0xFFFF690D),
      body: Center(
        child: Image.asset(
          "assets/images/app_logo_foodcart.png",
          height: 256,
          width: 256,
        ),
      ),
    );
  }
}

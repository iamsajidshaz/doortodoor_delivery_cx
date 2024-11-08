import 'package:doortodoor_delivery_cx/controllers/auth_service.dart';
import 'package:doortodoor_delivery_cx/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("WELCOME"),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () async {
                await AuthService.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

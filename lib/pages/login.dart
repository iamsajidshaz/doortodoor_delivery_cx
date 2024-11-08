import 'package:doortodoor_delivery_cx/constants/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: tPrimaryColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    "assets/images/app_logo_foodcart.png",
                  ),
                  height: size.height * 0.25,
                ),
                const Text(
                  "Welcome Back,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    color: tCardBgColor,
                  ),
                ),
                const Text(
                  "Login to Order Food and Groceries online",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: tCardBgColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline_outlined,
                              color: tCardBgColor,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: tCardBgColor),
                            hintStyle: TextStyle(color: tCardBgColor),
                            hintText: "Email",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: tCardBgColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: tCardBgColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.fingerprint,
                              color: tCardBgColor,
                            ),
                            labelText: "Password",
                            hintText: "Password",
                            labelStyle: TextStyle(color: tCardBgColor),
                            hintStyle: TextStyle(color: tCardBgColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: tCardBgColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: tCardBgColor,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: tCardBgColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              foregroundColor: tCardBgColor,
                              backgroundColor: tSecondaryColor,
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                            ),
                            child: const Text("LOGIN"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("OR"),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                icon: const Image(
                                  image: AssetImage(
                                      "assets/images/icons_google.png"),
                                  width: 20.0,
                                ),
                                onPressed: () {},
                                label: const Text("Sign-In with Google"),
                                style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(),
                                  foregroundColor: Colors.black,
                                  backgroundColor: tCardBgColor,
                                  side: const BorderSide(color: Colors.black),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text.rich(
                                TextSpan(
                                    text: "Don't have an Account? ",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    children: const [
                                      TextSpan(
                                        text: "Signup",
                                        style: TextStyle(
                                          color: tCardBgColor,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

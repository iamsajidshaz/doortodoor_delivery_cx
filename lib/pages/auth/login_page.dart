import 'package:doortodoor_delivery_cx/controllers/auth_service.dart';
import 'package:doortodoor_delivery_cx/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 25,
              // ),
              Expanded(
                child: Image.asset(
                  "assets/images/applogo.png",
                  //  fit: BoxFit.cover,
                ),
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      //   "Welcome Back 👋",
                      "Welcome Back",
                      style: TextStyle(
                        color: Color(0xFFFF690D),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "Enter your Phone Number to continue",
                      style: TextStyle(
                        color: Color(0xFFFF690D),
                        // fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixText: "+91 ",
                          labelText: "Enter your phone number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length != 10) {
                            return "Invalid Phone Number";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthService.sentOtp(
                              phone: _phoneController.text,
                              errorStep: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Error sending OTP"),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                              nextStep: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("OTP Verificaton"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //  Text("Enter 6 digit OTP"),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Form(
                                          key: _formKey1,
                                          child: TextFormField(
                                            controller: _otpController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: "Enter the OTP",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.length != 6) {
                                                return "Invalid OTP";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          if (_formKey1.currentState!
                                              .validate()) {
                                            AuthService.loginWithOtp(
                                                    otp: _otpController.text)
                                                .then((value) {
                                              print("Error value is $value");
                                              if (value == "Success") {
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const HomePage()));
                                              } else {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(value),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            });
                                          }
                                        },
                                        child: const Text("Submit"),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF690D),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Send OTP"),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Made with ❤️ by FutureCraftLab",
                      style: TextStyle(
                        // fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

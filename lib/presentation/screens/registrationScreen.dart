import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sharedpref_example/data/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/customWidgets.dart';
import 'homeScreen.dart';
import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late SharedPreferences pref;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: const Text("Registration")),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextField(nameController, "Username"),
                customTextField(emailController, "Email"),
                customTextField(phoneController, "Phone number"),
                customPasswordTextField(passwordController, "Password"),
                ElevatedButton(
                  onPressed: registerUser,
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen()));
                        },
                        child: const Text("Login"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() async {
    final User user = User(
        userId: DateTime.now().millisecondsSinceEpoch.toString(),
        username: nameController.text,
        email: emailController.text,
        phoneNo: phoneController.text);

    String jsonString = jsonEncode(user);
    pref.setString("userData", jsonString);
    pref.setBool("isLogin", true);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  void initPreferences() async {
    pref = await SharedPreferences.getInstance();
  }
}

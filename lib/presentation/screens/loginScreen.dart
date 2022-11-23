import 'package:flutter/material.dart';


import '../widgets/customWidgets.dart';
import 'homeScreen.dart';
import 'registrationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(emailController, "Email"),
            customPasswordTextField(passwordController, "Password"),
            ElevatedButton(
              onPressed: loginUser,
              child: const Text(
                "Login",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RegistrationScreen()));
                    },
                    child: const Text("Register"))
              ],
            )
          ],
        ),
      ),
    );
  }

  void loginUser() async {

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }
}

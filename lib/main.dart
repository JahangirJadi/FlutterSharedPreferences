import 'package:flutter/material.dart';
import 'package:flutter_sharedpref_example/presentation/screens/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late SharedPreferences pref;
  bool? isLoggedIn = false;

  @override
  void initState() {
    initPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn == true ? HomeScreen() : LoginScreen();
  }

  void initPreferences() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = pref.getBool("isLogin");
    });
  }
}

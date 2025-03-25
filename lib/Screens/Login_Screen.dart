import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  void Login() {
    String username = name.text.trim();
    String userpassword = password.text.trim();
    if (username.isEmpty || userpassword.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter Username and password")));
      return;
    }
    if (username == "admin" && userpassword == "admin@123") {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen();
      }));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid user")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("LOGIN"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Login();
              },
              child: Text("LOGIN"))
        ],
      ),
    );
  }
}

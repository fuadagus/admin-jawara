import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              top: 25.0, left: 8.0, right: 8.0, bottom: 8.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Text("Halaman Login"),
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Text("Email")),
                    TextField(
                      controller: emailController,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

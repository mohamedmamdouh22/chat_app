import 'package:chat_app/screens/login.dart';
import 'package:chat_app/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Chat());
}

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Login.id:(context)=>Login(),
          Register.id:(context)=>Register()
      },
      initialRoute: 'Login',
    );
  }
}

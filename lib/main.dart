import 'package:flutter/material.dart';
import 'package:todo_app/screens/sign_in_page/sign_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

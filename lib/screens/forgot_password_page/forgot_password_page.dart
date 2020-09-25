import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/forgot_password_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/forgot_password_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/forgot_password_page/components/text.dart';
import 'package:todo_app/services/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomText(text: 'Forgot Password'),
            const Spacer(),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Email Id',
                isPassword: false,
                onChanged: (value) => _email = value,
              ),
            ),
            const Spacer(flex: 5),
            Center(
              child: NeumorphicButton(
                width: size.width - 60,
                onTap: () async => FbaseAuth.forgotPassword(_email).then((value) => Navigator.pop(context)),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic/neumorphic.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/screens/background.dart';
import 'package:todo_app/screens/sign_in_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/sign_in_page/components/text.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomText(text: 'Sign In'),
            const Spacer(),
            NeumorphicTextField(
              width: size.width - 30,
              hintText: 'Email Id',
              isPassword: false,
            ),
            NeumorphicTextField(
              width: size.width - 30,
              hintText: 'Password',
              isPassword: true,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

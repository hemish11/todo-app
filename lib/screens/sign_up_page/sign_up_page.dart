import 'package:flutter/material.dart';
import 'package:todo_app/screens/background.dart';
import 'package:todo_app/screens/sign_up_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/sign_up_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/sign_up_page/components/text.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomText(text: 'Sign Up'),
            const Spacer(),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Email Id',
                isPassword: false,
                onChanged: (value) => print(value),
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Enter Password',
                isPassword: true,
                onChanged: (value) => print(value),
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Re-enter Password',
                isPassword: true,
                onChanged: (value) => print(value),
              ),
            ),
            const Spacer(flex: 3),
            Center(
              child: NeumorphicButton(
                width: size.width - 60,
                onTap: () {},
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

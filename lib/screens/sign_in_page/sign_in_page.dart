import 'package:flutter/material.dart';
import 'package:todo_app/screens/background.dart';
import 'package:todo_app/screens/sign_in_page/components/clickable_text.dart';
import 'package:todo_app/screens/sign_in_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/sign_in_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/sign_in_page/components/text.dart';
import 'package:todo_app/screens/sign_up_page/sign_up_page.dart';
import 'package:todo_app/screens/todo_list_page/todo_list_page.dart';

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
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Email id',
                isPassword: false,
                onChanged: (value) => print(value),
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Password',
                isPassword: true,
                onChanged: (value) => print(value),
              ),
            ),
            const Spacer(flex: 3),
            Center(
              child: ClickableText(
                text: 'Dont have an account? Create one',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: NeumorphicButton(
                width: size.width - 60,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoListPage(),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

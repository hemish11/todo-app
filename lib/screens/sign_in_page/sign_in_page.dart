import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/forgot_password_page/forgot_password_page.dart';
import 'package:todo_app/screens/sign_in_page/components/clickable_text.dart';
import 'package:todo_app/screens/sign_in_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/sign_in_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/sign_in_page/components/text.dart';
import 'package:todo_app/screens/sign_up_page/sign_up_page.dart';
import 'package:todo_app/screens/todo_list_page/todo_list_page.dart';
import 'package:todo_app/services/firebase_auth.dart';
import 'package:todo_app/services/show_dialog.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';

  @override
  void initState() {
    Firebase.initializeApp().then(
      (value) {
        if (FbaseAuth.getUser() != null)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoListPage(),
            ),
          );
      },
    );

    super.initState();
  }

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
                onChanged: (value) => _email = value,
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Password',
                isPassword: true,
                onChanged: (value) => _password = value,
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
            const SizedBox(height: 10.0),
            Center(
              child: ClickableText(
                text: 'Forgot Password?',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordPage(),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: NeumorphicButton(
                width: size.width - 60,
                onTap: () async {
                  try {
                    await FbaseAuth.signIn(_email, _password);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoListPage(),
                      ),
                    );
                  } catch (e) {
                    showAlertDialog(
                      context: context,
                      title: 'Error',
                      content: 'Your Email or password is wrong',
                    );
                  }
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

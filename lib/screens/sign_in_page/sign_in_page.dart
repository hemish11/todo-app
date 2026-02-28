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

/// RFC 5322–style email regex (simplified for common addresses).
final RegExp _emailRegExp = RegExp(
  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
);

/// Returns null if valid, or an error message if invalid.
String? _validateSignIn(String email, String password) {
  if (email.isEmpty) return 'Please enter your email.';
  if (!_emailRegExp.hasMatch(email)) return 'Please enter a valid email address.';
  if (password.isEmpty) return 'Please enter your password.';
  return null;
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (FbaseAuth.getUser() != null)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoListPage(),
          ),
        );
    });
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
              child: _isLoading
                  ? SizedBox(
                      width: size.width - 60,
                      height: 80,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : NeumorphicButton(
                      width: size.width - 60,
                      onTap: () async {
                        final validationError = _validateSignIn(_email, _password);
                        if (validationError != null) {
                          showAlertDialog(
                            context: context,
                            title: 'Invalid input',
                            content: validationError,
                          );
                          return;
                        }
                        try {
                          setState(() => _isLoading = true);
                          await FbaseAuth.signIn(_email, _password);
                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoListPage(),
                            ),
                          );
                        } catch (e) {
                          if (mounted) {
                            showAlertDialog(
                              context: context,
                              title: 'Error',
                              content: 'Your Email or password is wrong',
                            );
                          }
                        } finally {
                          if (mounted) setState(() => _isLoading = false);
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

import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/sign_up_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/sign_up_page/components/neumorphic_text_field.dart';
import 'package:todo_app/components/custom_text.dart';
import 'package:todo_app/screens/todo_list_page/todo_list_page.dart';
import 'package:todo_app/services/firebase_auth.dart';
import 'package:todo_app/services/show_dialog.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

/// Returns null if password meets policy, or an error message otherwise.
/// Requires: length >= 8, at least one uppercase, one lowercase, one digit.
String? _validatePassword(String p) {
  if (p.length < 8) return 'Password must be at least 8 characters.';
  if (!RegExp(r'[A-Z]').hasMatch(p)) return 'Password must contain at least one uppercase letter.';
  if (!RegExp(r'[a-z]').hasMatch(p)) return 'Password must contain at least one lowercase letter.';
  if (!RegExp(r'[0-9]').hasMatch(p)) return 'Password must contain at least one digit.';
  return null;
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = '';
  String _password1 = '';
  String _password2 = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomText(text: 'Sign Up', padding: const EdgeInsets.only(left: 10.0)),
            const Spacer(),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Email Id',
                isPassword: false,
                onChanged: (value) => _email = value,
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Enter Password',
                isPassword: true,
                onChanged: (value) => _password1 = value,
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Re-enter Password',
                isPassword: true,
                onChanged: (value) => _password2 = value,
              ),
            ),
            const Spacer(flex: 3),
            Center(
              child: _isLoading
                  ? SizedBox(
                      width: size.width - 60,
                      height: 80,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : NeumorphicButton(
                      width: size.width - 60,
                      text: 'Sign Up',
                      onTap: () async {
                        final passwordError = _validatePassword(_password1);
                        if (passwordError != null) {
                          showAlertDialog(
                            context: context,
                            title: 'Error',
                            content: passwordError,
                          );
                          return;
                        }
                        if (_password1 != _password2) {
                          showAlertDialog(
                            context: context,
                            title: 'Error',
                            content: 'Passwords do not match.',
                          );
                          return;
                        }
                        try {
                            setState(() => _isLoading = true);
                            await FbaseAuth.createNewUser(_email, _password1);
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
                                content: 'Something went wrong or accont with same email id exists.',
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

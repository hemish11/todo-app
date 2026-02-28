import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/sign_up_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/sign_up_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/sign_up_page/components/text.dart';
import 'package:todo_app/screens/todo_list_page/todo_list_page.dart';
import 'package:todo_app/services/firebase_auth.dart';
import 'package:todo_app/services/show_dialog.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
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
            CustomText(text: 'Sign Up'),
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
                      onTap: () async {
                        if (_password1.length >= 6 && _password2.length >= 6) {
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
                        } else {
                          showAlertDialog(
                            context: context,
                            title: 'Error',
                            content: 'Your password is too short.',
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

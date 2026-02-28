import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/forgot_password_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/forgot_password_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/forgot_password_page/components/text.dart';
import 'package:todo_app/services/firebase_auth.dart';
import 'package:todo_app/services/show_dialog.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email = '';
  bool _isLoading = false;

  bool _isNetworkError(dynamic e) {
    if (e is FirebaseAuthException) {
      final code = e.code?.toLowerCase() ?? '';
      return code.contains('network') || code.contains('unavailable');
    }
    return e is SocketException || e is IOException;
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
              child: _isLoading
                  ? SizedBox(
                      width: size.width - 60,
                      height: 80,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  : NeumorphicButton(
                      width: size.width - 60,
                      onTap: () async {
                        try {
                          setState(() => _isLoading = true);
                          await FbaseAuth.forgotPassword(_email);
                          if (mounted) Navigator.pop(context);
                        } catch (e) {
                          if (!mounted) return;
                          showAlertDialog(
                            context: context,
                            title: 'Error',
                            content: _isNetworkError(e)
                                ? 'An internet connection is required to send a password reset email.'
                                : 'Something went wrong, please check your email id',
                          );
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

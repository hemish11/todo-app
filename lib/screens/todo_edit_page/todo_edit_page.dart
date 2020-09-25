import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/background.dart';
import 'package:todo_app/screens/todo_edit_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/todo_edit_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/todo_edit_page/components/text.dart';

class TodoEditPage extends StatelessWidget {
  final String title;
  final String description;

  const TodoEditPage({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomText(text: 'Edit Todo'),
            const SizedBox(height: 20),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Title',
                isPassword: false,
                onChanged: (value) => print(value),
              ),
            ),
            Center(
              child: NeumorphicTextField(
                width: size.width - 40,
                hintText: 'Description',
                isPassword: true,
                onChanged: (value) => print(value),
              ),
            ),
            const Spacer(flex: 3),
            Center(
              child: NeumorphicButton(
                width: size.width - 60,
                add: title == null ? true : false,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

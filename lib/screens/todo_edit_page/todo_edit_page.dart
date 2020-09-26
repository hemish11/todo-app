import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/todo_edit_page/components/neumorphic_button.dart';
import 'package:todo_app/screens/todo_edit_page/components/neumorphic_text_field.dart';
import 'package:todo_app/screens/todo_edit_page/components/text.dart';
import 'package:todo_app/services/cloud_firestore.dart';
import 'package:todo_app/services/firebase_auth.dart';
import 'package:todo_app/services/show_dialog.dart';

class TodoEditPage extends StatefulWidget {
  final String title;
  final String description;
  final int index;

  const TodoEditPage({Key key, this.title, this.description, this.index}) : super(key: key);

  @override
  _TodoEditPageState createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  String _title;
  String _description;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.title ?? '');
    _descriptionController = TextEditingController(text: widget.description ?? '');

    _title = widget.title ?? '';
    _description = widget.description ?? '';

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
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
            CustomText(text: widget.title == null ? 'Add Todo' : 'Edit Todo'),
            const SizedBox(height: 20),
            Center(
              child: NeumorphicTextField(
                controller: _titleController,
                width: size.width - 40,
                hintText: 'Title',
                isPassword: false,
                onChanged: (value) => _title = value,
              ),
            ),
            Center(
              child: NeumorphicTextField(
                controller: _descriptionController,
                width: size.width - 40,
                hintText: 'Description',
                isPassword: false,
                onChanged: (value) => _description = value,
              ),
            ),
            if (widget.title != null) const Spacer(flex: 3) else const Spacer(flex: 4),
            Center(
              child: NeumorphicButton(
                width: size.width - 60,
                add: widget.title == null ? true : false,
                text: widget.title == null ? 'Add' : 'Save',
                onTap: () {
                  if (widget.title == null)
                    _title == '' || _description == ''
                        ? showAlertDialog(
                            context: context, title: 'Error', content: 'Title or Description should not be empty')
                        : CloudFirestore.addTodo(
                            _title,
                            _description,
                            FbaseAuth.getUser().email,
                          ).then((value) => Navigator.pop(context));
                  else
                    CloudFirestore.editTodo(_title, _description, FbaseAuth.getUser().email, widget.index)
                        .then((value) => Navigator.pop(context));
                },
              ),
            ),
            const SizedBox(height: 30),
            if (widget.title != null)
              Center(
                child: NeumorphicButton(
                  width: size.width - 60,
                  add: widget.title == null ? true : false,
                  text: 'Delete',
                  onTap: () {
                    CloudFirestore.deleteTodo(
                      widget.title,
                      widget.description,
                      FbaseAuth.getUser().email,
                    ).then((value) => Navigator.pop(context));
                  },
                ),
              ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

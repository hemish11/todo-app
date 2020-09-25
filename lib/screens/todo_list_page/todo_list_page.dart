import 'package:flutter/material.dart';
import 'package:todo_app/screens/background.dart';
import 'package:todo_app/screens/todo_edit_page/todo_edit_page.dart';
import 'package:todo_app/screens/todo_list_page/components/todo_tile.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: ListView.builder(
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => TodoTile(
            title: 'Title $index',
            description: 'Description $index',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoEditPage(
                  title: 'Title $index',
                  description: 'Description $index',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

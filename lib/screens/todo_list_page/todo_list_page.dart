import 'package:flutter/material.dart';
import 'package:todo_app/screens/background.dart';
import 'package:todo_app/screens/todo_edit_page/todo_edit_page.dart';
import 'package:todo_app/screens/todo_list_page/components/add_button.dart';
import 'package:todo_app/screens/todo_list_page/components/todo_tile.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.85 - 15,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.all(0),
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
            AddButton(),
          ],
        ),
      ),
    );
  }
}

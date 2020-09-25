import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/todo_edit_page/todo_edit_page.dart';
import 'package:todo_app/screens/todo_list_page/components/add_button.dart';
import 'package:todo_app/screens/todo_list_page/components/todo_tile.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        showSignOutButton: true,
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.85 - 15,
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('Todos').doc('hemishpancholi11@gmail.com').snapshots(),
                builder: (context, snapshot) {
                  bool loading = snapshot.data == null ? true : false;
                  Map<String, dynamic> data = loading ? {} : snapshot.data.data();

                  return ListView.builder(
                    itemCount: loading ? 0 : data['Title'].length,
                    padding: const EdgeInsets.all(0),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => TodoTile(
                      title: loading ? '' : data['Title'][index],
                      description: loading ? '' : data['Description'][index],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoEditPage(
                            title: loading ? '' : data['Title'][index],
                            description: loading ? '' : data['Description'][index],
                            index: index,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            AddButton(),
          ],
        ),
      ),
    );
  }
}

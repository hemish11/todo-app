import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/background.dart';
import 'package:todo_app/screens/todo_edit_page/todo_edit_page.dart';
import 'package:todo_app/services/firebase_auth.dart';
import 'package:todo_app/screens/todo_list_page/components/add_button.dart';
import 'package:todo_app/screens/todo_list_page/components/todo_tile.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final userId = FbaseAuth.getUser()?.uid;
    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
        body: Background(
          showSignOutButton: true,
          child: Stack(
            children: [
              SizedBox(
                height: size.height * 0.85 - 15,
                child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Todos')
                      .doc(userId ?? '__no_user__')
                      .snapshots(),
                  builder: (context, snapshot) {
                    bool loading = snapshot.data == null || (snapshot.data != null && !snapshot.data.exists);
                    Map<String, dynamic> data = loading ? {'Title': [], 'Description': []} : (snapshot.data.data() ?? {'Title': [], 'Description': []});

                    return ListView.builder(
                      itemCount: loading ? 0 : (data['Title'].length + 1),
                      padding: const EdgeInsets.all(0),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => index >= data['Title'].length
                          ? SizedBox(height: size.height * 0.15)
                          : TodoTile(
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
      ),
    );
  }
}

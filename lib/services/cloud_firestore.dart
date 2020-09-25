import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static Future<void> addUser(String email) async {
    await instance.collection('Todos').doc(email).set({'Title': [], 'Description': []});
  }

  static Future<void> addTodo(String title, String description, String email) async {
    DocumentSnapshot documentSnapshot = await instance.collection('Todos').doc(email).get();

    List<dynamic> _title = documentSnapshot.data()['Title'];
    List<dynamic> _description = documentSnapshot.data()['Description'];

    await FirebaseFirestore.instance.collection('Todos').doc(email).set(
      {
        'Title': _title + [title],
        'Description': _description + [description],
      },
    );
  }

  static Future<void> editTodo(String title, String description, String email, int index) async {
    Map<String, dynamic> data = (await instance.collection("Todos").doc(email).get()).data();

    data['Title'][index] = title;
    data['Description'][index] = description;

    await FirebaseFirestore.instance.collection('Todos').doc(email).set(data);
  }

  static Future<void> deleteTodo(String title, String description, String email) async {
    await instance.collection("Todos").doc(email).update({
      'Title': FieldValue.arrayRemove([title]),
      'Description': FieldValue.arrayRemove([description]),
    });
  }
}

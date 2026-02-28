import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/services/app_exceptions.dart';

class CloudFirestore {
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static bool _isNetworkError(dynamic e) {
    if (e is SocketException || e is IOException) return true;
    if (e is FirebaseException) {
      final code = (e.code ?? '').toLowerCase();
      final msg = (e.message ?? '').toLowerCase();
      return code.contains('unavailable') ||
          code.contains('network') ||
          msg.contains('network') ||
          msg.contains('connection');
    }
    return false;
  }

  static Future<void> addUser(String email) async {
    try {
      await instance.collection('Todos').doc(email).set({'Title': [], 'Description': []});
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not create user data; try again', e);
    }
  }

  static Future<void> addTodo(String title, String description, String email) async {
    try {
      DocumentSnapshot documentSnapshot = await instance.collection('Todos').doc(email).get();

      List<dynamic> _title = documentSnapshot.data()['Title'];
      List<dynamic> _description = documentSnapshot.data()['Description'];

      await instance.collection('Todos').doc(email).set(
        {
          'Title': _title + [title],
          'Description': _description + [description],
        },
      );
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not save; try again', e);
    }
  }

  static Future<void> editTodo(String title, String description, String email, int index) async {
    try {
      Map<String, dynamic> data = (await instance.collection("Todos").doc(email).get()).data();

      data['Title'][index] = title;
      data['Description'][index] = description;

      await instance.collection('Todos').doc(email).set(data);
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not save; try again', e);
    }
  }

  static Future<void> deleteTodo(String title, String description, String email) async {
    try {
      await instance.collection("Todos").doc(email).update({
        'Title': FieldValue.arrayRemove([title]),
        'Description': FieldValue.arrayRemove([description]),
      });
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not delete; try again', e);
    }
  }
}

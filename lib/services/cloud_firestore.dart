import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/services/app_exceptions.dart';

class CloudFirestore {
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static const int _maxTitleLength = 200;
  static const int _maxDescriptionLength = 2000;

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

  /// Trims and enforces max length. Throws [DataSyncException] if empty or over limit.
  static String _sanitizeTodoString(String s, int maxLen, String fieldName) {
    final trimmed = s?.trim() ?? '';
    if (trimmed.isEmpty) {
      throw DataSyncException('$fieldName cannot be empty');
    }
    if (trimmed.length > maxLen) {
      throw DataSyncException('$fieldName must be at most $maxLen characters');
    }
    return trimmed;
  }

  static Future<void> addUser(String userId) async {
    try {
      await instance.collection('Todos').doc(userId).set({'Title': [], 'Description': []});
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not create user data; try again', e);
    }
  }

  static Future<void> addTodo(String title, String description, String userId) async {
    try {
      final sanitizedTitle = _sanitizeTodoString(title, _maxTitleLength, 'Title');
      final sanitizedDescription = _sanitizeTodoString(description, _maxDescriptionLength, 'Description');

      DocumentSnapshot documentSnapshot = await instance.collection('Todos').doc(userId).get();

      List<dynamic> _title = documentSnapshot.data()['Title'];
      List<dynamic> _description = documentSnapshot.data()['Description'];

      await instance.collection('Todos').doc(userId).set(
        {
          'Title': _title + [sanitizedTitle],
          'Description': _description + [sanitizedDescription],
        },
      );
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not save; try again', e);
    }
  }

  static Future<void> editTodo(String title, String description, String userId, int index) async {
    try {
      final sanitizedTitle = _sanitizeTodoString(title, _maxTitleLength, 'Title');
      final sanitizedDescription = _sanitizeTodoString(description, _maxDescriptionLength, 'Description');

      Map<String, dynamic> data = (await instance.collection("Todos").doc(userId).get()).data();

      data['Title'][index] = sanitizedTitle;
      data['Description'][index] = sanitizedDescription;

      await instance.collection('Todos').doc(userId).set(data);
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not save; try again', e);
    }
  }

  static Future<void> deleteTodo(String title, String description, String userId) async {
    try {
      await instance.collection("Todos").doc(userId).update({
        'Title': FieldValue.arrayRemove([title]),
        'Description': FieldValue.arrayRemove([description]),
      });
    } catch (e) {
      if (_isNetworkError(e)) throw NetworkException('Check your internet connection', e);
      throw DataSyncException('Could not delete; try again', e);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/services/cloud_firestore.dart';

class FbaseAuth {
  static FirebaseAuth instance = FirebaseAuth.instance;

  static Future<void> createNewUser(String email, String password) async {
    User user = (await instance.createUserWithEmailAndPassword(email: email, password: password)).user;

    CloudFirestore.addUser(user.email);
  }

  static Future<void> signIn(String email, String password) async {
    await instance.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> forgotPassword(String email) async {
    await instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> signOut() async {
    await instance.signOut();
  }

  static User getUser() {
    return instance.currentUser;
  }
}

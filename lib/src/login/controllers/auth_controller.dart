import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServiceProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<User?> createUserWithEmailAndPassword(String email, String password,
      String name, String mobile, String address) async {
    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUser = cred.user;
      notifyListeners();

      // Save additional user information to Firestore
      await _firestore.collection('users').doc(_currentUser!.uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'address': address,
      });

      return _currentUser; // Return the user object if successful
    } catch (e) {
      debugPrint("Error in createUserWithEmailAndPassword: $e");
      return null; // Return null in case of an error
    }
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _currentUser = cred.user;
      notifyListeners();
      return _currentUser; // Return the user object if successful
    } catch (e) {
      debugPrint("Error in loginUserWithEmailAndPassword: $e");
      return null; // Return null in case of an error
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
      _currentUser = null;
      notifyListeners();
    } catch (e) {
      debugPrint("Error in signout: $e");
    }
  }
}

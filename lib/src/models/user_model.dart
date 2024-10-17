import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late final name, email, phonenumber, address, password;
  // UserModel(
  //     {required this.name,
  //     required this.email,
  //     required this.phonenumber,
  //     required this.address,
  //     required this.password});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addUser(
      String name, String email, String phone, String address) async {
    final user = _auth.currentUser;

    try {
      await _firestore.collection('users').doc(user?.uid).set({
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "created_at": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error adding user: $e");
    }
  }

 
  // Fetch user's name
  Future<String?> getUserName() async {
    final user = _auth.currentUser;

    if (user != null) {
      try {
        // Fetch the document for the logged-in user
        DocumentSnapshot documentSnapshot =
            await _firestore.collection('users').doc(user.uid).get();

        if (documentSnapshot.exists) {
          // Extract the name field from the document
          String? name = documentSnapshot.get('name');
          return name;
        } else {
          print("User document does not exist");
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    } else {
      print("No user is currently signed in.");
    }
    return null; // Return null if name not found or error occurs
  }
}

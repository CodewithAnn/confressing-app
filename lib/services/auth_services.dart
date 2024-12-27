import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confressing_app/utills/scaffold_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// A service class for handling authentication using Firebase and Google Sign-In.
class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stream of authentication state changes.
  Stream<User?> get authChanges => _auth.authStateChanges();

  /// The currently signed-in user.
  User? get user => _auth.currentUser;

  /// Signs in a user using Google Sign-In.
  ///
  /// This method initiates the Google Sign-In process, retrieves the authentication
  /// tokens, and uses them to sign in to Firebase. If the sign-in is successful,
  /// a [UserCredential] object is returned.
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool response = false;
    try {
      // Initiates the Google Sign-In process.
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Retrieves the authentication tokens from the Google user.
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Creates a new credential using the authentication tokens.
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      // Signs in to Firebase with the Google credential.
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          // Add user to firestore
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        response = true;
      }
    } on FirebaseAuthException catch (e) {
      // Handle sign-in errors here.
      if (context.mounted) {
        showSnackBar(context, e.message!);
      }
      response = false;
    }
    return response;
  }

  /// Signs out the currently signed-in user.
  Future<void> signOutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      debugPrint("Error:${e.message} ");
    }
  }
}

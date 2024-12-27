import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory =>
      _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .snapshots();

  void addToMeetingHistory(String meetingName) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    } on FirebaseException catch (e) {
      print("Error:${e.message} ");
    }
  }
}

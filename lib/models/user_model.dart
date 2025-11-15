// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String uuid;
  String profilePic;
  String email;

  User({
    required this.name,
    required this.uuid,
    required this.profilePic,
    required this.email,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      name: snapshot['email'],
      uuid: snapshot['uuid'],
      profilePic: snapshot['profilePic'],
      email: snapshot['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uuid': uuid,
      'profilePic': profilePic,
      'email': email,
    };
  }
}

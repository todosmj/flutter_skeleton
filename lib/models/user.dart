import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  final String uid;
  final String email;

  User({
    @required this.uid,
    @required this.email
  });

  factory User.fromJSON(Map user) {
    return User(
      uid: user['uid'],
      email: user['email'],
    );
  }

  @override
  List<Object> get props => [uid, email];
}
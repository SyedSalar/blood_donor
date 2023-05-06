import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// To parse this JSON data, do
//
//     final hospital = hospitalFromJson(jsonString);

import 'dart:convert';

import 'BloodUserModel.dart';

Hospital hospitalFromJson(String str) => Hospital.fromJson(json.decode(str));

String hospitalToJson(Hospital data) => json.encode(data.toJson());

class Hospital {
  int id;
  String location;
  String name;

  Hospital({
    required this.id,
    required this.location,
    required this.name,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        location: json["location"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "name": name,
      };
}

class AuthNotifier extends ChangeNotifier {
  BloodUserModel? currentUser;

  List<Hospital>? allHospitals;

  Future<bool> checkCurrentUser() async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        currentUser = BloodUserModel.fromJson((await FirebaseFirestore.instance
                .collection('users')
                .where('email',
                    isEqualTo: FirebaseAuth.instance.currentUser!.email!)
                .get())
            .docs
            .first
            .data());
        allHospitals = [];

        var _ = await FirebaseFirestore.instance.collection('hospitals').get();
        for (int i = 0; i < _.docs.length; i++) {
          allHospitals!.add(Hospital.fromJson(_.docs[i].data()));
        }
        return true;
      }
      currentUser = null;

      return false;
    } catch (e) {
      currentUser = null;

      return false;
    }
  }

  Future<bool> login(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress.trim().toLowerCase(), password: password);

      currentUser = BloodUserModel.fromJson((await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: credential.user!.email!)
              .get())
          .docs
          .first
          .data());

      allHospitals = [];

      var _ = await FirebaseFirestore.instance.collection('hospitals').get();
      for (int i = 0; i < _.docs.length; i++) {
        allHospitals!.add(Hospital.fromJson(_.docs[i].data()));
      }

      return true;
    } on FirebaseAuthException catch (e) {
      currentUser = null;

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      return false;
    }
  }

  Future<bool> signup(
      {required String emailAddress,
      required String password,
      required String firstName,
      required String lastName,
      required String mobileNumber,
      required String gender,
      required String dob,
      required String location,
      required String bloodGroup}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      var bloodUser = BloodUserModel(
          donationIds: [],
          email: emailAddress,
          firstName: firstName,
          lastName: lastName,
          mobileNumber: mobileNumber,
          gender: gender,
          dob: dob,
          location: location,
          bloodGroup: bloodGroup);

      await FirebaseFirestore.instance
          .collection('users')
          .add(bloodUser.toJson());

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

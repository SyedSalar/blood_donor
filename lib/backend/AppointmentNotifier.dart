import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AppointmentNotifier extends ChangeNotifier {
  Future<bool> makeAppointment(
      {required int hospitalId,
      required String dateTime,
      required String note,
      required String bloodGroup}) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;

      var appointment = AppointmentModel(
          hospitalId: hospitalId,
          dateTime: dateTime,
          note: note,
          bloodGroup: bloodGroup);

      FirebaseFirestore.instance
          .collection('appointments')
          .doc(currentUser!.email!)
          .collection("appointments")
          .add(appointment.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }
}

// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) =>
    json.encode(data.toJson());

class AppointmentModel {
  int hospitalId;
  String dateTime;
  String note;
  String bloodGroup;

  AppointmentModel({
    required this.hospitalId,
    required this.dateTime,
    required this.note,
    required this.bloodGroup,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        hospitalId: json["hospitalId"],
        dateTime: json["dateTime"],
        note: json["note"],
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "hospitalId": hospitalId,
        "dateTime": dateTime,
        "note": note,
        "bloodGroup": bloodGroup,
      };
}

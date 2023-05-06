import 'package:blood_donor/Constants/AppNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'AuthNotifier.dart';

class DonationNotifier extends ChangeNotifier {
  Future<List<Donation>?> fetchAllDonations() async {
    List<Donation>? allDonations;

    var _ = await FirebaseFirestore.instance.collection("donations").get();
    for (int i = 0; i < _.docs.length; i++) {
      allDonations!.add(Donation.fromJson(_.docs[i].data()));
    }

    return allDonations;
  }

  Future<Donation?> makeDonation(BuildContext context, int hospitalId,
      String hospitalName, String location, String deadline) async {
    try {
      var recentDonationId = (await FirebaseFirestore.instance
              .collection("recentDonationIds")
              .doc("recentDonationIds")
              .get())
          .data()!["recentDonationId"];

      var _ = Donation(
          id: recentDonationId,
          hospitalId: hospitalId,
          hospitalName: hospitalName,
          location: location,
          deadline: deadline);

      await FirebaseFirestore.instance
          .collection("recentDonationIds")
          .doc("recentDonationIds")
          .update({"recentDonationId": FieldValue.increment(1)});
      var currentUserDocId = (await FirebaseFirestore.instance
              .collection('users')
              .where('email',
                  isEqualTo: FirebaseAuth.instance.currentUser!.email!)
              .get())
          .docs
          .first
          .id;

      await FirebaseFirestore.instance.collection("donations").add(_.toJson());

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserDocId)
          .update({
        "donationIds": FieldValue.arrayUnion([recentDonationId])
      });

      context
          .read<AuthNotifier>()
          .currentUser!
          .donationIds
          .add(recentDonationId);

      AppNavigations.showSnackBar(context: context, content: "Success");
      return _;
    } catch (e) {
      return null;
    }
  }
}

// To parse this JSON data, do
//
//     final donation = donationFromJson(jsonString);

Donation donationFromJson(String str) => Donation.fromJson(json.decode(str));

String donationToJson(Donation data) => json.encode(data.toJson());

class Donation {
  int id;
  int hospitalId;
  String hospitalName;
  String location;
  String deadline;

  Donation({
    required this.id,
    required this.hospitalId,
    required this.hospitalName,
    required this.location,
    required this.deadline,
  });

  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        id: json["id"],
        hospitalId: json["hospitalId"],
        hospitalName: json["hospitalName"],
        location: json["location"],
        deadline: json["deadline"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospitalName": hospitalName,
        "location": location,
        "deadline": deadline,
        "hospitalId": hospitalId,
      };
}

// To parse this JSON data, do
//
//     final bloodUserModel = bloodUserModelFromJson(jsonString);

import 'dart:convert';

BloodUserModel bloodUserModelFromJson(String str) =>
    BloodUserModel.fromJson(json.decode(str));

String bloodUserModelToJson(BloodUserModel data) => json.encode(data.toJson());

class BloodUserModel {
  List<int> donationIds;
  String email;
  String firstName;
  String lastName;
  String mobileNumber;
  String gender;
  String dob;
  String location;
  String bloodGroup;

  BloodUserModel({
    required this.donationIds,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.gender,
    required this.dob,
    required this.location,
    required this.bloodGroup,
  });

  factory BloodUserModel.fromJson(Map<String, dynamic> json) => BloodUserModel(
        donationIds: List<int>.from(json["donationIds"].map((x) => x)),
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        gender: json["gender"],
        dob: json["DOB"],
        location: json["Location"],
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "donationIds": List<dynamic>.from(donationIds.map((x) => x)),
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "gender": gender,
        "DOB": dob,
        "Location": location,
        "bloodGroup": bloodGroup,
      };
}

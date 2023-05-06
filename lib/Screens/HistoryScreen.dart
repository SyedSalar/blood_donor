import 'package:blood_donor/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text('History'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return (Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Test 123'),
                      subtitle:
                          Text('Location: CMH\nDonation Date: 15 April 2023'),
                      trailing: Icon(
                        Icons.bloodtype,
                        color: AppColors.primary,
                      ),
                    ),
                    Divider(),
                  ],
                ));
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    ));
  }
}

import 'dart:async';

import 'package:blood_donor/Screens/HistoryScreen.dart';
import 'package:blood_donor/backend/DonationNotifier.dart';

import '../Constants/Imports.dart';
import '../backend/AuthNotifier.dart';

class Booking extends StatefulWidget {
  const Booking({super.key, required this.donation, required this.hospitalIdx});

  final Donation donation;
  final int hospitalIdx;

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Timer? timer;

  var duration = Duration(hours: 24).inSeconds;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          duration = duration - 1;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 0.25.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.map),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 0.78.sh,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 8.sp),
                      width: .85.sw,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.field),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 5,
                            ),
                          ]),
                      child: Row(
                        children: [
                          Container(
                            height: 0.06.sh,
                            width: 0.06.sh,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 0.04.sw,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${context.read<AuthNotifier>().currentUser!.firstName} ${context.read<AuthNotifier>().currentUser!.lastName}",
                                style: TextStyle(
                                    color: AppColors.font,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${context.read<AuthNotifier>().currentUser!.location}}",
                                style: TextStyle(
                                    color: AppColors.font,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Donation Details:",
                          style: TextStyle(
                              color: AppColors.font,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Text(
                          "Location - ${widget.donation.hospitalName} ${context.read<AuthNotifier>().allHospitals![widget.hospitalIdx].location}",
                          style: TextStyle(
                              color: AppColors.font,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Location - ${widget.donation.hospitalName} ${context.read<AuthNotifier>().allHospitals![widget.hospitalIdx].location}",
                          style: TextStyle(
                              color: AppColors.font,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        Text(
                          "Schedule - ${DateTime.parse(widget.donation.deadline).toUtc()}",
                          style: TextStyle(
                              color: AppColors.font,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),

                        /* SizedBox(
                          height: 0.02.sh,
                        ),
                        Text(
                          "Time Left:",
                          style: TextStyle(
                              color: AppColors.font,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 0.12.sh,
                              width: 0.12.sh,
                              child: Text(
                                "${duration~/3600}",
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10.sp)),
                            ),
                            Container(
                              height: 0.12.sh,
                              width: 0.12.sh,
                                 child: Text(
                                "${duration%60}",
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10.sp)),
                            ),
                            Container(
                              height: 0.12.sh,
                              width: 0.12.sh,
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10.sp)),
                            )
                          ],
                        ),
                       */
                        SizedBox(
                          height: 0.04.sh,
                        ),
                        Text(
                          "Share your feedback",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.field,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        InputField(
                          height: .05.sh,
                          borderRadius: 10.sp,
                          fontSize: 14.sp,
                          text: "",
                          controller: TextEditingController(),
                        ),
                        Button(
                          text: 'Show History',
                          onPressed: () {
                            AppNavigations.push(context, History());
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

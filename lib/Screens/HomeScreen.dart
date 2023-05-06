import 'package:blood_donor/backend/AuthNotifier.dart';

import '../Constants/Imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var authNotifier = context.watch<AuthNotifier>().currentUser!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.05.sh,
              ),
              Container(
                height: 0.3.sh,
                width: 1.sw,
                padding: EdgeInsets.all(22.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: AppColors.secondary,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 0.12.sh,
                      width: 0.12.sh,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Text(
                      "${authNotifier.firstName} ${authNotifier.lastName}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5.sp),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "BLOOD TYPE",
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              authNotifier.bloodGroup,
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                            height: .06.sw,
                            child: VerticalDivider(
                              thickness: 1.5,
                              color: AppColors.font,
                            )),
                        Column(
                          children: [
                            Text(
                              "UNITS DONATED",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.font),
                            ),
                            Text(
                              authNotifier.donationIds.length.toString(),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.font),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.sp,
                  vertical: 12.sp,
                ),
                height: .075.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: AppColors.primary,
                ),
                child: Row(
                  children: [
                    Image.asset(AppAssets.circleIcon),
                    SizedBox(
                      width: 0.02.sw,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "urgent need for donors".toUpperCase(),
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          "Give Blood, Get a \$10 Amazon Gift Card",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Container(
                width: 1.sw,
                height: 0.18.sh,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    image: DecorationImage(
                        image: AssetImage(AppAssets.bloodInHands),
                        fit: BoxFit.fitWidth)),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
                child: Button(
                    height: 0.06.sh,
                    color: AppColors.primary,
                    fontColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    text: "Schedule New Appointment".toUpperCase(),
                    onPressed: scheduleAppointmentFunction),
              ),
              Column(
                children: [
                  button("Donor Gift", "Your digital donor card", () => {},
                      image: AppAssets.donorGift),
                  button("Blood Journey ", "See your blood journey", () => {},
                      image: AppAssets.bloodJourney),
                  button("Donation History",
                      "View past donations and health records", () => {},
                      image: AppAssets.donationHistory),
                  button(
                      "Manage Appointments",
                      "Reschedule, cancel and get directions",
                      manageAppointmentFunction,
                      image: AppAssets.manageAppointment),
                  button("Educational", "Eligibility, the process and more",
                      () => {},
                      image: AppAssets.questionMark),
                  button("Capture the Moment", "Share a selfie", () => {},
                      image: AppAssets.captureMoment),
                  button("Contact Us", "Contact the Blood Donor", () => {},
                      image: AppAssets.contact),
                  button("Settings", "Customize your app settings", () => {},
                      image: AppAssets.contact),
                ],
              ),
              SizedBox(
                height: 0.17.sh,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String title, String desc, void Function() onPressed,
      {String image = ""}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 22.sp,
            vertical: 12.sp,
          ),
          height: .08.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.secondary,
          ),
          child: Row(
            children: [
              Container(
                height: 0.05.sh,
                width: 0.05.sh,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    image: image.isEmpty
                        ? null
                        : DecorationImage(
                            image: AssetImage(image),
                            scale: image == AppAssets.donorGift ? 1.4 : 1)),
              ),
              SizedBox(
                width: 0.04.sw,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.font,
                    ),
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7A7A7A)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void scheduleAppointmentFunction() {
    AppNavigations.push(context, const DonationType());
  }

  void manageAppointmentFunction() {
    AppNavigations.push(context, const ManageAppointmentScreen());
  }
}

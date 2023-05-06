import 'package:blood_donor/GeneralWidgets/alertbox.dart';

import '../Constants/Imports.dart';

class ManageAppointmentScreen extends StatefulWidget {
  const ManageAppointmentScreen({super.key});

  @override
  State<ManageAppointmentScreen> createState() =>
      _ManageAppointmentScreenState();
}

class _ManageAppointmentScreenState extends State<ManageAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          toolbarHeight: 0.07.sh,
          shadowColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.sp),
            child: InkWell(
              onTap: () => {AppNavigations.pop(context)},
              child: Image.asset(
                AppAssets.back,
                color: Colors.white,
                scale: 0.8,
              ),
            ),
          ),
          title: Text(
            "Manage Appointment",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontFamily: 'JockeyOne',
                fontWeight: FontWeight.w400,
                height: 0.8.sp),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.sp,
                  vertical: 16.sp,
                ),
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Icon(Icons.bloodtype_outlined),
                              Text('Blood')
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 0.04.sh,
                          width: 0.26.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Text('Location')
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            children: [Icon(Icons.sunny), Text('Morning')],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "No Appointments Booked",
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.04.sh,
              ),
              Text(
                "Each Donation Can Help Save More That\nOne Life.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 0.01.sw,
              ),
              Text(
                "Every 2 seconds someone needs blood.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.field),
              ),
              SizedBox(
                height: 0.04.sh,
              ),
              Container(
                height: .25.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.heartS),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  AlertBox(
                      text: 'Add to Calendar',
                      body: 'Do you really want to Add this into calendar');
                },
                child: Container(
                  child: Row(children: [
                    Icon(Icons.calendar_month_outlined),
                    Text('Add to Calendar')
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  AlertBox(
                      text: 'Add to Calendar',
                      body: 'Do you really want to Add this into calendar');
                },
                child: Container(
                  child:
                      Row(children: [Icon(Icons.schedule), Text('Reschedule')]),
                ),
              ),
              InkWell(
                onTap: () {
                  AlertBox(
                      text: 'Add to Calendar',
                      body: 'Do you really want to Add this into calendar');
                },
                child: Container(
                  child: Row(children: [
                    Icon(Icons.cancel),
                    Text('Cancel Appointment')
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  AlertBox(
                      text: 'Add to Calendar',
                      body: 'Do you really want to Add this into calendar');
                },
                child: Container(
                  child: Row(children: [
                    Icon(Icons.gas_meter_sharp),
                    Text('Get Ready to DOnate')
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  AlertBox(
                      text: 'Add to Calendar',
                      body: 'Do you really want to Add this into calendar');
                },
                child: Container(
                  child: Row(children: [
                    Icon(Icons.directions),
                    Text('Get Directions')
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  AlertBox(
                      text: 'Add to Calendar',
                      body: 'Do you really want to Add this into calendar');
                },
                child: Container(
                    child: Row(
                        children: [Icon(Icons.mail), Text('Invite a friend')])),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.sp, vertical: 45.sp),
                  child: Button(
                      height: 0.06.sh,
                      color: AppColors.primary,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      text: "Schedule New Appointment".toUpperCase(),
                      onPressed: scheduleAppointmentFunction)),
            ],
          ),
        ));
  }

  void scheduleAppointmentFunction() {
    AppNavigations.push(context, const DonationType());
  }
}

import 'package:blood_donor/backend/AuthNotifier.dart';
import 'package:blood_donor/backend/BloodDonations.dart';
import 'package:blood_donor/backend/DonationNotifier.dart';
import 'package:intl/intl.dart';

import '../Constants/Imports.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key, required this.donationId});

  final int donationId;

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  String dropDown = "Blood Group";
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  DropDownField? hospitalDropdown;

  DropDownField? bloodGrpDropdown;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  void initState() {
    bloodGrpDropdown = DropDownField(
        title: dropDown,
        list: const ['A+', 'B+', 'O+', 'AB+', 'A-', 'B-', 'O-', 'AB-']);
    hospitalDropdown = DropDownField(
        title: "Select Hospital",
        list: context
            .read<AuthNotifier>()
            .allHospitals!
            .map((e) => e.name)
            .toList());
    super.initState();
    _selectedDate = DateTime.now();
  }

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
            "Schedule",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontFamily: 'JockeyOne',
                fontWeight: FontWeight.w400,
                height: 0.8.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          child: Column(
            children: [
              hospitalDropdown!,
              SizedBox(
                height: 0.05.sw,
              ),
              // InputField(
              //   height: 0.06.sh,
              //   fontSize: 13.sp,
              //   text: "Select Hospital",
              //   controller: TextEditingController(),
              //   borderRadius: 12.sp,
              // ),

              Padding(
                padding: EdgeInsets.only(bottom: .05.sw),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        height: 0.06.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(color: const Color(0xFFC7C7C7)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_selectedDate != null)
                              Text(
                                '${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                                style: TextStyle(
                                    fontSize: 10.sp, color: AppColors.field),
                              ),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.05.sw,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        height: 0.06.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(color: const Color(0xFFC7C7C7)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_selectedTime != null)
                              Text(
                                _selectedTime != null
                                    ? '${_selectedTime?.format(context)}'
                                    : 'No time selected',
                                style: TextStyle(
                                    fontSize: 13.sp, color: AppColors.field),
                              ),
                            IconButton(
                              icon: Icon(Icons.access_time_rounded),
                              onPressed: () => _selectTime(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  height: 0.16.sh,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    border: Border.all(color: const Color(0xFFC7C7C7)),
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 13.sp, color: AppColors.field),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Note",
                        hintStyle:
                            TextStyle(fontSize: 13.sp, color: AppColors.field)),
                  )),
              SizedBox(
                height: 0.03.sh,
              ),
              bloodGrpDropdown!,
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.sp, vertical: 45.sp),
                  child: Button(
                      height: 0.06.sh,
                      color: AppColors.primary,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      text: "Book Appointment ".toUpperCase(),
                      onPressed: () async {
                        if (hospitalDropdown!.title != 'Select Hospital' &&
                            bloodGrpDropdown!.title != "Blood Group") {
                          int hospitalIdx = context
                              .read<AuthNotifier>()
                              .allHospitals!
                              .indexWhere((element) =>
                                  element.name == hospitalDropdown!.title);

                          AppNavigations.loadingProgressIndicator(context);
                          var _ = await context
                              .read<DonationNotifier>()
                              .makeDonation(
                                  context,
                                  context
                                      .read<AuthNotifier>()
                                      .allHospitals![hospitalIdx]
                                      .id,
                                  context
                                      .read<AuthNotifier>()
                                      .allHospitals![hospitalIdx]
                                      .name,
                                  context
                                      .read<AuthNotifier>()
                                      .allHospitals![hospitalIdx]
                                      .location,
                                  DateFormat('yyyy-MM-dd')
                                      .format(_selectedDate!));

                          if (_ == null) {
                            AppNavigations.pop(context);
                            return;
                          }

                          AppNavigations.pop(context);
                          AppNavigations.push(
                              context,
                              Booking(
                                hospitalIdx: hospitalIdx,
                                donation: _!,
                              ));
                        }
                      })),
              InkWell(
                onTap: cancelFunction,
                child: Text(
                  "CANCEL",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.field,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      letterSpacing: 2.sp,
                      decorationColor: AppColors.field),
                ),
              ),
            ],
          ),
        ));
  }

  void bookinglFunction() {
    // AppNavigations.push(context, const Booking());
  }

  void cancelFunction() {
    AppNavigations.pop(context);
  }
}

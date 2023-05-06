import 'package:blood_donor/backend/AuthNotifier.dart';

import '../Constants/Imports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropDown = 'Gender';
  bool donor = false;

  var firstNameCtrl = TextEditingController();
  var lastNameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var mobileCtrl = TextEditingController();

  var locationCtrl = TextEditingController();
  var bloodgroupCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: () => {AppNavigations.pop(context)},
          child: Image.asset(
            AppAssets.back,
            color: Colors.black,
            height: 0.05.sh,
            width: .1.sw,
          ),
        ),
        title: Text(
          "SIGN UP",
          style: TextStyle(
              color: AppColors.font,
              fontSize: 35.sp,
              fontFamily: 'JockeyOne',
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.03.sh,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InputField(
                      width: .5.sw,
                      height: 0.06.sh,
                      fontSize: 13.sp,
                      text: "First Name",
                      controller: firstNameCtrl,
                      borderRadius: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 0.05.sw,
                  ),
                  Expanded(
                    child: InputField(
                      width: .5.sw,
                      height: 0.06.sh,
                      fontSize: 13.sp,
                      text: "Last Name",
                      controller: lastNameCtrl,
                      borderRadius: 12.sp,
                    ),
                  ),
                ],
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Mobile Number",
                controller: mobileCtrl,
                borderRadius: 12.sp,
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Email",
                controller: emailCtrl,
                borderRadius: 12.sp,
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Password",
                controller: passwordCtrl,
                borderRadius: 12.sp,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: .05.sw),
                child: Row(
                  children: [
                    Expanded(
                        child: DropDownField(
                            title: dropDown, list: const ['Male', 'Female'])),
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
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                  fontSize: 13.sp, color: AppColors.field),
                            ),
                            Image.asset(
                              AppAssets.calender,
                              height: .025.sh,
                              fit: BoxFit.contain,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Location",
                controller: locationCtrl,
                borderRadius: 12.sp,
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Blood Group",
                controller: bloodgroupCtrl,
                borderRadius: 12.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: .025.sw),
                child: InkWell(
                  onTap: () => setState(() => donor = !donor),
                  child: Row(
                    children: [
                      Container(
                          height: 0.03.sh,
                          width: 0.03.sh,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.5, color: AppColors.primary),
                          ),
                          child: donor
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.font,
                                  size: 0.02.sh,
                                )
                              : const SizedBox.shrink()),
                      SizedBox(
                        width: 0.03.sw,
                      ),
                      Text("Sign up as Donor",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 25.sp),
                child: Column(
                  children: [
                    Button(
                        height: 0.06.sh,
                        color: AppColors.primary,
                        fontColor: Colors.white,
                        text: "Sign Up",
                        onPressed: () async {
                          AppNavigations.loadingProgressIndicator(context);
                          if (await context.read<AuthNotifier>().signup(
                              emailAddress:
                                  emailCtrl.value.text.trim().toLowerCase(),
                              password: passwordCtrl.value.text,
                              firstName: firstNameCtrl.value.text,
                              lastName: lastNameCtrl.value.text,
                              mobileNumber: mobileCtrl.value.text,
                              gender: "M",
                              dob: DateTime.now().toIso8601String(),
                              location: locationCtrl.value.text,
                              bloodGroup: bloodgroupCtrl.value.text
                                  .trim()
                                  .toLowerCase())) {
                            AppNavigations.showSnackBar(
                                context: context, content: "Registered");
                            AppNavigations.popAll(context, WelcomeScreen());
                          } else {
                            AppNavigations.pop(context);
                            AppNavigations.showSnackBar(
                                context: context, content: "Error");
                          }
                        }),
                    Button(
                        height: 0.06.sh,
                        color: AppColors.facebook,
                        fontColor: Colors.white,
                        text: "Sign Up With Facebook",
                        onPressed: () {}),
                  ],
                ),
              ),
              Text(
                "Help With Sign Up Or Log In",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xFF8583FF),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFF8583FF)),
              ),
              SizedBox(
                height: .04.sh,
              )
            ],
          ),
        ),
      ),
    );
  }
}

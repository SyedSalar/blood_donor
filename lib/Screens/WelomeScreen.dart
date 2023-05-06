import 'package:blood_donor/Constants/Imports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 0.445.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.bloodWithHands),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.6.sh,
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.sp)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ]),
              child: Column(
                children: [
                  Text(
                    "BLOOD DONOR",
                    style: TextStyle(
                        color: AppColors.font,
                        fontSize: 35.sp,
                        fontFamily: 'JockeyOne',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  Text(
                    "Tymia relies on regular blood transfusions\nas treatment for sickle cell disease.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.font,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Button(
                      height: 0.05.sh,
                      text: "Create Account",
                      borderRadius: 10,
                      onPressed: createAccountFunction),
                  Button(
                      height: 0.05.sh,
                      text: "Log In",
                      borderRadius: 10,
                      onPressed: loginAccountFunction),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 25.sp),
                    child: Button(
                        height: 0.05.sh,
                        color: AppColors.primary,
                        fontColor: Colors.white,
                        text: "Schedule New Appointment",
                        onPressed: () {}),
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
                    height: .01.sh,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createAccountFunction() {
    AppNavigations.push(context, const SignUpScreen());
  }

  void loginAccountFunction() {
    AppNavigations.push(context, const LoginScreen());
  }
}

import 'package:blood_donor/backend/AuthNotifier.dart';

import '../Constants/Imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropDown = 'Gender';

  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "LOGIN",
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
              Container(
                height: 0.25.sh,
                width: 0.25.sh,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.logo2), fit: BoxFit.cover)),
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Email or Username",
                controller: emailCtrl,
                borderRadius: 12.sp,
              ),
              InputField(
                height: 0.06.sh,
                fontSize: 13.sp,
                text: "Password",
                controller: passwordCtrl,
                borderRadius: 12.sp,
                obscure: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.field),
                  )
                ],
              ),
              // const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 0),
                child: Button(
                    height: 0.06.sh,
                    color: AppColors.primary,
                    fontColor: Colors.white,
                    text: "Log In",
                    onPressed: () async {
                      AppNavigations.loadingProgressIndicator(context);
                      if (await context.read<AuthNotifier>().login(
                          emailAddress:
                              emailCtrl.value.text.trim().toLowerCase(),
                          password: passwordCtrl.value.text)) {
                        AppNavigations.popAll(context, const HomeScreen());
                      } else {
                        AppNavigations.pop(context);
                        AppNavigations.showSnackBar(
                            context: context, content: "Error");
                      }
                    }),
              ),
              // const Spacer(),
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

  void loginFunction() {
    AppNavigations.push(context, const HomeScreen());
  }
}

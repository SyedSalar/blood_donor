import '../Constants/Imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      AppNavigations.replace(context, const WelcomeScreen());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(AppAssets.logo)],
        ),
      ),
    );
  }
}

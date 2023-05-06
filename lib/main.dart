import 'package:blood_donor/Screens/HistoryScreen.dart';
import 'package:blood_donor/backend/AppointmentNotifier.dart';
import 'package:blood_donor/backend/AuthNotifier.dart';
import 'package:blood_donor/backend/DonationNotifier.dart';

import 'Constants/Imports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DonationNotifier()),
    ChangeNotifierProvider(create: (context) => AuthNotifier()),
    ChangeNotifierProvider(create: (context) => AppointmentNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donor',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}

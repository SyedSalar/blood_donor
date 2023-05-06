import '../Constants/Imports.dart';

class AppNavigations {
  // It containas all the navigation functions used in the app

  //Push Screen in the Stack
  static void push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  //Pop Screen out of the Stack
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  //Replace Screen with the top most Screen of the Stack
  static void replace(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  //Pop all the Screen from the Stack till the lowest most and then reaplace it with the Another Screen
  static void popAll(BuildContext context, Widget screen) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  static void showSnackBar(
      {required BuildContext context, required String content}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Padding(
          padding: EdgeInsets.only(
            // top: height * 0.6,
            left: width * 0.1,
            right: width * 0.1,
            bottom: 0,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              // ignore: sort_child_properties_last
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 10,
                    ),
                    child: SizedBox(
                      width: width * 0.5,
                      child: Text(
                        content,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.close_sharp,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )));
  }

  static void loadingProgressIndicator(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            backgroundColor: AppColors.primary,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
      context: context,
    );
  }
}

/*

//Screen Navigation Methods
class Screen {
  static push(BuildContext context, Widget Screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen));
  }

  static replace(BuildContext context, Widget Screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Screen));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  static popallstack(BuildContext context, Widget Screen) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Screen));
  }

  static void showSnackBar(
      {required BuildContext context, required String content}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Padding(
          padding: EdgeInsets.only(
            // top: height * 0.6,
            left: width * 0.1,
            right: width * 0.1,
            bottom: 0,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              // ignore: sort_child_properties_last
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 10,
                    ),
                    child: SizedBox(
                      width: width * 0.5,
                      child: Text(
                        content,
                        style: TextStyle(
                          fontFamily: semiBold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.close_sharp,
                            color: white,
                          ),
                        ),
                      )),
                ],
              ),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )));
  }

  static void loadingProgressIndicator(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
            child: Lottie.asset(
                'assets/loading_lotties/bI3GoszGhD two-col.json',
                width: width * 0.5));
        /*return Center(
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            backgroundColor: primaryColor,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );*/
      },
      context: context,
    );
  }
}
*/
import '../Constants/Imports.dart';

class AppAlerts {
  // It containas all the widgets needed for the alerts needed in the app

  // show the acknowledgement on snack bar
  static void showSnackBar(
      {required BuildContext context, required String content}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Padding(
          padding: EdgeInsets.only(
            // top: height * 0.6,
            left: width * 0.015,
            right: width * 0.015,
            bottom: 0,
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: width * 0.025),
              // ignore: sort_child_properties_last
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: SizedBox(
                      width: width * 0.5,
                      child: Text(
                        content,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        )));
  }
}

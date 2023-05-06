import '../Constants/Imports.dart';

class DonationType extends StatefulWidget {
  const DonationType({super.key});

  @override
  State<DonationType> createState() => _DonationTypeState();
}

class _DonationTypeState extends State<DonationType> {
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
            "Donation Type",
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
              button("Blood", "The most common type of donation.", () {
                schedule(0);
              }),
              button("Power Red", "Best if you’re type O or RH-negative.", () {
                schedule(1);
              }),
              button("Platelets", "Only available at select centers.", () {
                schedule(2);
              }, image: AppAssets.platelets),
              button("AB Plasma",
                  "Only availavle at select centers.\nDonor must be AB Blood type.",
                  () {
                schedule(3);
              }, image: AppAssets.abPlasma),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.sp, vertical: 45.sp),
                  child: Button(
                      height: 0.06.sh,
                      color: AppColors.primary,
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      text: "use sponsor code".toUpperCase(),
                      onPressed: () {})),
            ],
          ),
        ));
  }

  Widget button(String title, String desc, void Function() onPressed,
      {String image = ""}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.sp),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 22.sp,
                vertical: 12.sp,
              ),
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(10.sp)),
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
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 4.sp),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10.sp)),
                color: AppColors.primary,
              ),
              child: Center(
                child: Text(
                  "You can Donate Now".toUpperCase(),
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void schedule(int id) {
    AppNavigations.push(
        context,
        Schedule(
          donationId: id,
        ));
  }
}

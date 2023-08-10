import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controller.dart';
import '../widgets/buttons.dart';
import '../widgets/responsiveness.dart';

final globalBucket = PageStorageBucket();

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: globalBucket,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Responsive(
                desktopScreen: desktopScreen(context),
                mixedScreen: mixedScreen(context)),
          ),
        ),
      ),
    );
  }

  Widget desktopScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1 = GoogleFonts.montserrat(
        textStyle: const TextStyle(fontWeight: FontWeight.normal));
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: Text(
          "Coming soon...\nPlease revert to mobile version and try again.",
          style: fontStyle1,
        ),
      ),
    );
  }

  Widget mixedScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.ubuntu(
        textStyle: TextStyle(
            fontSize: size.width * 0.07,
            color: constantValues.whiteColor,
            fontWeight: FontWeight.w600));
    final fontStyle1b = GoogleFonts.redHatDisplay(
        textStyle: TextStyle(
            fontSize: size.width * 0.04,
            color: constantValues.whiteColor,
            fontWeight: FontWeight.w300));
    final fontStyle1c = GoogleFonts.redHatDisplay(
        textStyle: TextStyle(
            fontSize: size.width * 0.04,
            color: constantValues.whiteColor2,
            fontWeight: FontWeight.w400));
    final fontStyle1d = GoogleFonts.redHatDisplay(
        textStyle: TextStyle(
            color: constantValues.whiteColor2,
            fontWeight: FontWeight.w400));
    return Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(constantValues.blackColor2,
            BlendMode.modulate),
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          )),
        ),
      ),
      Positioned(
          top: 40,
          left: size.width * 0.05,
          child: CircleAvatar(
            radius: size.width * 0.03,
            backgroundColor: constantValues.transparentColor,
            child: Image.asset(
              "assets/icons/logo.png",
            ),
          )),
      Positioned(
          top: 20,
          left: size.width * 0.5,
          child: Icon(Icons.cookie_rounded,
              size: size.width * 0.4, color: constantValues.whiteColor2)),
      Positioned(
          top: size.height * 0.62,
          left: size.width * 0.75,
          child: RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.star_rounded,
                size: size.width * 0.08, color: constantValues.whiteColor2),
          )),
      Positioned(
          bottom: 10,
          left: size.width * 0.05,
          child: RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.star_border,
                size: size.width * 0.1, color: constantValues.whiteColor2),
          )),
      Positioned(
          top: size.height * 0.45,
          left: size.width * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("David Kemdirim", style: fontStyle1a),
              Text("@call_me_joanes", style: fontStyle1b),
            ],
          )
              .animate()
              .fadeIn(duration: const Duration(seconds: 2))
              .slideY(curve: Curves.bounceInOut)),
      Positioned(
        top: size.height * 0.6,
        left: size.width * 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.9,
              child: Text(
                "Software Developer  |  Network Engineer\nHey there! Welcome to my cubicle.\nI'm a Software developer who enjoys building cross-platform applications using various languages and frameworks.",
                style: fontStyle1c,
                textAlign: TextAlign.left,
              )
                  .animate()
                  .fadeIn(duration: const Duration(seconds: 2))
                  .slideX(curve: Curves.bounceInOut),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonB(
                    height: size.height * 0.04,
                    icon: Icons.close_rounded,
                    iconSize: size.width * 0.05,
                    backgroundColor: constantValues.blackColor2,
                    iconColor: constantValues.whiteColor2,
                    onpress: () {
                      context.pop();
                    }),
                ButtonB(
                    height: size.height * 0.08,
                    icon: Icons.double_arrow_rounded,
                    iconSize: size.width * 0.1,
                    backgroundColor: constantValues.primaryColor,
                    iconColor: constantValues.whiteColor,
                    onpress: () {
                      context.goNamed("home");
                    }),
              ],
            )
                .animate()
                .fadeIn(duration: const Duration(seconds: 2))
                .slideX(curve: Curves.bounceInOut),
            SizedBox(height: size.height * 0.015),
            Text("Version: ${constantValues.appVersion}", style: fontStyle1d),
          ],
        ),
      ),
    ]);
  }
}

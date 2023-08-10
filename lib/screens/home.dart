// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:davidjoanes/widgets/buttons.dart';
import 'package:davidjoanes/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/controller.dart';
import '../controllers/theme_controller.dart';
import '../widgets/image_viewer.dart';
import '../widgets/overlay_builder.dart';
import '../widgets/responsiveness.dart';
import '../widgets/route_controllers.dart';
import '../widgets/theme_controller.dart';

final globalBucket = PageStorageBucket();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    Size size = MediaQuery.of(context).size;
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final fontStyle1a = GoogleFonts.ubuntu(
        textStyle: const TextStyle(fontWeight: FontWeight.w800));
    return PageStorage(
      bucket: globalBucket,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: userInfo.read("isDarkTheme")
              ? constantValues.blackColor3
              : constantValues.whiteColor,
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/icons/logo.png", scale: 100),
          ),
          title: Text("David Joanes Kemdirim",
              style: fontStyle1a, overflow: TextOverflow.ellipsis),
          actions: [
            ThemeController(
              themeChanger: themeChanger,
              size: size.width * 0.04,
            ),
            const SizedBox(width: 10)
          ],
        ),
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
    final fontStyle1 = GoogleFonts.redHatDisplay(textStyle: const TextStyle());
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
    final fontStyle1a = GoogleFonts.redHatDisplay(
        textStyle: TextStyle(
            color: constantValues.whiteColor,
            fontWeight: FontWeight.w800,
            fontSize: size.width * 0.06));
    final fontStyle1b = GoogleFonts.redHatDisplay(
        textStyle: TextStyle(
            color: constantValues.whiteColor, fontWeight: FontWeight.w500));
    final fontStyle2a = GoogleFonts.redHatDisplay(
        textStyle: TextStyle(
            fontWeight: FontWeight.w800, fontSize: size.width * 0.06));
    final fontStyle2b = GoogleFonts.redHatDisplay(
        textStyle: const TextStyle(fontWeight: FontWeight.w800));
    final fontStyle2c = GoogleFonts.redHatDisplay(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: size.width * 0.05),
            child: Column(
              children: [
                // About Me
                Card(
                  elevation: 5,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            constantValues.blackColor2, BlendMode.modulate),
                        child: Container(
                          height: constantValues.aboutMe.length.toDouble() +
                              size.height * 0.15,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/me_3.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Positioned(
                          top: size.height * 0.3,
                          left: size.width * 0.02,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("About me", style: fontStyle1a),
                                  SizedBox(width: size.width * 0.05),
                                  ButtonC2(
                                      width: size.width * 0.22,
                                      text: "View CV",
                                      onpress: () => downloadFile(
                                          "assets/assets/cv/KemdirimDavid.pdf"))
                                ],
                              )
                                  .animate()
                                  .fadeIn(
                                      duration:
                                          const Duration(milliseconds: 2000))
                                  .slideX(curve: Curves.bounceInOut),
                              // ,
                              SizedBox(height: size.height * 0.04),
                              SizedBox(
                                      width: size.width * 0.8,
                                      child: Text(
                                        constantValues.aboutMe,
                                        style: fontStyle1b,
                                      ))
                                  .animate()
                                  .fadeIn(
                                      duration:
                                          const Duration(milliseconds: 2000))
                                  .slideX(curve: Curves.bounceInOut),
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                // Work Experience
                Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                          child: ListTile(
                              leading:
                                  Text("Work Experience", style: fontStyle2a)),
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Text(constantValues.experienceBrief,
                              style: fontStyle2c),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.02),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ImageButton(
                                        height: size.height * 0.08,
                                        width: size.width * 0.15,
                                        image: "assets/icons/huawei_logo.jpg",
                                        selected: userInfo.read(
                                                    "selectedOrganization") ==
                                                "huawei"
                                            ? true
                                            : false,
                                        onpress: () {
                                          setState(() {
                                            userInfo.write(
                                              "selectedOrganization",
                                              "huawei",
                                            );
                                          });
                                        }),
                                    ImageButton(
                                        height: size.height * 0.08,
                                        width: size.width * 0.15,
                                        image:
                                            "assets/icons/acecore_logo_2.jpg",
                                        selected: userInfo.read(
                                                    "selectedOrganization") ==
                                                "acecore"
                                            ? true
                                            : false,
                                        onpress: () {
                                          setState(() {
                                            userInfo.write(
                                              "selectedOrganization",
                                              "acecore",
                                            );
                                          });
                                        }),
                                    ImageButton(
                                        height: size.height * 0.08,
                                        width: size.width * 0.15,
                                        image: "assets/icons/cite_logo.png",
                                        selected: userInfo.read(
                                                    "selectedOrganization") ==
                                                "cite"
                                            ? true
                                            : false,
                                        onpress: () {
                                          setState(() {
                                            userInfo.write(
                                              "selectedOrganization",
                                              "cite",
                                            );
                                          });
                                        }),
                                    ImageButton(
                                        height: size.height * 0.08,
                                        width: size.width * 0.15,
                                        image: "assets/icons/huawei_logo.jpg",
                                        selected: userInfo.read(
                                                    "selectedOrganization") ==
                                                "huawei2"
                                            ? true
                                            : false,
                                        onpress: () {
                                          setState(() {
                                            userInfo.write(
                                              "selectedOrganization",
                                              "huawei2",
                                            );
                                          });
                                        }),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.02),
                                SizedBox(
                                  width: size.width * 0.8,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                            constantValues.experience1[
                                                userInfo.read(
                                                    "selectedOrganization")]![0],
                                            style: fontStyle2b),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                constantValues.experience1[
                                                    userInfo.read(
                                                        "selectedOrganization")]![1],
                                                style: fontStyle2c),
                                            Text(
                                                constantValues.experience1[
                                                    userInfo.read(
                                                        "selectedOrganization")]![2],
                                                style: fontStyle2c),
                                          ],
                                        ),
                                        trailing: ButtonC(
                                            width: size.width * 0.2,
                                            text: "Visit",
                                            onpress: () {
                                              RouteTo.openTab(constantValues
                                                      .experience1[
                                                  userInfo.read(
                                                      "selectedOrganization")]![3]);
                                            }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.04),
                                        child: SizedBox(
                                            height: size.height * 0.4,
                                            width: size.width * 0.8,
                                            child: ListView.builder(
                                                key: const PageStorageKey<
                                                    String>("workExperience"),
                                                scrollDirection: Axis.vertical,
                                                itemCount: constantValues
                                                    .experience2[userInfo.read(
                                                        "selectedOrganization")]!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                size.height *
                                                                    0.01),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        constantValues
                                                                    .experience2[
                                                                userInfo.read(
                                                                    "selectedOrganization")]![
                                                            0][0] as Widget,
                                                        SizedBox(
                                                            width: size.width *
                                                                0.02),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.65,
                                                          child: Text(
                                                              constantValues
                                                                          .experience2[
                                                                      userInfo.read(
                                                                          "selectedOrganization")]![index]
                                                                  [1] as String,
                                                              style:
                                                                  fontStyle2c),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                })),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: size.height * 0.05),
                // My Products
                Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.02,
                          ),
                          child: ListTile(
                              leading:
                                  Text("What I've Cooked", style: fontStyle2a)),
                        ),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Text(constantValues.myProductsBrief,
                              style: fontStyle2c),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.04),
                          child: SizedBox(
                            height: size.height * 0.5,
                            width: size.width * 0.8,
                            child: ListView.builder(
                                key: const PageStorageKey<String>("myProducts"),
                                scrollDirection: Axis.vertical,
                                itemCount: constantValues.myProducts.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.01),
                                    child: Card(
                                      elevation: 2,
                                      child: ListTile(
                                        leading: UserProfilePicture(
                                            image: constantValues
                                                .myProductsImage[index][0],
                                            radius: 20,
                                            onClicked: () {
                                              Navigator.of(context).push(
                                                  OverlayBuilder(
                                                      builder: (context) =>
                                                          DisplayImage2(
                                                              index: index)));
                                            }),
                                        title: Text(
                                            constantValues.myProducts[index][0],
                                            style: fontStyle2b),
                                        subtitle: Text(
                                            constantValues.myProducts[index][1],
                                            style: fontStyle2c),
                                        trailing: ButtonC(
                                            width: size.width * 0.12,
                                            text: "View",
                                            onpress: () {
                                              RouteTo.openTab(constantValues
                                                  .myProducts[index][2]);
                                            }),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              OverlayBuilder(
                                                  builder: (context) =>
                                                      DisplayImage2(
                                                          index: index)));
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    )),
                SizedBox(height: size.height * 0.05),
                // Technology Direction
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                        child: ListTile(
                            leading: Text("Technology Direction",
                                style: fontStyle2a)),
                      ),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Text(constantValues.toolsIUseBrief,
                            style: fontStyle2c),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.04),
                        child: SizedBox(
                            height: size.height * 0.5,
                            width: size.width * 0.8,
                            child: ListView.builder(
                              key: const PageStorageKey<String>(
                                  "technologyDirection"),
                              scrollDirection: Axis.vertical,
                              itemCount: constantValues.toolsIUse.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      leading: constantValues.toolsIUse[index]
                                          [0] as Widget,
                                      title: Text(constantValues
                                          .toolsIUse[index][1] as String),
                                    ));
                              },
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                // Certifications
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                        child: ListTile(
                            leading:
                                Text("Certifications", style: fontStyle2a)),
                      ),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Text(constantValues.certificatesBrief,
                            style: fontStyle2c),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.04),
                        child: SizedBox(
                            height: size.height * 0.5,
                            width: size.width * 0.8,
                            child: ListView.builder(
                                key: const PageStorageKey<String>(
                                    "certifications"),
                                scrollDirection: Axis.vertical,
                                itemCount: constantValues.certificates.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.01),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(OverlayBuilder(
                                            builder: (context) => DisplayImage(
                                                image: AssetImage(constantValues
                                                    .certificates[index][0]))));
                                      },
                                      child: Card(
                                          elevation: 2,
                                          child: Stack(
                                            children: [
                                              ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    userInfo.read("isDarkTheme")
                                                        ? constantValues
                                                            .whiteColor2
                                                        : constantValues
                                                            .blackColor2,
                                                    BlendMode.modulate),
                                              ),
                                              Container(
                                                height: size.height * 0.3,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          constantValues
                                                                  .certificates[
                                                              index][0]),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ],
                                          )),
                                    ),
                                  );
                                })),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
              ],
            )
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 1500))
                .slideY(curve: Curves.elasticIn),
          ),
          Card(
              elevation: 0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),
                    child: ListTile(
                        leading: Text("Connect with Me!", style: fontStyle2a)),
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child:
                        Text(constantValues.connectWithMe, style: fontStyle2c),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.05),
                    child: SizedBox(
                        height: size.height * 0.05,
                        child: ListView.builder(
                            key: const PageStorageKey<String>("myhandles"),
                            scrollDirection: Axis.horizontal,
                            itemCount: constantValues.myHandles.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02),
                                child: IconButton(
                                    icon: constantValues.myHandles[index][0]
                                        as Widget,
                                    onPressed: () {
                                      RouteTo.openTab(
                                          constantValues.myHandles[index][1]);
                                    }),
                              );
                            })),
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ))
        ],
      ),
    );
  }

  downloadFile(url) {
    AnchorElement element = AnchorElement(href: url);
    element.download = "KemdirimDavid.pdf";
    element.click();
  }
}

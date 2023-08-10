import 'package:davidjoanes/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/controller.dart';

final constantValues = Get.find<Constants>();
var userInfo = GetStorage();

class ThemeController extends StatefulWidget {
  final ThemeChanger themeChanger;
  final double size;
  const ThemeController({super.key, required this.themeChanger, required this.size});

  @override
  State<ThemeController> createState() => _ThemeControllerState();
}

class _ThemeControllerState extends State<ThemeController> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.size,
      backgroundColor: constantValues.blackColor,
      child: IconButton(
        iconSize: widget.size,
        icon: Icon(
          userInfo.read("isDarkTheme")
              ? Icons.light_mode
              : Icons.light_mode_outlined,
        ),
        onPressed: () {
          setState(() {
            userInfo.write("isDarkTheme", !userInfo.read("isDarkTheme"));
          });
          widget.themeChanger.setTheme(userInfo.read("isDarkTheme")
              ? ThemeData.dark()
              : ThemeData(
                  primarySwatch:
                      MaterialColor(0xFF00FF00, constantValues.defaultColor),
                  brightness: Brightness.light));
        },
      ),
    );
  }
}

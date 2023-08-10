import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controller.dart';

final constantValues = Get.find<Constants>();
var userInfo = GetStorage();

class ButtonA extends StatefulWidget {
  const ButtonA(
      {Key? key,
      required this.width,
      required this.text,
      required this.onpress})
      : super(key: key);
  final double width;
  final String text;
  final Function onpress;

  @override
  State<ButtonA> createState() => _ButtonAState();
}

class _ButtonAState extends State<ButtonA> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: newElevatedButton(context),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            side: BorderSide(width: 2, color: constantValues.primaryColor))),
        backgroundColor: MaterialStateProperty.all(constantValues.whiteColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.ubuntu(
            textStyle: TextStyle(color: constantValues.primaryColor)),
      ),
      onPressed: () async {
        await widget.onpress();
      },
    );
  }
}

class ButtonB extends StatefulWidget {
  const ButtonB(
      {Key? key,
      required this.height,
      required this.icon,
      required this.iconSize,
      required this.backgroundColor,
      required this.iconColor,
      required this.onpress})
      : super(key: key);
  final double height;
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color iconColor;
  final Function onpress;

  @override
  State<ButtonB> createState() => _ButtonBState();
}

class _ButtonBState extends State<ButtonB> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: newElevatedButton(context),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder(
            side: BorderSide(width: 1, color: widget.backgroundColor))),
        backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
      ),
      child: Icon(widget.icon, size: widget.iconSize, color: widget.iconColor),
      onPressed: () async {
        await widget.onpress();
      },
    );
  }
}

class ButtonC extends StatefulWidget {
  const ButtonC(
      {Key? key,
      required this.width,
      required this.text,
      required this.onpress})
      : super(key: key);
  final double width;
  final String text;
  final Function onpress;

  @override
  State<ButtonC> createState() => _ButtonCState();
}

class _ButtonCState extends State<ButtonC> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: newElevatedButton(context),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(1),
            ),
            side: BorderSide(width: 2, color: constantValues.primaryColor))),
        backgroundColor: MaterialStateProperty.all(userInfo.read("isDarkTheme") ? constantValues.blackColor3 : constantValues.whiteColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.ubuntu(textStyle: TextStyle(color: constantValues.primaryColor)),
      ),
      onPressed: () async {
        await widget.onpress();
      },
    );
  }
}

class ButtonC2 extends StatefulWidget {
  const ButtonC2(
      {Key? key,
      required this.width,
      required this.text,
      required this.onpress})
      : super(key: key);
  final double width;
  final String text;
  final Function onpress;

  @override
  State<ButtonC2> createState() => _ButtonC2State();
}

class _ButtonC2State extends State<ButtonC2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: newElevatedButton(context),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(1),
            ),
            side: BorderSide(width: 2, color: constantValues.primaryColor))),
        backgroundColor: MaterialStateProperty.all(constantValues.transparentColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.ubuntu(textStyle: TextStyle(color: constantValues.primaryColor)),
      ),
      onPressed: () async {
        await widget.onpress();
      },
    );
  }
}

class ImageButton extends StatefulWidget {
  const ImageButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      required this.selected,
      required this.onpress})
      : super(key: key);
  final double height;
  final double width;
  final String image;
  final bool selected;
  final Function onpress;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: widget.selected ? constantValues.primaryColor : constantValues.transparentColor),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: InkWell(
            child: Ink.image(image: AssetImage(widget.image), fit: BoxFit.cover),
            onTap: () async {
              await widget.onpress();
            },
          ),
        ),
      ),
    );
  }
}

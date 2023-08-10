import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  const Responsive(
      {Key? key, required this.desktopScreen, required this.mixedScreen})
      : super(key: key);
  final Widget? desktopScreen;
  final Widget? mixedScreen;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return widget.desktopScreen!;
      } else {
        return widget.mixedScreen!;
      }
    });
  }
}

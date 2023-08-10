// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_declarations

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/controller.dart';

final constantValues = Get.find<Constants>();

class DisplayImage extends StatefulWidget {
  DisplayImage({super.key, this.image});
  late var image;

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage>
    with SingleTickerProviderStateMixin {
  final constantValues = Get.find<Constants>();
  TransformationController controller = TransformationController();
  TapDownDetails? tapDownDetails;
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300))
    ..addListener(() {
      controller.value = animation!.value;
    });
  Animation<Matrix4>? animation;
  final double minScale = 1;
  final double maxScale = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.01, vertical: size.height * 0.2),
          child: GestureDetector(
            onDoubleTapDown: ((details) => tapDownDetails = details),
            onDoubleTap: () {
              final position = tapDownDetails!.localPosition;
              final double scale = 3;
              final x = -position.dx * (scale - 1);
              final y = -position.dy * (scale - 1);
              final zoomed = Matrix4.identity()
                ..translate(x, y)
                ..scale(scale);
              // final zoomedValue =
              //     controller.value.isIdentity() ? zoomed : Matrix4.identity();
              controller.value = zoomed;
            },
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              transformationController: controller,
              panEnabled: true,
              scaleEnabled: true,
              minScale: minScale,
              maxScale: maxScale,
              onInteractionEnd: (details) {
                _resetAnimation();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                  image: DecorationImage(
                    image: widget.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            right: size.width * 0.22,
            top: size.height * 0.12,
            child: GestureDetector(
              child: Icon(Icons.close, color: constantValues.whiteColor),
              onTap: () {
                context.pop();
              },
            ))
      ],
    );
  }

  void _resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward(from: 0);
  }
}

class DisplayImage2 extends StatefulWidget {
  DisplayImage2({super.key, required this.index});
  final int index;

  @override
  State<DisplayImage2> createState() => _DisplayImage2State();
}

class _DisplayImage2State extends State<DisplayImage2>
    with SingleTickerProviderStateMixin {
  final constantValues = Get.find<Constants>();
  TransformationController controller = TransformationController();
  TapDownDetails? tapDownDetails;
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300))
    ..addListener(() {
      controller.value = animation!.value;
    });
  Animation<Matrix4>? animation;
  final double minScale = 1;
  final double maxScale = 4;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.01, vertical: size.height * 0.2),
          child: GestureDetector(
            onDoubleTapDown: ((details) => tapDownDetails = details),
            onDoubleTap: () {
              final position = tapDownDetails!.localPosition;
              final double scale = 3;
              final x = -position.dx * (scale - 1);
              final y = -position.dy * (scale - 1);
              final zoomed = Matrix4.identity()
                ..translate(x, y)
                ..scale(scale);
              // final zoomedValue =
              //     controller.value.isIdentity() ? zoomed : Matrix4.identity();
              controller.value = zoomed;
            },
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              transformationController: controller,
              panEnabled: true,
              scaleEnabled: true,
              minScale: minScale,
              maxScale: maxScale,
              onInteractionEnd: (details) {
                _resetAnimation();
              },
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  height: size.height * 0.5,
                ),
                items: constantValues.myProductsImage[widget.index].map((item) {
                  return GridTile(
                    child: Image.asset(item, fit: BoxFit.contain),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Positioned(
            right: size.width * 0.22,
            top: size.height * 0.12,
            child: GestureDetector(
              child: Icon(Icons.close, color: constantValues.whiteColor),
              onTap: () {
                context.pop();
              },
            )),
        Positioned(
            left: size.width * 0.22,
            bottom: size.height * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: constantValues.whiteColor2, size: size.width*0.03),
                    SizedBox(width: size.width*0.02),
                    Text("Zoom in: Double tap (with one finger)", style: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: size.width*0.02, color: constantValues.whiteColor2)))
                  ],
                ),
                SizedBox(height: size.height*0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.info_outline, color: constantValues.whiteColor2, size: size.width*0.03),
                    SizedBox(width: size.width*0.02),
                    Text("Zoom out: Double tap (with two fingers)", style: GoogleFonts.ubuntu(textStyle: TextStyle(fontSize: size.width*0.02, color: constantValues.whiteColor2)))
                  ],
                ),
              ],
            )),
      ],
    );
  }

  void _resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
    animationController.forward(from: 0);
  }
}

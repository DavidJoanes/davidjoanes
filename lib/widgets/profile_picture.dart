import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/controller.dart';

final constantValues = Get.find<Constants>();
var userInfo = GetStorage();

class UserProfilePicture extends StatelessWidget {
  const UserProfilePicture({
    Key? key,
    required this.image,
    required this.radius,
    required this.onClicked,
  }) : super(key: key);
  final String image;
  final double radius;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: !image.startsWith('a')
          ? NetworkImage(image)
          : AssetImage(image) as ImageProvider,
      child: InkWell(
        onTap: onClicked,
      ),
    );
  }
}

class AdminProfilePicture extends StatelessWidget {
  const AdminProfilePicture({
    Key? key,
    required this.radius,
    required this.onClicked,
  }) : super(key: key);
  final double radius;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: userInfo.read("isDarkTheme") ? const AssetImage('assets/icons/user_white.png') : const AssetImage('assets/icons/user_black.png'),
      child: InkWell(
        onTap: onClicked,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';

class KElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed, onDisableTap;
  final Widget title;
  final Color color = kMainColor;
  final RxBool isEnable;
  const KElevatedButton({Key? key, required this.title, required this.isEnable,this.onDisableTap, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: isEnable.value ? onPressed : onDisableTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isEnable.value ? color : kWhiteColor,
        ),
        width: Get.width,
        height: 50,
        child: Center(
          child: title,
        ),
      ),
    ),);
  }
}
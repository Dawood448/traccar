
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Constants/colors.dart';
import '../Widgets/form_fields/k_text.dart';

class AppSnackbar {
  static void showErrorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kErrorColor,
      colorText: kWhiteColor,
      icon: const Icon(
        Icons.error_outline,
        color: kWhiteColor,
      ),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }

  static void showWarningSnackbar(String message) {
    Get.snackbar(
      'Warning',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kErrorColor,
      colorText: kWhiteColor,
      icon: const Icon(
        Icons.warning_amber_outlined,
        color: kWhiteColor,
      ),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }

  static void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: kGreenColor,
      colorText: kWhiteColor,
      icon: const Icon(
        Icons.check_circle_outline,
        color: kWhiteColor,
      ),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }
}

class Utils{
  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: kErrorColor ,
      textColor: kWhiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }
  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: kErrorColor ,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: kWhiteColor,
    );
  }
  static snackBar(String title, String message){
    Get.snackbar(
        title,
        message ,
        backgroundColor: kWhiteColor.withOpacity(0.7)
    );
  }
}
Future<OkCancelResult> errorOverlay(BuildContext context,
    {String? title, String? message, String? okLabel}) async {
  return await showOkAlertDialog(
      context: context, title: title, message: message, okLabel: okLabel);
}

Future<dynamic> loadingOverlay(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: kTransparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: CircleAvatar(
        radius: 60,
        backgroundColor: kWhiteColor,
        child: Lottie.asset('assets/images/loading.json'),
      ),
    ),
  );
}

Future<dynamic> loadingStatusDialog(BuildContext context,
    {required String title}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: kWhiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        const LoadingWidget(height: 70),
        KText(text: title, fontWeight: FontWeight.bold, fontSize: 16),
        const SizedBox(width: 8)
      ]),
    ),
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/animations/loading.json', height: height);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/colors.dart';
import '../../Data/Local/hive_storage.dart';
import '../../Widgets/form_fields/k_text.dart';
import '../auth_view/login_screen.dart';
import '../auth_view/signup_screen.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        String? accessToken = LocalStorage.getAccessToken;
        if (accessToken != null && accessToken.isNotEmpty) {
          // If token exists, navigate to the home screen
          Get.offAll(() => const HomeScreen());
        } else {
          // If token doesn't exist, navigate to the login screen
          // Get.offAll(() => const LoginScreen());
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.513,
              width: width,
              decoration: const BoxDecoration(
                color: kWhiteColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/Group 1000008372.png"),
                  fit: BoxFit.fitWidth, // Adjust the fit as needed
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 200, // Set the desired width
                  height: 80, // Set the desired height
                  child: SvgPicture.asset(
                    'assets/svg/logo.svg',
                  ),
                ),
              ),
            ),
            Container(
              height: height * 0.44,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  const Gap(15),
                  KText(
                    text: "AirTrack GPS - Reliable GPS \ntracking",
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  const Gap(15),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50.0, right: 25, top: 5),
                    child: KText(
                      text:
                          "Do you have an idea but are struggling to execute it because of the complexities involved? We are here to help entrepreneurs convert their ideas into products and services.",
                      color: kBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      maxLine: 5,
                    ),
                  ),
                  const Gap(25),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(const LoginScreen());
                    },
                    child: Card(
                      elevation: 5,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

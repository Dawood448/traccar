import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traccar/Controller/user_preferences/user_preferences.dart';
import '../../Constants/colors.dart';
import '../../Widgets/form_fields/k_text.dart';
import '../auth_view/login_screen.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserPreference userPreference = UserPreference();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
        userPreference.getUser().then((value) =>{
          if(value.isLogin != null && value.token != "") {
            Get.offAll(HomeScreen())
          }else{

          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.6,
                width: size.width,
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

              Positioned(
                  bottom: 0,
                  child: Container(
                height: size.height * 0.44,
                width: size.width,
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
              ))

            ],
          ),
        ),
      ),
    );
  }
}

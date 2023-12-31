import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:traccar/Constants/colors.dart';
import 'package:traccar/View/home_screen/home_screen.dart';
import 'package:traccar/Widgets/buttons/elevated_button/k_elevated_button.dart';
import 'package:traccar/Widgets/form_fields/k_text.dart';
import 'package:traccar/Widgets/form_fields/k_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    KText(text: "Welcome! Log In", fontSize: 20, fontWeight: FontWeight.bold,),
                    Gap(5),
                    KText(text: "Enter your Credentials", fontSize: 12, fontWeight: FontWeight.normal,),
                    Gap(20),
                    TextInputFieldWidget(
                      hintText: "Email",
                      lable: "Email",
                      isEmail: true,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    Gap(20),
                    TextInputFieldWidget(
                      hintText: "Password",
                      lable: "Password",
                      isPasswordNo: true,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                    Gap(20),
                    KElevatedButton(
                      title: KText(text: "LOG IN",color: kWhiteColor,fontSize: 18), isEnable: true.obs, onPressed: (){
                        Get.to(() => HomeScreen());
                    },),
                    Gap(20),
                    KText(text: "OR", fontSize: 12, fontWeight: FontWeight.normal,),
                    Gap(20),
                    KElevatedButton(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(MdiIcons.google,color: Colors.red,),
                          Gap(10),
                          KText(text: "CREATE ACCOUNT WITH GOOGLE", fontSize: 16,color: kWhiteColor, fontWeight: FontWeight.bold,),
                        ],
                      ), isEnable: true.obs, onPressed: (){},),
                  ]
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}

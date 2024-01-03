import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:traccar/Controller/auth_controller.dart';

import '../../Constants/colors.dart';
import '../../Widgets/form_fields/k_text.dart';
import '../../Widgets/form_fields/k_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final TextEditingController resetEmailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/logo.svg',
                        height: 55,
                        width: 140,
                      ),
                      const Gap(40),
                      KText(
                        text: "Reset Password",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(30),
                      TextInputFieldWidget(
                        controller: resetEmailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: "user@gmail.com",
                        lable: "Email",
                        isEmail: true,
                      ),
                      const Gap(20),
                      FilledButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                              AuthController().resetPassword(context, email: resetEmailController.text);
                          }
                        },
                        child: KText(
                          text: "Reset Password",
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

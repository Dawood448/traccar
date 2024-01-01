import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Controller/auth_controller.dart';
import '../../Utils/over_lay.dart';
import '../../Widgets/form_fields/k_text.dart';
import '../../Widgets/form_fields/k_text_field.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleConfirm() {
    setState(() {
      _obscureTextConfirm = !_obscureTextConfirm;
    });
  }

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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    KText(
                      text: "Signup",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    const Gap(20),
                    TextInputFieldWidget(
                      controller: emailController,
                      hintText: "user@gmail.com",
                      lable: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      isEmail: true,
                    ),
                    const Gap(20),
                    TextInputFieldWidget(
                      controller: passwordController,
                      hintText: "********",
                      lable: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      isPasswordNo: true,
                      obscure: _obscureText,
                      maxLines: 1,
                      suffixIcon: GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                          !_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Gap(20),
                    TextInputFieldWidget(
                      controller: confirmPasswordController,
                      hintText: "********",
                      lable: "Confirm Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      isPasswordNo: true,
                      obscure: _obscureTextConfirm,
                      maxLines: 1,
                      suffixIcon: GestureDetector(
                        onTap: _toggleConfirm,
                        child: Icon(
                          !_obscureTextConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Gap(40),
                    FilledButton(
                      onPressed: () {},
                      child: KText(
                        text: "Signup",
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Gap(20),
                    OutlinedButton(
                      onPressed: () {
                        kOverlayWithAsync(asyncFunction: () async {
                          await AuthController().signInWithGoogle(context);
                        });

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: "Signup with Google",
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          const Gap(10),
                          SvgPicture.asset(
                            'assets/svg/google-logo.svg',
                            width: 28,
                            height: 28,
                            // Other properties like color, alignment, etc.
                          ),
                        ],
                      ),
                    ),
                    const Gap(50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        KText(
                          text: "Already have an account?",
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(const LoginScreen());
                          },
                          child: KText(
                            text: "Login",
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traccar/Constants/colors.dart';
import 'package:traccar/View/auth_view/signup_screen.dart';
import 'package:traccar/Widgets/form_fields/k_text.dart';
import 'package:traccar/Widgets/form_fields/k_text_field.dart';
import '../../Controller/auth_controller.dart';
import '../../Utils/over_lay.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      KText(
                        text: "Login",
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
                        isPasswordNo: true,
                        obscure: _obscureText,
                        maxLines: 1,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            KText(
                              text: "Forgot Password?",
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            TextButton(
                              onPressed: () async {

                              },
                              child: KText(
                                text: "Reset",
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      FilledButton(
                        onPressed: () {
                          if(_formkey.currentState!.validate()){
                            kOverlayWithAsync(asyncFunction: () async {
                              await AuthController().signIn(context, email: emailController.text, password: passwordController.text);
                            });
                          }
                        },
                        child: KText(
                          text: "Login",
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Gap(20),
                      OutlinedButton(
                        onPressed: () async {
                          kOverlayWithAsync(asyncFunction: () async {
                            await AuthController().signInWithGoogle(context);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: "Login with Google",
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
                            text: "Don’t have an account?",
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(SignUpScreen());
                            },
                            child: KText(
                              text: "Signup",
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
      ),
    );
  }
}

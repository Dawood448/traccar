import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:traccar/Controller/auth_controller.dart';
import '../../Constants/colors.dart';
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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  final _authController = Get.put(AuthController());
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
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/logo.svg',
                        height: 55,
                        width: 140,
                      ),
                      const Gap(30),
                      KText(
                        text: "Signup",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(30),
                      TextInputFieldWidget(
                        controller: nameController,
                        hintText: "User Name",
                        lable: "Name",
                      ),
                      const Gap(20),
                      TextInputFieldWidget(
                        controller: emailController,
                        hintText: "user@gmail.com",
                        lable: "Email",
                        textInputType: TextInputType.emailAddress,

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
                        suffixIcon: GestureDetector(
                          onTap: _toggle,
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Gap(20),
                      TextInputFieldWidget(
                        controller: confirmPasswordController,
                        hintText: "********",
                        lable: "Confirm Password",
                        isPasswordNo: true,
                        obscure: _obscureTextConfirm,
                        maxLines: 1,
                        suffixIcon: GestureDetector(
                          onTap: _toggleConfirm,
                          child: Icon(
                            _obscureTextConfirm
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Gap(40),
                      FilledButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                             _authController.signUp(context,
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                confirmPassword:
                                confirmPasswordController.text);
                          }
                        },
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
                              text: "Continue with Google",
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Row(
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
      ),
    );
  }
}

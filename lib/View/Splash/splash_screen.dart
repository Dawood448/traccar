import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(onPressed: (){}, child: Text("ok")),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: (){}, child: Text("ok",style: TextStyle(color:AppColors.primary),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "username@gmail.com",
                hintStyle: TextStyle(color: AppColors.labelT),
                labelText: "Email",
                labelStyle: TextStyle(color: AppColors.hintT),
                floatingLabelBehavior: FloatingLabelBehavior.always,

              ),

            ),
          ),
          // Container(
          //   height: height * 0.6,
          //   width: width,
          //   color: Colors.red,
          // ),
          // Container(
          //   height: height * 0.4,
          //   width: width,
          //   decoration: const BoxDecoration(
          //     color: AppColors.grey,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(50),
          //       topRight: Radius.circular(50),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

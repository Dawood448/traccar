import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traccar/model/login_model/login_model.dart';
import '../Constants/api.dart';
import '../Data/Local/hive_storage.dart';
import '../Data/Network/request_client.dart';
import '../Utils/common.dart';
import '../Utils/logging.dart';
import '../View/home_screen/home_screen.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  String? errorMsg;

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  // Future<void> setUser(User userData) async {
  //   user = userData;
  //   await LocalStorage.setUser(userData.id, userData.token);
  //   update();
  // }

  Future<void> checkAuth() async {
    try {
      String? accessToken = LocalStorage.getAccessToken;
      if (accessToken != null) {
        print(accessToken);
        Get.offAll(HomeScreen());
        // var response = await NetworkClient.get(Apis.currentUser);
        // routeOnUser(response);
      } else {
        await logOut();
      }
    } on DioException catch (e) {
      Logger.message('Error: ${e.toString()}');
      await logOut();
    } catch (error) {
      Logger.message('Error: `${error.toString()}');
      await logOut();
    }
  }

  Future<void> signUp(BuildContext context,
      {required String email,
        required String name,
      required String password,
      required String confirmPassword}) async {

    try {
      final response = await NetworkClient.post(
        Apis.signUp,
        data: {
          "email": email,
          "name": name,
          "confirmed": confirmPassword,
          "password": password
        },
        isTokenRequired: false,
      );
      Logger.message('Status Code: ${response.statusCode}');
      if(response.statusCode != 200 ){
        Logger.error('Login Failed');
        return;
      }

      var model = LoginModel.fromJson(response.data);
      LocalStorage.setUser(model.user!.id.toString(), model.token);
      Get.offAll(HomeScreen());
      // routeOnUser(response);
    } on DioException catch (e) {
      Logger.message('Error: $e');
      if (context.mounted) Common.showDioErrorDialog(context, e: e);
    } catch (error) {
      Logger.message('Error: `${error.toString()}');
    }
  }

  Future<void> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      print(Apis.login);
      final response = await NetworkClient.post(
        Apis.login,
        data: {"email": email, "password": password},
        isTokenRequired: false,
      );

      Logger.message('Status Code: ${response.statusCode}');
      if(response.statusCode != 200 ){
        Logger.error('Login Failed');
        return;
      }

      var model = LoginModel.fromJson(response.data);
      LocalStorage.setUser(model.user!.id.toString(), model.token);
      Get.offAll(HomeScreen());
      // routeOnUser(response);
    } on DioException catch (e) {
      Logger.message('Error: $e');
      if (context.mounted) Common.showDioErrorDialog(context, e: e);
    } catch (error) {
      Logger.message('Error: `${error.toString()}');
    }
  }

  Future<void> signInWithGoogle(
    BuildContext context,
  ) async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: ['email', 'profile']).signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth == null) {
        Logger.error('Google Signin Failed');
        return;
      }
      if (kDebugMode) {
        log('ID Token: ${googleAuth.idToken.toString()}');
        print('Access Token: ${googleAuth.accessToken.toString()}');
        print('Email: ${googleUser?.email}');
        print('Display Name: ${googleUser?.displayName}');
        print('Photo Url: ${googleUser?.photoUrl}');
        print('ID: ${googleUser?.id}');
      }

      final response = await NetworkClient.post(
        Apis.socialSignIn,
        data: {"name": googleUser?.displayName, "email": googleUser?.email},
      );
      if (response.statusCode == 200) {
        LocalStorage.setUser(googleUser!.id, googleAuth.accessToken);
        Get.to(const HomeScreen());
      }
      // print(response.data);
      // routeOnUser(response);
    } on DioException catch (e) {
      log('${e.error} \n ${e.message} \n ${e.response} \n ${e.type}'
          .toString());
      // ignore: use_build_context_synchronously
      Common.showDioErrorDialog(context, e: e);
    } catch (error) {
      Logger.message(error.toString());
      // ignore: use_build_context_synchronously
      await showAdaptiveDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text('Exception: $error'),
            );
          });
    }
  }

  Future<void> logOut() async {
    await LocalStorage.setUserId(null);
    await LocalStorage.setAccessToken(null);
  }

// Future<void> forgetPass(BuildContext context, {required String email}) async {
//   try {
//     print(Apis.forgotPass);
//     final response = await NetworkClient.post(
//       Apis.forgotPass,
//       data: {"email": email},
//     );
//     Logger.message('Status Code: ${response.statusCode}');
//     print("${response.data}");
//
//     Get.to(() => OTPView(
//           secret: response.data['secret'],
//         ));
//   } on DioException catch (e) {
//     Logger.message('Error: $e');
//     if (context.mounted) Common.showDioErrorDialog(context, e: e);
//   } catch (error) {
//     Logger.message('Error: `${error.toString()}');
//   }
// }
}

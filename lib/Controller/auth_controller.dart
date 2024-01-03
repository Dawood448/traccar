
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traccar/Controller/user_preferences/user_preferences.dart';
import 'package:traccar/Data/Network/network_api_services.dart';
import 'package:traccar/Utils/common.dart';
import 'package:traccar/View/Splash/splash_screen.dart';
import 'package:traccar/model/login_model/login_model.dart';
import '../Constants/api.dart';
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
final _apiService = NetworkApiServices();
UserPreference userPreference = UserPreference();
  // Future<void> setUser(User userData) async {
  //   user = userData;
  //   await LocalStorage.setUser(userData.id, userData.token);
  //   update();
  // }

  Future<void> checkAuth() async {
    try {
      userPreference.getUser().then((value) async {
        if(value.token != null ){
          Get.offAll(HomeScreen());
        }
        else{
          await logOut();
        }
      });
    } catch (error) {
      Logger.message('Error: `${error.toString()}');
      await logOut();
    }
  }

  Future<dynamic> signUp(BuildContext context,
      {required String email,
      required String name,
      required String password,
      required String confirmPassword}) async {
    try {
      loadingStatusDialog(context, title: "Signing up");
      Map<String, dynamic> data = {
        "email": email,
        "name": name,
        "confirmed": confirmPassword,
        "password": password
      };
      final response = await _apiService.postApi(
        data,
        Apis.signUp,
      );
      Logger.message('SignUp Response: ${response}');
      if (response["status"] == false) {
        Get.back();
        Logger.error('Signup Failed');
        errorOverlay(context,message: response["message"],title: 'Error!',okLabel: 'OK');
      }else
      {
        Get.back();
        var model = LoginModel.fromJson(response.body);
        userPreference
            .saveUser(model)
            .then((value) => Get.offAll(HomeScreen()));
      }
    } on SocketException catch (e) {
      Get.back();
      Logger.message('Error: $e');
      errorOverlay(context, title: "Signup Error", message: e.message, okLabel: "OK");
    } catch (error) {
      Get.back();
      Logger.message('Error: `${error.toString()}');
      errorOverlay(context, title: "Signup Error", message: "Something went Wrong", okLabel: "OK");
    }
  }

  Future<dynamic> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      loadingStatusDialog(context, title: "Signing in");
      Map<String, dynamic> data = {"email": email, "password": password};
      print(Apis.login);
      final response = await _apiService.postApi(data, Apis.login);
      Logger.message('Status Code: ${response}');
      if (response["status"] == false) {
        Get.back();
        Logger.error('Login Failed');
      }
      Get.back();
      var model = LoginModel.fromJson(response);
      userPreference.saveUser(model).then((value) =>{
        Get.offAll(const HomeScreen())
      });
      // routeOnUser(response);
    } on SocketException catch (e) {
      Get.back();
      Logger.message('Error: $e');
      errorOverlay(context, title: "Sign In Failed", message: e.message, okLabel: "OK");
    } catch (error) {
      Get.back();
      Logger.message('Error: `${error.toString()}');
      errorOverlay(context, title: "Sign In Failed", message: "Something went Wrong", okLabel: "OK");
    }
  }

  Future<dynamic> signInWithGoogle(
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
      loadingStatusDialog(context, title: "loading");
      final response = await _apiService.postApi(
        {"name": googleUser?.displayName, "email": googleUser?.email},
        Apis.socialSignIn,
      );
      if (response['status'] == true) {
        Get.back();
        LoginModel model = LoginModel.fromJson(response);
        userPreference.saveUser(model).then((value) => Get.offAll(HomeScreen()));
      }
      else{
        Get.back();
      }
      // print(response.data);
      // routeOnUser(response);
    } on SocketException catch (e) {
      Get.back();
      errorOverlay(context, title: "Sign In Failed", message: e.message, okLabel: "OK");
    } catch (error) {
      Logger.message(error.toString());
      // ignore: use_build_context_synchronously
      errorOverlay(context, title: "Sign In Failed", message: "Something Went Wrong", okLabel: "OK");
    }
  }

  Future<void> logOut() async {
    userPreference.removeUser().then((value) => {
      Get.offAll(SplashScreen())
    });
  }

}

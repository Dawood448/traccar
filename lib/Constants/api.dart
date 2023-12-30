class APIs {
  static String baseUrl = "http://server.geekybugs.com:8082/api/v1/";
  static String socketUrl = "ws://server.geekybugs.com:8082";
  // static String baseUrl = "https://4f79-182-185-214-85.ngrok-free.app/api/v1/";
  // static String socketUrl = "ws://4f79-182-185-214-85.ngrok-free.app";

  //? Authentication
  static String sentOTP = "${baseUrl}auth/send-otp";
  static String verifyOTP = "${baseUrl}auth/verify-otp";
  static String resendOTP = "${baseUrl}auth/resend-otp";

  //? Users
  static String signup = "${baseUrl}user/signup";
  static String getMe = "${baseUrl}user/me";
  static String deleteUser = "${baseUrl}user/delete";
  static String logout = "${baseUrl}user/logout";
  static String getUser = "${baseUrl}user";
  static String upDateUser = "${baseUrl}user/update";

  //? Accommodations

  static String createAccommodation = '${baseUrl}accommodation/create';
  static String ownersAccommodation = '${baseUrl}accommodation/owner';
  static String nearbyAccommodation = '${baseUrl}accommodation/nearby';
  static String updateAccommodation = '${baseUrl}accommodation/update';
  static String deleteAccommodation = '${baseUrl}accommodation/delete';
  static String getAccommodationById = '${baseUrl}accommodation';

  //? chat
  static String getChatHistory = '${baseUrl}chat/history';
}
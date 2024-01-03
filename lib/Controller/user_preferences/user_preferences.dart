import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../model/login_model/login_model.dart';

class UserPreference {
  static const String _userKey = 'user';

  Future<void> saveUser(LoginModel response) async {
    print('Saving user...');
    SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.setBool('status', response.status!);
    await sp.setString('message', response.message!);
    await sp.setString('token', response.token!);
    await sp.setString('cookieData', response.cookieData!);
    await sp.setString('user', jsonEncode(response.user)); // Convert user object to JSON string
    await sp.setInt('userRole', response.userRole!);

    print('User saved.');
  }

  Future<LoginModel> getUser() async {
    print('Getting user...');
    SharedPreferences sp = await SharedPreferences.getInstance();

    final bool status = sp.getBool('status') ?? false;
    final String message = sp.getString('message') ?? '';
    final String token = sp.getString('token') ?? '';
    final String cookieData = sp.getString('cookieData') ?? '';
    final User user = User.fromJson(jsonDecode(sp.getString('user') ?? '{}')); // Convert JSON string to User object
    final int userRole = sp.getInt('userRole') ?? 0;

    print('User got.');

    return LoginModel(
      status: status,
      message: message,
      token: token,
      cookieData: cookieData,
      user: user,
      userRole: userRole,
    );
  }

  Future<void> removeUser() async {
    print('Removing user...');
    SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.remove(_userKey);

    print('User removed.');
  }
}

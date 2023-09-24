import 'package:flutter/material.dart';
import '../services/user_service.dart';
import 'package:go_router/go_router.dart';
import '../utils/user_preference.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool loading = false;
  bool loggedIn = false;

  void toggleLoading() {
    loading = !loading;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void setUsername(String value) {
    usernameController.text = value;
    notifyListeners();
  }

  void setPassword(String value) {
    passwordController.text = value;
    notifyListeners();
  }

  void login(BuildContext context) async {
    toggleLoading();
    var user = await UserSerivce.login(
        usernameController.text, passwordController.text);
    if (user != null) {
      await UserPrefrence.saveUser(user);
      toggleLoading();
      if (context.mounted) {
        loggedIn = true;
        context.go('/home');
      }
    } else {
      toggleLoading();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
          ),
        );
      }
    }
    notifyListeners();
  }

  Future<bool> logout(BuildContext context) async {
    var token = await UserPrefrence.getAuth();
    loggedIn = false;
    await UserPrefrence.removeUser();
    notifyListeners();
    return true;
  }

  Future<void> initializeApp() async {
    var token = await UserPrefrence.getAuth();

    if (token.isEmpty) {
      loggedIn = false;
    } else {
      loggedIn = true;
    }
    notifyListeners();
  }

  void checkLogin(BuildContext context, String route) async {
    var token = await UserPrefrence.getAuth();
    if (token.isNotEmpty) {
      if (context.mounted) {
        context.go(route);
      }
    }
    notifyListeners();
  }
}

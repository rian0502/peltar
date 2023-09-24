import 'package:peltar/services/user_service.dart';

import '../models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrence {

  static Future<bool> saveUser(UserData userData) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool('login', true);
    pref.setString('nama', userData.user!.nama!);
    pref.setString('email', userData.user!.email!);
    pref.setString('username', userData.user!.username!);
    pref.setString('role', userData.user!.role!.first);
    pref.setString('subsatker', userData.user!.subsatker!);
    pref.setString('satker', userData.user!.satker!);
    pref.setString('token', userData.authorisation!.token!);
    pref.setString('api_key', userData.apiKey!.apiKey!);
    pref.setString('expiration_date', userData.apiKey!.expirationDate!);
    return true;
  }

  static Future<List<String>> getAuth() async {
    var pref = await SharedPreferences.getInstance();
    List<String> auth = [];
    String token = pref.getString('token') ?? '';
    if (token.isEmpty) {
        pref.setBool('login', false);
      return auth;
    } else {
      var cek = await UserSerivce.checkToken(token);
      if (!cek) {
        pref.setBool('login', false);
        return auth;
      }
    }
    auth.add(pref.getString('token')!);
    auth.add(pref.getString('api_key')!);
    auth.add(pref.getString('expiration_date')!);
    return auth;
  }

  static Future<bool> removeUser() async {
    var pref = await SharedPreferences.getInstance();
    pref.remove('nama');
    pref.remove('email');
    pref.remove('username');
    pref.remove('role');
    pref.remove('subsatker');
    pref.remove('satker');
    pref.remove('token');
    pref.remove('api_key');
    pref.remove('expiration_date');
    pref.setBool('login', false);
    return true;
  }

  static Future<UserData> getUser() async {
    var pref = await SharedPreferences.getInstance();
    UserData userData = UserData(
      user: User(
        nama: pref.getString('nama'),
        email: pref.getString('email'),
        username: pref.getString('username'),
        role: [pref.getString('role')!],
        subsatker: pref.getString('subsatker'),
        satker: pref.getString('satker'),
      ),
      authorisation: Authorisation(
        token: pref.getString('token'),
        type: 'Bearer',
      ),
      apiKey: ApiKey(
        apiKey: pref.getString('api_key'),
        expirationDate: pref.getString('expiration_date'),
      ),
    );
    return userData;
  }
}

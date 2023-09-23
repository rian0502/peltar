import '../models/user_data.dart';
import 'package:dio/dio.dart';

class UserSerivce {
  static String url = 'http://10.0.2.2:8000/api/v1/auth/';
  static Dio dio = Dio();

  static Future<UserData?> login(String username, String password) async {
    dio.options.headers['content-Type'] = 'application/json';
    var response = await dio.post('${url}login',
        data: {'username': username, 'password': password});

    print(response.data);
    if (response.statusCode == 200) {
      return UserData.fromJson(response.data);
    } else {
      return null;
    }
  }

  static Future<bool> checkToken(String token) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.get('${url}profile');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> logout(String token) async {
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.post('${url}logout');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

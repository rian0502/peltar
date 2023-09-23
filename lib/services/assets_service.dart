import 'package:dio/dio.dart';
import 'package:peltar/models/assets.dart';

class AssetsService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api/v1/asset/';

  static Future<List<Asset>> getAssets(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.get('${_baseUrl}getall');
      if (response.statusCode == 200) {
        Assets assets = Assets.fromJson(response.data);
        return assets.asset!;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

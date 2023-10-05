import 'package:flutter/material.dart';
import 'package:peltar/models/assets.dart';
import 'package:peltar/utils/user_preference.dart';
import '../services/assets_service.dart';

class AssetsViewModel extends ChangeNotifier {
  List _assets = [];
  Asset? _asset;

  void setAssets(List assets) {
    _assets = assets;
    notifyListeners();
  }

  void setAsset(Asset asset) {
    _asset = asset;
    notifyListeners();
  }

  List get assets => _assets;

  Asset? get asset => _asset;

  Future<void> fetchAsset() async {
    try {
      var token = await UserPrefrence.getAuth();
      if (token.isEmpty) {

      } else {
        var assets = await AssetsService.getAssets(token[0]);
        if (assets.isNotEmpty) {
          setAssets(assets);
          notifyListeners();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

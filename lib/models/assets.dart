import 'dart:convert';

Assets assetsFromJson(String str) => Assets.fromJson(json.decode(str));
class Assets {
  String? status;
  List<Asset>? asset;

  Assets({this.status, this.asset});

  Assets.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['asset'] != null) {
      asset = <Asset>[];
      json['asset'].forEach((v) {
        asset!.add(Asset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (asset != null) {
      data['asset'] = asset!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


Asset assetFromJson(String str) => Asset.fromJson(json.decode(str));
class Asset {
  int? id;
  String? stockcode;
  String? codeAsset;
  String? serialnumber;
  String? namaAsset;
  String? merk;
  String? model;
  String? image;
  String? spesifikasi;
  String? deskripsi;
  String? lokasi;
  List<String>? kategori;
  String? status;
  String? updatedAt;
  String? createdAt;

  Asset(
      {this.id,
        this.stockcode,
        this.codeAsset,
        this.serialnumber,
        this.namaAsset,
        this.merk,
        this.model,
        this.image,
        this.spesifikasi,
        this.deskripsi,
        this.lokasi,
        this.kategori,
        this.status,
        this.updatedAt,
        this.createdAt});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockcode = json['stockcode'];
    codeAsset = json['code_asset'];
    serialnumber = json['serialnumber'];
    namaAsset = json['nama_asset'];
    merk = json['merk'];
    model = json['model'];
    image = json['image'];
    spesifikasi = json['spesifikasi'];
    deskripsi = json['deskripsi'];
    lokasi = json['lokasi'];
    kategori = json['kategori'].cast<String>();
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stockcode'] = stockcode;
    data['code_asset'] = codeAsset;
    data['serialnumber'] = serialnumber;
    data['nama_asset'] = namaAsset;
    data['merk'] = merk;
    data['model'] = model;
    data['image'] = image;
    data['spesifikasi'] = spesifikasi;
    data['deskripsi'] = deskripsi;
    data['lokasi'] = lokasi;
    data['kategori'] = kategori;
    data['status'] = status;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
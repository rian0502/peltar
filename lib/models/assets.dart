
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
        asset!.add(new Asset.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.asset != null) {
      data['asset'] = this.asset!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stockcode'] = this.stockcode;
    data['code_asset'] = this.codeAsset;
    data['serialnumber'] = this.serialnumber;
    data['nama_asset'] = this.namaAsset;
    data['merk'] = this.merk;
    data['model'] = this.model;
    data['image'] = this.image;
    data['spesifikasi'] = this.spesifikasi;
    data['deskripsi'] = this.deskripsi;
    data['lokasi'] = this.lokasi;
    data['kategori'] = this.kategori;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
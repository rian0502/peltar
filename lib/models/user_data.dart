import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

class UserData {
  String? status;
  User? user;
  Authorisation? authorisation;
  ApiKey? apiKey;

  UserData({status, user, authorisation, apiKey});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    authorisation = json['authorisation'] != null
        ? Authorisation.fromJson(json['authorisation'])
        : null;
    apiKey = json['api-key'] != null ? ApiKey.fromJson(json['api-key']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (authorisation != null) {
      data['authorisation'] = authorisation!.toJson();
    }
    if (apiKey != null) {
      data['api-key'] = apiKey!.toJson();
    }
    return data;
  }
}

class User {
  String? nama;
  String? email;
  String? username;
  List<String>? role;
  String? subsatker;
  String? satker;

  User({nama, email, username, role, subsatker, satker});

  User.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    username = json['username'];
    role = json['role'].cast<String>();
    subsatker = json['subsatker'];
    satker = json['satker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['username'] = username;
    data['role'] = role;
    data['subsatker'] = subsatker;
    data['satker'] = satker;
    return data;
  }
}

class Authorisation {
  String? token;
  String? type;

  Authorisation({token, type});

  Authorisation.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['type'] = type;
    return data;
  }
}

class ApiKey {
  String? apiKey;
  String? expirationDate;

  ApiKey({apiKey, expirationDate});

  ApiKey.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
    expirationDate = json['expiration_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey;
    data['expiration_date'] = expirationDate;
    return data;
  }
}

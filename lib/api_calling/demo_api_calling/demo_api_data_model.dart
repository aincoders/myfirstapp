

import 'dart:ffi';

class DemoApiDataModel {
  int? id;
  String? name;
  String? email;
  String? body;


  DemoApiDataModel({
    this.id,
    this.name,
    this.email,
    this.body,
  });

  DemoApiDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];

  }
  @override
  String toString() {
    return email ?? '';
  }
}


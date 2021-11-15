import 'dart:collection';

import 'package:fake_store/models/user/address.dart';

import 'name.dart';

class User {
  final Address address;
  final String id;
  final String number;
  final String zipcode;
  final Name name;
  final String phone;
  final String userProfile;
  final String userEmail;

  User(this.address, this.id, this.number, this.zipcode, this.name, this.phone,
      this.userProfile, this.userEmail);

  factory User.fromJson(Map<String, dynamic> dynamicList) {
    return User(
        Address.fromJson(dynamicList["address"] as Map<String, dynamic>),
        dynamicList["id"] as String,
        dynamicList["number"] as String,
        dynamicList["zipcode"] as String,
        Name.fromJson(dynamicList["name"] as Map<String, dynamic>),
        dynamicList["phone"] as String,
        dynamicList["userProfile"] as String,
        dynamicList["userEmail"] as String);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> dynamicList = HashMap();
    dynamicList["address"] = address.toJson();
    dynamicList["id"] = id;
    dynamicList["number"] = number;
    dynamicList["zipcode"] = zipcode;
    dynamicList["name"] = name.toJson();
    dynamicList["phone"] = phone;
    dynamicList["userProfile"] = userProfile;
    dynamicList["userEmail"] = userEmail;
    return dynamicList;
  }
}

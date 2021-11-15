import 'dart:collection';

class Address {
  final String city;
  final String street;

  Address(this.city, this.street);

  factory Address.fromJson(Map<String, dynamic> dynamicList) {
    return Address(
        dynamicList["city"] as String, dynamicList["street"] as String);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> dynamicList = HashMap();
    dynamicList["city"] = city;
    dynamicList["street"] = street;
    return dynamicList;
  }
}

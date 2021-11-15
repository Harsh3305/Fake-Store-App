import 'dart:collection';

class Name {
  final String firstName;
  final String lastName;

  Name(this.firstName, this.lastName);

  factory Name.fromJson(Map<String, dynamic> dynamicList) {
    return Name(
        dynamicList["firstname"] as String, dynamicList["lastname"] as String);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> dynamicList = HashMap();
    dynamicList["firstName"] = firstName;
    dynamicList["lastName"] = lastName;
    return dynamicList;
  }
}

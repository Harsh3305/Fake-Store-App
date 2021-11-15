import 'dart:collection';

class UserPassword {
  final String email;
  final String password;
  UserPassword(this.email, this.password);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = HashMap();
    json["email"] = email;
    json["password"] = password;
    return json;
  }
}

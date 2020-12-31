import 'package:flutter/foundation.dart';

class UserInfo {
  final String sub;
  final String email;

  UserInfo({@required this.sub, @required this.email});

  @override
  String toString() {
    return 'UserInfo{sub: $sub, email: $email}';
  }
}

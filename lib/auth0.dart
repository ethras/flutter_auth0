import 'dart:async';

import 'package:flutter/services.dart';

class Auth0 {
  static const MethodChannel _channel = const MethodChannel('auth0');

  static Future<bool> login(String audience) async {
    print("Logging in with audience : $audience");
    final Map<String, dynamic> params = {"audience": audience};
    final res = await _channel.invokeMethod('login', params);
    return res;
  }

  static Future<String> get accessToken async {
    final res = await _channel.invokeMethod("getToken");
    return res;
  }
}

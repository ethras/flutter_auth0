import 'dart:async';

import 'package:flutter/services.dart';

class Auth0 {
  static const MethodChannel _channel = const MethodChannel('auth0');

  static Future<void> login(String audience) async {
    final Map<String, dynamic> params = {"audience": audience};
    await _channel.invokeMethod('login', params);
  }

  static Future<String> get accessToken async {
    final res = await _channel.invokeMethod("getToken");
    return res;
  }
}

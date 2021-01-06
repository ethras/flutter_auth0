import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_auth0/user_info.dart';

class Auth0 {
  static const MethodChannel _channel = const MethodChannel('auth0');

  static Future<bool> login(String audience, {String scheme = "https"}) async {
    print("Logging in with audience : $audience");
    final Map<String, dynamic> params = {
      "audience": audience,
      "scheme": scheme
    };
    final res = await _channel.invokeMethod('login', params);
    return res;
  }

  static Future<UserInfo> getUserInfo({String accessToken}) async {
    accessToken = accessToken ?? await Auth0.accessToken;
    if (accessToken.isEmpty) {
      return null;
    }
    final Map<String, dynamic> params = {'accessToken': accessToken};
    final res = Map<String, dynamic>.from(
        await _channel.invokeMethod('userInfo', params));
    return UserInfo(sub: res['sub'], email: res['email']);
  }

  static Future<bool> logout() async {
    final res = await _channel.invokeMethod('logout');
    return res;
  }

  static Future<String> get accessToken async {
    try {
      final res = await _channel.invokeMethod("getToken");
      return res;
    } on PlatformException catch (e) {
      return null;
    }
  }

  static Future<bool> get isLoggedIn async {
    final res = await _channel.invokeMethod("isLoggedIn");
    return res;
  }
}

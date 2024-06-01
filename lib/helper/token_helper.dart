import 'package:flutter/material.dart';
import 'package:quize_app_bsp_tech/helper/local_storage_helper.dart';

class TokenHelper {
  static Future setToken(String token) async {
    // print(token);
    return await LocalStorageHelper.setItem("token", token);
  }

  static Future<String> getToken() async {
    String? token = await LocalStorageHelper.getItem("token");
    if (token != null) {
      debugPrint(token.toString());
      return token;
    } else {
      return '';
    }
  }

  static Future removeToken() async {
    return await LocalStorageHelper.removeItem("token");
  }
}

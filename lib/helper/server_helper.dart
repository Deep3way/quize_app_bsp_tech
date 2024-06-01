// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quize_app_bsp_tech/helper/secrets.dart';


import 'token_helper.dart';

class ServerHelper {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      maxRedirects: 0,
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(minutes: 2),
    ),
  );

  Future getData(String url, bool tokenRelated) async {
    if (tokenRelated) {
      var token = await TokenHelper.getToken();
      debugPrint("token $token");
      if (token != null) {
        // print("called token $url");
        debugPrint(token);
        _dio.options.headers["Authorization"] = "Bearer $token";
        var response = await _dio.get(url);
        _dio.options.headers["Authorization"] = null;
        debugPrint(response.toString());
        return response;
      } else {
        _dio.options.headers["Authorization"] = null;
        return null;
      }
    } else {
      var response = await _dio.get(url);
      _dio.options.headers["Authorization"] = null;
      debugPrint('adsfa ${response.data}');
      return response;
    }
  }

  Future postData(String url, dynamic postData, bool tokenRelated) async {
    if (tokenRelated == true) {
      var token = await TokenHelper.getToken();
      debugPrint(token.toString());
      _dio.options.headers["Authorization"] = "Bearer $token";
      // var response = await _dio.get(url);
      var response = await _dio.post(
        url,
        data: postData,
      );
      _dio.options.headers["Authorization"] = null;
      return response;
    } else {
      debugPrint("lela");
      debugPrint("token");
      // var response = await _dio.get(url);
      // __dio.options.headers["Authorization"] = null;
      var response = await _dio.post(url, data: postData);
      return response;
    }
  }

  Future patchData(String url, dynamic postData, bool tokenRelated) async {
    // Dio dio = Dio();

    if (tokenRelated == true) {
      var token = await TokenHelper.getToken();
      _dio.options.headers["Authorization"] = "Bearer $token";
      // var response = await dio.get(url);
      var response = await _dio.patch(
        url,
        data: postData,
      );
      _dio.options.headers["Authorization"] = null;
      return response;
    } else {
      debugPrint("lela");
      debugPrint("token");
      // var response = await dio.get(url);
      // _dio.options.headers["Authorization"] = null;
      debugPrint(url.toString());
      debugPrint(postData.toString());
      var response = await _dio.patch(url, data: postData);
      debugPrint(response.data.toString());
      return response;
    }
  }

  static String serverErrorMessage(DioException e) {
    try {
      log(e.toString());
      if (e.type == DioException.connectionTimeout ||
          e.type == DioException.receiveTimeout ||
          e.type == DioException.sendTimeout) {
        return 'Please check your internet connection';
      } else if (e.response!.statusCode == 503 ||
          e.response!.statusCode == 502) {
        return 'Server went down';
      } else {
        return e.response!.data != null
            ? e.response!.data!['error']!['message'].toString()
            : 'Something went wrong';
      }
    } catch (e) {
      return 'Something went wrong';
    }
  }
}

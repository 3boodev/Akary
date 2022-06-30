import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio = Dio(BaseOptions(
      baseUrl:
          "http://192.168.1.7:1337/api/", //"http://192.168.1.7:8000/api/", //
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
        'lang': lang,
        'Authorization': token ?? ''
      };
      return await dio!.post(url, queryParameters: query, data: data);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception ");
      }
      throw Exception(ex.message);
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return await dio!.put(url, queryParameters: query, data: data);
  }
}

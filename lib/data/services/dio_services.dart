import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:landing_and_login_screen/data/services/interceptors.dart';

enum HttpMethode { get, post, patch, put, delete }

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
    ),
  )..interceptors.add(AppInterceptors());

  Future request(HttpMethode methode, String path, {dynamic data}) async {
    try {
      Response result = await _dio.request(path,
          options: Options(
              method: methode.toString().split(".").last,
              headers: {
                'Accept': "application/json",
                'Content-Type': "application/json"
              }),
          data: data);
      return jsonEncode(result.data);
    } on Exception catch (ex) {
      log("EXCEPTION :: occured $ex");
    }
  }
}

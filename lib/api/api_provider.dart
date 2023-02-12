import 'dart:io';
import 'package:bookingbus/api/local_storage_provider.dart';
import 'package:bookingbus/api_url.dart';
import 'package:dio/dio.dart';

class APIProvider {
  Dio dio = Dio();
  static String Token = '';
  Map Data = {};

  static void setToken() {
    Token = LocalStorageProvider.getValue('token');
  }

  static bool get hasToken => Token.isNotEmpty;

  Future<Map> login(Map driver) async {
    try {
      var response = await Dio().post(APIUrl.login,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: driver);
      if (await LocalStorageProvider.setValue(
          'token', response.data["token"])) {
        Data = response.data;
        Token = Data["token"];
        Data["message"] = 'ok';
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Data = e.response!.data;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        // print(e.requestOptions);
        Data["message"] = e.message.toString();
      }
    }
    return Data;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": Token
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    var response;
    // final response = await dio.post(url, data: data);
    response = await dio.post(url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          "Authorization": Token
        }),
        data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    }
    return null;
  }

  Future<Map> refresh() async {
    try {
      var response = await Dio().get(
        APIUrl.refresh,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": Token
        }),
      );
      Data = response.data;
      Data["isSuccess"] = true;
    } on DioError catch (e) {
      if (e.response != null) {
        Data = e.response!.data;
        // print(e.response!.headers);
        // print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error

        Data["message"] = e.message.toString();
      }
    }
    return Data;
  }

  Future<bool> signUp() async {
    return await LocalStorageProvider.clear();
  }
}

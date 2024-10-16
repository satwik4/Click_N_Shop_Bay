// import 'package:dio/dio.dart';
//
// class DioHelper {
//   static late Dio dio;
//
//   static init(){
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://newsapi.org/',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//   }
//
//   // baseUrl / path / query
//   //
//   //url elly t7t de ==> path
//
//   static Future<Response> getData({
//     required String url,
//     required Map<String,dynamic> query,
// }) async{
//     return await dio.get(
//       url,
//       queryParameters: query,
//     );
//   }
//
// }

// ^^^^^^^^ NEWS APP ^^^^^^^^^
//==================================
// ######## SHOP APP #########

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type':'application/json',
        //   'lang':'en'
        // }
      ),
    );
  }

  // baseUrl / path / query
  //
  //url elly t7t de ==> path

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      // 'Authorization': token??'',
      'Authorization': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
}) async{
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

// ============================================>
  static Future<Response> putData({
    required String url,
    required Map<String,dynamic> data,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,
  }) async{
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}

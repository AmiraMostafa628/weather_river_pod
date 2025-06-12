import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/core/api/api_constance.dart';

class ApiClient{
 final Dio _dio;

  ApiClient(): _dio =Dio(

    BaseOptions(
      headers: {
        'Content-Type':'application/json',
      },
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {
        'Key':ApiConstants.apiKey,
      }
    ),
  );

   Future<Response> getData({
    required String path,
    Map<String,dynamic>? query
}) async{
    try{
      final response = await _dio.get(path,
        queryParameters: query,
      );
      return response;
    }on DioException catch(e){
      log('Dio error: ${e.message}');
      rethrow;
    }
  }

}
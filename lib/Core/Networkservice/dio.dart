import 'package:dio/dio.dart';
class DioHelper{
  static late  Dio dio;
  static void init(){
    final BaseOptions baseOptions=BaseOptions(
      baseUrl: "https://newsapi.org/v2/",

    );
    dio=Dio(
      baseOptions,
    );
  }
  static Future<Response> getData({required var url,
     Map<String, dynamic>? parameters
  })async{
    return await dio.get(url,
       queryParameters: parameters
    );

  }



}
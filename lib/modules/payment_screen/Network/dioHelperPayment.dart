import 'package:dio/dio.dart';
import 'package:san3a/shared/component/constant.dart';

class DioHelperPayment{
  static late  Dio dio;
  static initDio(){
    dio=Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        headers: {
          'Content-Type':'application/json',
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> postDataDio({
    required String url,
    Map<String,dynamic>? data
  })async{
    return await dio.post(url,data: data);

  }
}
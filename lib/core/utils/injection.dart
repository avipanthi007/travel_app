import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependecyInjection{

  static void injection(){
    final dio = Dio(BaseOptions(baseUrl: ""));
    Get.lazyPut<Dio>(()=>dio);
  }

}
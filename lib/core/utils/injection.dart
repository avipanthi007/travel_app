import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/utils/constants/api_url_constant.dart';
import 'package:travel_app/src/controllers/data_controller.dart';

class DependecyInjection{

  static void injection(){
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    Get.lazyPut<Dio>(()=>dio);
     Get.lazyPut(() => DataController(dio: dio));
  }

}
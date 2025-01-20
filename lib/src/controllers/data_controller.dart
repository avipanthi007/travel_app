import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/core/utils/helper/helper.dart';
import 'package:travel_app/services/api/home_services.dart';
import 'package:travel_app/src/models/data_model.dart';

class DataController extends GetxController{
  final Dio dio;
  late HomeServices homeServices;

  DataController({required this.dio}) {
    homeServices = HomeServices(dio: dio);
  }
  final isLoading = false.obs;
   final travelDataList = <DataModel>[].obs;

    Future<void> fetchTravelData() async {
    isLoading.value = true;
    print("Fetching Data...");
    final result = await homeServices.fetchTravelData();
    result.fold(
      (failure) {
        isLoading.value = false;
        debugPrint('Fetch failed: $failure');
        errorlog(failure);
        
      },
      (success) {
        travelDataList.assignAll(success);
         debugPrint('Fetch Success: $success');
         infolog(success.toString());
         
        isLoading.value = false;
      },
    );
  }


}
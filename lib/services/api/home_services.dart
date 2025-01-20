import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_app/core/utils/constants/api_url_constant.dart';
import 'package:travel_app/services/api/api_baseclient_services.dart';
import 'package:travel_app/src/models/data_model.dart';

class HomeServices {
    final Dio dio;

  HomeServices({required this.dio});

  Future<Either<String, List<DataModel>>> fetchTravelData() async {
    try {
      final response = await sendRequest(dio, RequestType.get, homeUrl);

      final success = response.data;
      if (success) {
        final data = response.data;

        final travelData = data
            .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return Right(travelData);
      } else {
        return const Left('Unknown error occurred');
      }
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

}
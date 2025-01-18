// import 'package:dio/dio.dart';
// import 'package:travel_app/core/utils/constants/api_url_constant.dart';
// import 'package:travel_app/core/utils/helper/helper.dart';
// import 'package:travel_app/services/exeption.dart';

// class ApiBaseClientService {
//   late Dio _dio;
//   bool _isRefreshing = false; // Flag to prevent multiple refresh calls
//   List<Function()> _refreshQueue = []; // Queue to hold requests while refreshing

//   ApiBaseClientService() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: baseUrl, // Replace with your base URL
//         connectTimeout: const Duration(seconds: 20),
//         receiveTimeout: const Duration(seconds: 25),
//         headers: {
//           'Accept': 'application/json',
//         },
//       ),
//     );

//     _dio.interceptors.add(LogInterceptor(
//       requestHeader: true,
//       requestBody: true,
//       responseBody: true,
//     ));

//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) async {
//         String? token;
//         if (token != null) {
//           options.headers['Authorization'] = 'Bearer $token';
//         }
//         return handler.next(options);
//       },
//       onError: (DioException e, handler) async {
//         if (e.response?.statusCode == 403 &&
//             e.response?.data['error'] == 'jwt expired') {
//           errorlog("Token expired, attempting to refresh.");
//           try {
//             await _handleTokenRefresh();
//             // Retry the original request
//             final newRequest = await _retryRequest(e.requestOptions);
//             return handler.resolve(newRequest);
//           } catch (refreshError) {
//             errorlog("Token refresh failed: $refreshError");
            
//             return handler.reject(e);
//           }
//         }
//         return handler.next(e); 
//       },
//     ));
//   }
//   Future<void> _handleTokenRefresh() async {
//     if (_isRefreshing) {
//       // If already refreshing, wait for it to finish
//       return await Future<void>.delayed(Duration(milliseconds: 500));
//     }
//     _isRefreshing = true;

//     try {
//       final refreshToken ="" ;
//       if (refreshToken == null) throw UnauthorizedException(message: "Refresh token not available.");

//       final response = await request(
//        endpoint: "" , // Replace with your refresh endpoint
//         data: {'refreshToken':""}, method: 'POST',
//       );

//       final newAccessToken = response.data['accessToken'];
      
//       errorlog("Token refreshed successfully.");
//     } catch (e) {
//       errorlog("Error refreshing token: $e");
//       throw UnauthorizedException(message: "Unable to refresh token.");
//     } finally {
//       _isRefreshing = false;
//     }
//   }
//   /// Retries the original request
//   Future<Response> _retryRequest(RequestOptions requestOptions) async {
//     final options = Options(
//       method: requestOptions.method,
//       headers: requestOptions.headers,
//     );
//     return await _dio.request(
//       requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options,
//     );
//   }
//   /// General API request method
//   Future<Response> request({
//     required String endpoint,
//     required String method,
//     Map<String, dynamic>? data,
//     Map<String, dynamic>? queryParams,
//     bool isMultipart = false,
//     FormData? formData,
//   }) async {
//     try {
//       Response response = await _dio.request(
//         endpoint,
//         data: isMultipart ? formData : data,
//         queryParameters: queryParams,
//         options: Options(method: method),
//       );
//       infolog('$method $endpoint - Response: ${response.data}');
//         return response;
//     }  on DioException catch (e) {

//       throw _handleError(e);
//     }
//   }

//   ApiExceptions _handleError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.cancel:
//         throw ApiExceptions(message: 'Request cancelled', data: error.response?.data);

//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.receiveTimeout:
//       case DioExceptionType.sendTimeout:
//         throw TimeoutException(message: 'Request timeout');

//       case DioExceptionType.badResponse:
//         final statusCode = error.response?.statusCode;
//         final data = error.response?.data;
//         final errorMessage = data is Map<String, dynamic> ? data['error'] : 'An error occurred';

//         if (statusCode == 400) {
//            throw BadRequestException(message: errorMessage, data: data); // Ensure detailed message is passed
//         } else if (statusCode == 401) {
//           throw UnauthorizedException(message: 'Unauthorized', data: data);
//         } else if (statusCode == 503) {
//           throw NoInternetException(message: 'Service unavailable');
//         }
//         throw ApiExceptions(
//           message: 'Error with status code $statusCode',
//           statusCode: statusCode,
//           data: data,
//         );


//       case DioExceptionType.connectionError:

//         throw ApiExceptions(message:'A connection error occurred. Please check your network and try again.', data: error.message);

//       case DioExceptionType.unknown:
//                // Check if the error is an ApiException and extract the message
//       print(error.error);
//         if (error.error is ApiExceptions) {
//           final apiException = error.error as ApiExceptions;
//           throw UnknownException(
//             message: apiException.data['data'],
//             data: apiException.data,
//           );
//         }

//         // Handle other unknown errors
//         throw UnknownException(
//           message: error.error?.toString() ?? 'Unknown error',
//           data: error.message,
//         );
//         case DioExceptionType.badCertificate:



//         throw UnknownException(message: 'Unknown error', data: error.message);
//     }
//   }

  
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:travel_app/core/errors/exception.dart';
import 'package:travel_app/core/utils/constants/api_url_constant.dart';

enum RequestType { get, post, put, delete, patch }

Future<Response> sendRequest(
  Dio dio,
  RequestType type,
  String endpoint, {
  Map<String, dynamic>? data,
  FormData? formData, 
  Map<String, dynamic>? queryParam,
  Map<String, dynamic>? headers,
}) async {
  //final String? token = await LocalStorage.getAccessToken("token");
  final String token="";
  dio.options.headers = {
    'Connection': 'keep-alive',
    'Accept': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
    if (headers != null) ...headers,
  };

  final String url = "$baseUrl$endpoint";
  debugPrint('----Request URL: $url');
  debugPrint('---Request Headers: ${dio.options.headers}');
  debugPrint('---Request Query Parameters: $queryParam');
  debugPrint('---Request Data: ${data ?? formData}');

  try {
    Response response;
    switch (type) {
      case RequestType.get:
        response = await dio.get(url, queryParameters: queryParam);
        break;
      case RequestType.post:
        if (formData != null && formData is FormData) {
          
          response = await dio.post(url, data: formData);
        } else {
          response = await dio.post(url, data: data);
        }
        break;
      case RequestType.put:
        response = await dio.put(url, data: data);
        break;
      case RequestType.delete:
        response = await dio.delete(url);
        break;
      case RequestType.patch:
        response = await dio.patch(url, data: data);
        break;
      default:
        throw ServerException(message: 'Unsupported HTTP method type: $type');
    }

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response;
    } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
      
      throw ServerException(message: 'Client error: ${response.statusMessage}');
    } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
      throw ServerException(message: 'Server error: ${response.statusMessage}');
    } else {
      throw ServerException(
          message: 'Unexpected status code: ${response.statusCode}');
    }
  } catch (e) {
    print("----e: ${e}");
    Logger().e(e.toString());
    throw ServerException(message: 'Unexpected error: $e');
  }
}

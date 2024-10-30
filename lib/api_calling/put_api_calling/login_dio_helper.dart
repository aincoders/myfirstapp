// api_service.dart

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'login_model.dart';

class ApiService {

  final Dio _dio = Dio();

  ApiService() {
    // Set base options for Dio
    _dio.options.baseUrl = 'http://192.168.0.109:3355/';
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 5); // 5 seconds
  }

  ///Post Api--->
  Future<int?> postUserEmail(String? email) async {
    try {
      final response = await _dio.post(
        'user/email',
        data: {
          'email': email,
        },
      );

      return response.statusCode;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }




  ///Get Api--->
  Future<List<UserModel>> getUserItem() async {
    try {
      final response = await _dio.get('user/email');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['data']; // Adjust if data is nested
        List<UserModel> secondDemo =
        jsonList.map((json) => UserModel.fromJson(json)).toList();
        return secondDemo;
      } else {
        throw Exception('Failed to fetch emails: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Error fetching data: $e');
      rethrow;
    }
  }



  Future<int?> updateUserEmail(int? id, String? email) async {
    debugPrint("Email=--->$email");
    try {
      final response = await _dio.put(
        'user/email/$id',
        data: {
          'email': email,
        },
      );
      debugPrint("Response-=--->${response.data}");
        return response.statusCode;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }





  ///Put Api--->
  // Future<void> updateUserEmail(int? id, String? email) async {
  //   debugPrint("Email=--->$email");
  //   try {
  //     final response = await _dio.put(
  //       'user/email/$id',
  //       data: {
  //         'email': email,
  //       },
  //     );
  //     debugPrint("Response-=--->${response.data}");
  //     if (response.statusCode == 200) {
  //       // Update successful
  //       return;
  //     } else {
  //       throw Exception('Failed to update email: ${response.statusMessage}');
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       throw Exception('Server error: ${e.response!.statusCode}');
  //     } else {
  //       throw Exception('Network error: ${e.message}');
  //     }
  //   }
  // }


  ///Delete Api--->
  Future<void> deleteUserEmail(int userId) async {
    try {
      final response = await _dio.delete('user/email/$userId');

      if (response.statusCode == 200) {
        // Assuming 200 status code indicates success
        return; // Successfully deleted, no need to return anything
      } else {
        throw Exception('Failed to delete email: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }
}



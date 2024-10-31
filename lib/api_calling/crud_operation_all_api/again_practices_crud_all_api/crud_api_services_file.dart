// api_service.dart

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:myfirstapp/api_calling/crud_operation_all_api/again_practices_crud_all_api/crud_api_data_model.dart';

class CrudApiServicesFile {

  final Dio _dio = Dio();

  CrudApiServicesFile() {
    // Set base options for Dio
    _dio.options.baseUrl = 'http://192.168.0.111:2023/';
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 5); // 5 seconds
  }

  ///Post Api--->
  Future<int?> postUser(String name, String email, String phoneNumber) async {
    try {
      final response = await _dio.post(
        'user/create',
        data: {
          'user_name': name,
          'user_email': email,
          'user_phonenumber': phoneNumber,
        },
      );
      debugPrint("Response-=--->${response.data}");
      return response.statusCode;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint("Response-=--->${e.response?.data}");
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        debugPrint("Response-=--->${e.response?.data}");
        throw Exception('Network error: ${e.message}');
      }
    }
  }


  ///Get Api--->
  Future<List<CrudApiDataModel>> getUserItem() async {
    try {
      final response = await _dio.get('user/get');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data['data']; // Adjust if data is nested
        List<CrudApiDataModel> secondDemo =
        jsonList.map((json) => CrudApiDataModel.fromJson(json)).toList();
        return secondDemo;
      } else {
        throw Exception('Failed to fetch emails: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      debugPrint('Error fetching data: $e');
      rethrow;
    }
  }


  ///Put Api--->
  Future<int?> updateUserEmail(int? user_id, String? user_name, String? user_email, String? user_phonenumber) async {
    debugPrint("Email=--->$user_name");
    try {
      final response = await _dio.put(
        'user/create/$user_name',
        data: {
          'user_id': user_id,
          'user_name': user_name,
          'user_email': user_email,
          'user_phonenumber': user_phonenumber,
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

  ///Delete Api--->
  Future<void> deleteUserEmail(int userId) async {
    try {
      final response = await _dio.delete('user/delete/$userId');

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



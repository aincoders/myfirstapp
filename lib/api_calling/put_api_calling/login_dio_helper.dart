// api_service.dart

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'login_model.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    // Set base options for Dio
    _dio.options.baseUrl = 'http://192.168.0.109:3355/';
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 5); // 5 seconds
  }

  // POST request to add email
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


  Future<int?> getUserItem(int? id) async {
    try {
      final response = await _dio.get('user/email$id');
      print("Result Statuscode-=-=->${response.statusCode}");
      return response.statusCode;
    } on DioException catch (e){
      if(e.response != null){
        throw Exception('Server error: ${e.response!.statusCode}');
      }
      else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }




  // GET request to retrieve emails
  // Future<List<UserModel>> getUserEmails() async {
  //   try {
  //     final response = await _dio.get('user/email');
  //
  //     if (response.statusCode == 200) {
  //       List<dynamic> data = response.data['data'];
  //       return data.map((json) => UserModel.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Failed to fetch emails: ${response.statusMessage}');
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       throw Exception('Server error: ${e.response!.statusCode}');
  //     } else {
  //       throw Exception('Network error: ${e.message}');
  //     }
  //   }
  // }

  // Update Api

  Future<void> updateUserEmail(int? id, String? email) async {
    debugPrint("Email=--->$email");
    try {
      final response = await _dio.put('user/email/$id',
        data: {
          'email': email,
        },
      );
      debugPrint("Response-=--->${response.data}");

      if (response.statusCode == 200) {
        // Update successful
        return;
      } else {
        throw Exception('Failed to update email: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }

// api_service.dart

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

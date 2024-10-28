// api_service.dart

import 'package:dio/dio.dart';
import 'login_model.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    // Set base options for Dio
    _dio.options.baseUrl = 'http://192.168.0.109:3355';
    _dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    _dio.options.receiveTimeout = const Duration(seconds: 5); // 5 seconds
  }

  // POST request to add email
  Future<int?> postUserEmail(UserModel user) async {
    try {
      final response = await _dio.post(
        '/user/email',
        data: user.toJson(),
      );

      return response.statusCode;

      // if (response.statusCode == 200 || response.statusCode == 201) {
      //   return UserModel.fromJson(response.data);
      // } else {
      //   throw Exception('Failed to post email: ${response.statusMessage}');
      // }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    }
  }

  // GET request to retrieve emails
  Future<List<UserModel>> getUserEmails() async {
    try {
      final response = await _dio.get('/user/emailget');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch emails: ${response.statusMessage}');
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

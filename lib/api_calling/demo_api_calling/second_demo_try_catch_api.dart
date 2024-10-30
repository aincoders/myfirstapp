import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'second_demo_api_data_model.dart';

final Dio dio = Dio();

Future<List<SecondDemoApiDataModel>> getSecondDemo() async {
  try {
    final response = await dio.get('https://fakestoreapi.com/products');
    if (kDebugMode) {
      debugPrint("Fetched products successfully");
      print(response.data);
    }
    List<dynamic> jsonList = response.data;
    List<SecondDemoApiDataModel> secondDemo =
    jsonList.map((json) => SecondDemoApiDataModel.fromJson(json)).toList();
    return secondDemo;
  } catch (e) {
    debugPrint('Error fetching data: $e');
    rethrow;
  }
}

Future<int> deleteSecondDemo(int? id) async {
  final url = 'https://fakestoreapi.com/products/$id'; // Specify the ID of the item to delete
  try {
    final response = await http.delete(Uri.parse(url));
    print("Result Statuscode-=-=->${response.statusCode}");
    return response.statusCode;
  } catch (e) {
    debugPrint('Error deleting item: $e');
    rethrow;
  }
}


Future<int> postRequestSecondDemo(String? user) async {
  final url = 'https://fakestoreapi.com/products/$user'; // Specify the ID of the item to delete
  try {
    final response = await http.delete(Uri.parse(url));
    print("Result Statuscode-=-=->${response.statusCode}");
    return response.statusCode;
  } catch (e) {
    debugPrint('Error deleting item: $e');
    rethrow;
  }
}

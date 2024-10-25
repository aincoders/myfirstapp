import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:myfirstapp/api_calling/photo_dummy_api_data_model.dart';
import 'api_data_model_file.dart';

final Dio dio = Dio();

Future<List<CountryInfo>> getCountryListApiRequest() async {
  try {
    final response = await dio.get('http://192.168.0.180:8000/country');
    if (kDebugMode) {
      debugPrint("🔥🔥🔥🔥🔥 API Response Country List: ${response.data} 🔥🔥🔥🔥🔥");
    }
    List<dynamic> jsonList = response.data['result'];
    List<CountryInfo> countryList =
    jsonList.map((json) => CountryInfo.fromJson(json)).toList();
    return countryList;
  } catch (e) {
    debugPrint("Error: $e");
    rethrow;
  }
}

Future<List<PhotoInfo>> fetchPhotos() async {
  try {
    final response = await dio.get('https://fakestoreapi.com/products?limit=50');
    if (kDebugMode) {
      debugPrint("🔥🔥🔥🔥🔥 API Response Country List: ${response.data} 🔥🔥🔥🔥🔥");
    }
    List<dynamic> data = response.data;
    List<PhotoInfo> photoList = data.map((json) => PhotoInfo.fromJson(json)).toList();
    return photoList;
  } catch (e) {
    debugPrint("Error: $e");
    throw Exception("Failed to load photos: $e");
  }
}
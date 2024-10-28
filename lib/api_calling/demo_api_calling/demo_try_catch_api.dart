import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'demo_api_data_model.dart';

final Dio dio  = Dio();

Future<List<DemoApiDataModel>> getPhotos() async {
  try {
    final response = await dio.get('https://jsonplaceholder.typicode.com/comments?postId=1');
    if (kDebugMode) {
      debugPrint("🔥🔥🔥🔥🔥 API Response Country List: ${response.data} 🔥🔥🔥🔥🔥");
    }
    List<dynamic> jsonList = response.data;
    List<DemoApiDataModel> DemoDataList = jsonList.map((json) => DemoApiDataModel.fromJson(json)).toList();
    return DemoDataList;
  } catch (e) {
    debugPrint("Error: $e");
    rethrow;
  }
}


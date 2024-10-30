import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:myfirstapp/api_calling/crud_operation_all_api/again_practices_crud_all_api/crud_api_data_model.dart';
import 'package:myfirstapp/api_calling/crud_operation_all_api/login_dio_helper.dart';

class CrudApiServicesFile{
  final Dio _dio = Dio();

  CrudApiServicesFile(){

    _dio.options.baseUrl = 'http://192.168.0.109:2023/';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);

  }
  
  Future<List<CrudApiDataModel>> getUserInfo() async{
    try{
      final response = await _dio.get('user/get');
      if (response.statusCode == 200){
        List<dynamic> jsonList = response.data['data'];
        List<CrudApiDataModel> allList = jsonList.map((json)=> CrudApiDataModel.fromJson(json)).toList();
        return allList;
      }else{
        throw Exception('${response.statusMessage}');
      }
    } on DioException catch (e){
      debugPrint('Error fetching data: $e');
      rethrow;
    }
  }

}


import 'package:admn_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {

  static Dio _dio = Dio();

  static void configureDio(){
    _dio.options.baseUrl ='http://localhost:8080/api';
    _dio.options.headers ={
      'x-token': LocalStorage.prefs.getString('token') ?? ''

    };
  }


  static Future httpGet(String pathUrl) async{

    try{
      final resp = await _dio.get(pathUrl);
      return resp.data;

    }
    catch(error){
      print(error);

    }

  }


   static Future httpPost(String pathUrl,Map<String,dynamic> data) async{

    final formData = FormData.fromMap(data);

    try{
      final resp = await _dio.post(pathUrl,data: formData);
      return resp.data;

    }
    catch(error){
      print(error);
      throw ('Error en el post');

    }

  }




}
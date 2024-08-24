

import 'package:admn_dashboard/api/CafeApi.dart';
import 'package:admn_dashboard/models/http/auth_response.dart';
import 'package:admn_dashboard/models/usuario.dart';
import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/services/local_storage.dart';
import 'package:admn_dashboard/services/navigation_service.dart';
import 'package:admn_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';


enum AuthStatus {
  cheching,
  authenticated,
  noAuthenticated
}


class AuthProvider extends ChangeNotifier{

  String? _token;
  AuthStatus authStatus = AuthStatus.cheching;
  Usuario? user;


  AuthProvider(){
    isAuth();
  }


  login(String email, String password){

    final data = {    
    'correo': email,
    'password': password   
    };

    CafeApi.httpPost('/auth/login', data).then((value){
      print(value);

      final authRespone = AuthResponse.fromJson(value);
      user = authRespone.usuario;
      authStatus= AuthStatus.authenticated;
      LocalStorage.prefs.setString('token',authRespone.token);  
      NavigationService.replaceTo(Flurorouter.dashBoardRoute); 
      CafeApi.configureDio(); 
      notifyListeners();


    } 
    ).catchError((error){
      print('Erorr en: $error');

      NotificationsService.showSnackBarError('credenciales no válidas');
    }); 

    //isAuth();
  }


  register(String email, String password,String name){

    final data = {
    'nombre': name,
    'correo': email,
    'password': password
   
    };

    CafeApi.httpPost('/usuarios', data).then((value){
      print(value);

      final authRespone = AuthResponse.fromJson(value);
      user = authRespone.usuario;
      authStatus= AuthStatus.authenticated;
      LocalStorage.prefs.setString('token',authRespone.token);  
      CafeApi.configureDio(); 
      NavigationService.replaceTo(Flurorouter.dashBoardRoute);  
      notifyListeners();


    } 
    ).catchError((error){
      print('Erorr en: $error');

      NotificationsService.showSnackBarError('credenciales no válidas');
    });    
  

    //isAuth();
  }





Future<bool>isAuth() async{

  if(LocalStorage.prefs.getString('token') == null){
    authStatus = AuthStatus.noAuthenticated;
    notifyListeners();
    return false;
  }


  try{

    final resp = await CafeApi.httpGet('/auth');
    final authResponse = AuthResponse.fromJson(resp);
    user = authResponse.usuario;
    LocalStorage.prefs.setString('token', authResponse.token);
    authStatus= AuthStatus.authenticated;
    notifyListeners();
    return true;

  }
  catch(error){
    print(error);
    authStatus = AuthStatus.noAuthenticated;
    notifyListeners();
    return false;
  }
  // await Future.delayed(const Duration(seconds: 2));
  // authStatus= AuthStatus.authenticated;
  // notifyListeners();
  
  //return true;


}

logOut(){
  LocalStorage.prefs.remove('token');
  authStatus = AuthStatus.noAuthenticated;
  notifyListeners();
}



}
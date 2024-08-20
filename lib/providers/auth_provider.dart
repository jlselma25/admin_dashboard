

import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/services/local_storage.dart';
import 'package:admn_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';


enum AuthStatus {
  cheching,
  authenticated,
  noAuthenticated
}


class AuthProvider extends ChangeNotifier{

  String? _token;
  AuthStatus authStatus = AuthStatus.cheching;


  AuthProvider(){
    isAuth();
  }


  login(String email, String password){

    _token = 'almacenar token: GFFDFDGDFGDF.?¿¡¡-llpkkkjdd.!!!fdfdgfcxzx';
    print('Token JWT: $_token');
    LocalStorage.prefs.setString('token',_token!);
    
    authStatus= AuthStatus.authenticated; 
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashBoardRoute);

    //isAuth();
  }




Future<bool>isAuth() async{

  if(LocalStorage.prefs.getString('token') == null){
    authStatus = AuthStatus.noAuthenticated;
    notifyListeners();
    return false;
  }

  await Future.delayed(const Duration(seconds: 2));
  authStatus= AuthStatus.authenticated;
  notifyListeners();
  
  return true;


}



}
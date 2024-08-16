


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> keyForm =  GlobalKey<FormState>();

  

  String email = '';
  String password = '';

  

  bool validateForm(){
   if( keyForm.currentState!.validate()){

    // print(email);
    // print(password);
    return true;   
   }

   return false;
  }

}
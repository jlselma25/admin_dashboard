

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{

  GlobalKey<FormState> keyForm =  GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

   validateForm(){
   if( keyForm.currentState!.validate()){

    print(email);
    print(password);
    print(name);
   }
  }

}
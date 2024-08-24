

import 'package:admn_dashboard/api/CafeApi.dart';
import 'package:admn_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier{

  Usuario? user;
  GlobalKey<FormState> keyForm =  GlobalKey<FormState>();


  void updateListener(){
      notifyListeners();
  }

  bool _validateForm(){
   if( keyForm.currentState!.validate()){
    return true;   
   }
   return false;
  }


 Future updateUser() async{     

      if(!_validateForm()) return;    

      final data =
        {
          'nombre': user!.nombre,
          'correo': user!.correo           
       };

      try{

        await CafeApi.Put('/usuarios/${user!.uid}', data);  
        return true;

      }
       catch(e){
        return false;
        
      }



  }




}
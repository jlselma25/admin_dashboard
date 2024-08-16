import 'package:flutter/material.dart';


class CustomInput  {


  static  InputDecoration loginInputDecoration({required String hint,required String label,required IconData icon}){
    return  InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow.withOpacity(0.3)
       ),  
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow.withOpacity(0.3)
       ),  
      ), 
      hintText: hint,
      labelText:label,
      prefixIcon:Icon(icon,color: Colors.grey,),
      hintStyle:const TextStyle(color: Colors.grey),      
      labelStyle:const TextStyle(color: Colors.grey),
      


    );
  }

}
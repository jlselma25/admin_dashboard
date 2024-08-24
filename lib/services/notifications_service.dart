
import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String message){

    final snackBar = SnackBar(
      content: Text(message,style: const TextStyle(color:Colors.white,fontSize: 20),),
      backgroundColor: Colors.red.withOpacity(0.9),
      );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

  static showSnackBar(String message){

    final snackBar = SnackBar(
      content: Text(message,style: const TextStyle(color:Colors.white,fontSize: 20),),
      backgroundColor: Colors.green.withOpacity(0.9),
      );

    messengerKey.currentState!.showSnackBar(snackBar);

  }


}
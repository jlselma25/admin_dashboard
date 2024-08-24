
import 'package:admn_dashboard/api/CafeApi.dart';
import 'package:admn_dashboard/models/http/users_response.dart';
import 'package:admn_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier{

  List<Usuario> users = [];
  bool isLoading = true;
  bool asc = true;
  int? sortColumnIndex;

  UsersProvider(){
    getPaginateUsers();
  }
  


  getPaginateUsers()async{

    final resp = await CafeApi.httpGet('/usuarios?limite=10&desde=0');

    final json = UsersResponse.fromJson(resp);
    users = [...json.usuarios];
    
    isLoading = false;
    notifyListeners();

  }

 Future<Usuario?> getUserById(String uid) async{

    try{
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromJson(resp);
      notifyListeners();
      return user;
    }
    catch(e){
      return null;

    }
    
  }

  sortList(int colIndex){

    switch(colIndex){
      case 1:
      asc == false 
        ? users.sort((a, b) => b.nombre.compareTo(a.nombre))
        : users.sort((a, b) => a.nombre.compareTo(b.nombre));
      break;

      case 2:
       users.sort((a, b) => b.correo.compareTo(a.correo));
      break;
    }

    asc = !asc;

    notifyListeners();
  }


  void sort<T>(Comparable<T>Function(Usuario users) getFiedl){

    users.sort((a,b){
      final aValue = getFiedl(a);
      final bValue = getFiedl(b);

      return asc == false
      ? Comparable.compare(bValue, aValue)
      : Comparable.compare(aValue, bValue);
    }
    );

    asc = !asc;

    notifyListeners();
  }


  refreshUser(Usuario newUser){

        users = users.map(
          (c){
            if(c.uid != newUser.uid) return c;
            c.nombre =  newUser.nombre;
            c.correo = newUser.correo;
            return c;
          }         
        
        ).toList();




    notifyListeners();
  }
    

}
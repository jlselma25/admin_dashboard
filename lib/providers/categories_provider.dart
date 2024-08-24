

import 'package:admn_dashboard/api/CafeApi.dart';
import 'package:admn_dashboard/models/category.dart';
import 'package:admn_dashboard/models/http/categories_response.dart';
import 'package:admn_dashboard/services/local_storage.dart';
import 'package:flutter/foundation.dart';

class CategoriesProvider extends ChangeNotifier{
  List<Categoria> categories = [];

  getCategories()async{

    final resp = await CafeApi.httpGet('/categorias');

    final categoriesResponse = CategoriesResponse.fromJson(resp);
    categories =  categoriesResponse.categorias;
    print(categories);
    notifyListeners();

  }

  Future newCategory(String name) async{

    final data = {    
    'nombre': name 
    };

    try{
      final  json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromJson(json);
      categories.add(newCategory);
      notifyListeners();

    }
    catch(e){
      throw('Error al crear');
    }   
    
  }

    Future updateCategory(String id,String name) async{
      

      final data = {    
      'nombre': name 
      };

      try{
    
        await CafeApi.Put('/categorias/$id', data);    

        categories = categories.map(
          (c){
            if(c.id != id) return c;
            c.nombre = name;
            return c;
          }         
        
        ).toList();

        // int index = categories.indexWhere((item) => item.id== id);  esto es otra forma de actulizar la lista de categorias

        // if (index != -1) { 
        //   categories[index].nombre= name; 
        // }

        notifyListeners();

    }
    catch(e){
      throw('Error al actualizar');

    }   
    
  }


  Future deleteCategory(String id) async{
      

  
      try{
    
        await CafeApi.delete('/categorias/$id');    

        categories.removeWhere((c) => c.id == id) ;

        // int index = categories.indexWhere((item) => item.id== id);  

        // if (index != -1) {
        //   categories.removeAt(index);
        // }

        notifyListeners();

    }
    catch(e){
      print(e);
    }   
    
  }
}
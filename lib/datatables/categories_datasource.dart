

import 'package:admn_dashboard/models/category.dart';
import 'package:admn_dashboard/providers/categories_provider.dart';
import 'package:admn_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource{

  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS( this.categorias, this.context);


  @override
  DataRow getRow(int index) {

    return DataRow.byIndex(
      index: index,
      cells: [

        DataCell(Text(categorias[index].id)),
        DataCell(Text(categorias[index].nombre)),
        DataCell(Text(categorias[index].usuario.nombre)),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: (){
                   showGeneralDialog(
                      context: context,
                      barrierDismissible: false,               
                      pageBuilder: (context, animation1, animation2) {
                        return  Align(
                          alignment: Alignment.bottomCenter,     
                            child: CateogryModal(category: categorias[index] ,)       
                            
                        );
                      },
                   );
                }, 
                icon: const Icon(Icons.mode_edit_outline_outlined)
              ),
              IconButton(
                onPressed: (){
                  final alert = _alertDialog(index);

                  showDialog(context: context, builder:( _ ) => alert);

                }, 
                icon: Icon(Icons.delete_outline,color: Colors.red.withOpacity(0.8)    ,)
              )
            ],
          )

        ),

      ]
      );

  }
 

  @override 
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;




   AlertDialog _alertDialog(int index) {

    final categories = Provider.of<CategoriesProvider>(context,listen: false);

    return AlertDialog(
                  title: const Text('Va a eliinar un registro, desea continuar?'),
                  content: Text('Eliminar ${categorias[index].nombre} ?'),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        
                      }, 
                      child: const Text('No')
                    ),

                    TextButton(
                      onPressed: ()async{

                        await categories.deleteCategory(categorias[index].id);
                        Navigator.pop(context);


                      }, 
                      child: const Text('Si')
                    )
                  ],
                );
  }

}
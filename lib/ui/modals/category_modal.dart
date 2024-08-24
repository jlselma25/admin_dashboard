import 'package:admn_dashboard/models/category.dart';
import 'package:admn_dashboard/providers/categories_provider.dart';
import 'package:admn_dashboard/services/notifications_service.dart';
import 'package:admn_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admn_dashboard/ui/inputs/custom_input.dart';
import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CateogryModal extends StatefulWidget {

  final Categoria? category;

  const CateogryModal({
    super.key, 
    this.category
    });

  @override
  State<CateogryModal> createState() => _CateogryModalState();
}

class _CateogryModalState extends State<CateogryModal> {
  

  String nombre ='';
  String? id;

  @override
  void initState() {    
    super.initState();

    id= widget.category?.id;
    nombre = widget.category?.nombre ?? '';

  }

  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoriesProvider>(context,listen: false);    
    return Container(
      height: 500,         
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(widget.category?.nombre ?? 'Nueva categoria',style: CustomLabel.h1.copyWith(color: Colors.white),),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(), 
                icon: const Icon(Icons.close, color: Colors.white,)
              )
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),

          const SizedBox(height: 30,),

          TextFormField(
            initialValue: widget.category?.nombre  ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInput.loginInputDecoration(
              hint: 'Nombre de la categoria', 
              label: 'Categoria', 
              icon: Icons.new_releases_outlined
              ),
            style: const TextStyle(color: Colors.white),
          ),
          
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: ()async{

                try{

                  if (id == null){
                      await categoryProvider.newCategory(nombre);
                      NotificationsService.showSnackBar('$nombre creada correctamente!!');
                    }
                    else{
                      await categoryProvider.updateCategory(id!, nombre);
                      NotificationsService.showSnackBar('$nombre actualizada correctamente!!');
                    }

                    Navigator.of(context).pop();
                }                
                catch(e){
                      Navigator.of(context).pop();
                      NotificationsService.showSnackBarError('Error al crear categoria');
                }
              },

              text: 'Guardar',
              color: Colors.white,
              
              )
              ,
          )
        ],
      ),
    );
  }
}

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only( topLeft:  Radius.circular(20), topRight: Radius.circular(20) ),
    color: Color(0xff0F2041),
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );